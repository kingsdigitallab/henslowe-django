// Enables openseadragon viewers
function init_openseadragon()
{
    $('.osd-viewer').each(function()
    {
        var id = $(this).attr('id');
        var url = $(this).attr('data-image-url');

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
          "height": 7200,
          "width": 5233,
          "profile": [ "http://iiif.io/api/image/2/level2.json" ],
          "protocol": "http://iiif.io/api/image",
          "tiles": [{
            "scaleFactors": [ 1, 2, 4, 8, 16, 32 ],
            "width": 256
          }]
        }]
    });
    });
    

}

$(function() {
    init_openseadragon();
});