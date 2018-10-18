// Enables openseadragon viewers
function init_openseadragon()
{
    $('.osd-viewer').each(function()
    {
        var id = $(this).attr('id');
        var url = $(this).attr('data-image-url');
        var info_url = $(this).attr('data-image-url') + '/info.json';

        $.getJSON(info_url, function(data) {
            console.log(data);

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
              "height": data['width'],
              "width": data['height'],
              "profile": [ "http://iiif.io/api/image/2/level2.json" ],
              "protocol": "http://iiif.io/api/image",
              "tiles": [{
                "scaleFactors": [ 1, 2, 4, 8, 16, 32 ],
                "width": 1024
              }]
            }]
        });
        });
    });
    

}

$(function() {
    init_openseadragon();
});