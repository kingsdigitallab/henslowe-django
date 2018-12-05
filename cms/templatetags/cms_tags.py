from django import template
from django.conf import settings
from wagtail.core.models import Page

register = template.Library()


@register.filter
def next(some_list, current_index):
    """
    Returns the next element of the list using the current index if it exists.
    Otherwise returns an empty string.
    """
    try:
        return some_list[int(current_index) + 1]  # access the next element
    except Exception:
        return ''  # return empty string in case of exception


@register.filter
def previous(some_list, current_index):
    """
    Returns the previous element of the list using the current
    index if it exists. Otherwise returns an empty string.
    """
    try:
        return some_list[int(current_index) - 1]  # access the previous element
    except Exception:
        return ''  # return empty string in case of exception


@register.simple_tag
def are_comments_allowed():
    """Returns True if commenting on the site is allowed, False otherwise."""
    return getattr(settings, 'ALLOW_COMMENTS', False)


@register.simple_tag(takes_context=True)
def get_site_root(context):
    """Returns the site root Page, not the implementation-specific model used.
    Object-comparison to self will return false as objects would differ.

    :rtype: `wagtail.wagtailcore.models.Page`
    """
    return context['request'].site.root_page


@register.simple_tag
def has_view_restrictions(page):
    """Returns True if the page has view restrictions set up, False
    otherwise."""
    return page.view_restrictions.count() > 0


@register.inclusion_tag('cms/tags/main_menu.html', takes_context=True)
def main_menu(context, root, current_page=None):
    """Returns the main menu items, the children of the root page. Only live
    pages that have the show_in_menus setting on are returned. The root page
    is included in the list """
    menu_pages = Page.objects.live()\
        .descendant_of(root, inclusive=False).in_menu()

    root.active = (current_page.url == root.url
                   if current_page else False)

    for page in menu_pages:
        page.active = (current_page.url.startswith(page.url)
                       if current_page else False)

    tag_c = {'request': context['request'], 'root': root,
             'current_page': current_page, 'menu_pages': menu_pages}

    if 'q' in context:
        tag_c['q'] = context['q']

    return tag_c


@register.inclusion_tag('cms/tags/sub_menu.html', takes_context=True)
def sub_menu(context, root, current_page):
    """Returns the siblings/children of a page"""

    if current_page.get_parent() == root:
        menu_pages = current_page.get_children()
    else:
        menu_pages = current_page.get_siblings(inclusive=True)

    for page in menu_pages:
        page.active = (current_page.url.startswith(page.url)
                       if current_page else False)

    return {'request': context['request'], 'root': root,
            'menu_pages': menu_pages}


# settings value
@register.filter
def settings_value(name):
    return getattr(settings, name, None)


@register.filter
def get_breadcrumb_pages(page):
    return page.get_ancestors(False)[1:]
