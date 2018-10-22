// Enables openseadragon viewers
function init_openseadragon()
{
    if($('.osd-viewer').length)
    {
        $('.osd-viewer').each(function()
        {
            var id = $(this).attr('id');
            var url = $(this).attr('data-image-url');
            var info_url = $(this).attr('data-image-url') + '/info.json';

            $.getJSON(info_url, function(data) {

                OpenSeadragon({
                id:                 id,
                prefixUrl:          "/static/js/openseadragon/images/",
                preserveViewport:   true,
                visibilityRatio:    1,
                minZoomLevel:       1,
                defaultZoomLevel:   1,
                sequenceMode:       false,
                tileSources:   [{
                  "@context": "http://iiif.io/api/image/2/context.json",
                  "@id": url,
                  "height": data['height'],
                  "width": data['width'],
                  "profile": [ "http://iiif.io/api/image/2/level2.json" ],
                  "protocol": "http://iiif.io/api/image",
                  "tiles": [{
                    "scaleFactors": data['tiles'][0]['scaleFactors'],
                    "width": data['tiles'][0]['width']
                  }]
                }]
            });
            });
        });
    }
}

// Enables the image page selector
function init_page_selector()
{
    if($('#image_switcher').length)
    {
        $('body').on('change', '#image_switcher', function(event)
        {
            var selected = $("option:selected", this);
            window.location.href = $(selected).attr('data-url');
        });
    }
}

$(function() {
    init_openseadragon();
    init_page_selector();
});