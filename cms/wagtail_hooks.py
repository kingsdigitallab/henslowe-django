from django.utils.html import format_html_join
from django.conf import settings

import wagtail.admin.rich_text.editors.draftail.features as draftail_features
from wagtail.core import hooks

from .rich_text import AnchorEntityElementHandler, anchor_entity_decorator, AnchorIDEntityElementHandler, anchorid_entity_decorator

"""
The anchor extension to the rich text editor was written by Thibaud
Colas, available at
https://github.com/thibaudcolas/wagtail_draftail_experiments.
"""
@hooks.register('register_rich_text_features')
def register_rich_text_features(features):
    """Registering the `anchor` feature, which uses the `ANCHOR` Draft.js
    entity type, and is stored as HTML with a `<a data-anchor
    href="#my-anchor">` tag."""
    features.default_features.append('anchor')
    feature_name = 'anchor'
    type_ = 'ANCHOR'

    control = {
        'type': type_,
        'label': '#',
        'description': 'Anchor',
    }

    features.register_editor_plugin(
        'draftail', feature_name, draftail_features.EntityFeature(control)
    )

    features.register_converter_rule('contentstate', feature_name, {
        # Note here that the conversion is more complicated than for
        # blocks and inline styles.
        'from_database_format': {
            'a[data-anchor]': AnchorEntityElementHandler(type_)
        },
        'to_database_format': {
            'entity_decorators': {type_: anchor_entity_decorator}
        },
    })


"""
An extension of extension developed by King's Digital Lab to connect anchors with html blocks through id's
"""
@hooks.register('register_rich_text_features')
def register_anchorid_features(features):
    features.default_features.append('anchorid')
    feature_name = 'anchorid'
    type_ = 'ANCHORID'

    control = {
        'type': type_,
        'label': '<id>',
        'description': 'ID attribute'
    }

    features.register_editor_plugin(
        'draftail', feature_name, draftail_features.EntityFeature(control)
    )

    features.register_converter_rule('contentstate', feature_name, {
        'from_database_format': {'span': AnchorIDEntityElementHandler(type_)},
        'to_database_format': {'entity_decorators': {type_: anchorid_entity_decorator}},
    })


@hooks.register('insert_editor_js')
def insert_editor_js():
    js_files = [
        # We require this file here to make sure it is loaded before the other.
        'wagtailadmin/js/draftail.js',
        'js/wagtail_draftail_anchor.js',
    ]
    js_includes = format_html_join(
        '\n', '<script src="{0}{1}"></script>',
        ((settings.STATIC_URL, filename) for filename in js_files)
    )
    return js_includes
