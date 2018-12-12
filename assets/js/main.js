// Enables openseadragon viewers

var osd_viewer;
var caman = Caman;
caman.Store.put = function() {};

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

                osd_viewer = OpenSeadragon({
                id:                 id,
                prefixUrl:          "/static/vendor/openseadragon/images/",
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

        if($('#osd_modifiers').length)
        {

            function EDGES()
            {
                return function(context, callback) {
                    var imgData = context.getImageData(
                        0, 0, context.canvas.width, context.canvas.height);
                    var pixels = imgData.data;
                    var originalPixels = context.getImageData(0, 0, context.canvas.width, context.canvas.height).data;
                    var oneRowOffset = context.canvas.width * 4;
                    var onePixelOffset = 4;
                    var Gy, Gx;
                    var idx = 0;
                    for (var i = 1; i < context.canvas.height - 1; i += 1) {
                        idx = oneRowOffset * i + 4;
                        for (var j = 1; j < context.canvas.width - 1; j += 1) {
                            Gy = originalPixels[idx - onePixelOffset + oneRowOffset] + 2 * originalPixels[idx + oneRowOffset] + originalPixels[idx + onePixelOffset + oneRowOffset];
                            Gy = Gy - (originalPixels[idx - onePixelOffset - oneRowOffset] + 2 * originalPixels[idx - oneRowOffset] + originalPixels[idx + onePixelOffset - oneRowOffset]);
                            Gx = originalPixels[idx + onePixelOffset - oneRowOffset] + 2 * originalPixels[idx + onePixelOffset] + originalPixels[idx + onePixelOffset + oneRowOffset];
                            Gx = Gx - (originalPixels[idx - onePixelOffset - oneRowOffset] + 2 * originalPixels[idx - onePixelOffset] + originalPixels[idx - onePixelOffset + oneRowOffset]);
                            pixels[idx] = Math.sqrt(Gx * Gx + Gy * Gy); // 0.5*Math.abs(Gx) + 0.5*Math.abs(Gy);//100*Math.atan(Gy,Gx);
                            pixels[idx + 1] = 0;
                            pixels[idx + 2] = 0;
                            idx += 4;
                        }
                    }
                    context.putImageData(imgData, 0, 0);
                    callback();
                };
            }
            function EXPOSURE(value)
            {
                return function(context, callback) {
                    Caman(context.canvas, function() {
                        this.exposure(parseFloat(value));
                        // Do not forget to call this.render with the callback
                        this.render(callback);
                    });
                }
            }

            function SATURATION(value)
            {
                return function(context, callback) {
                    Caman(context.canvas, function() {
                        this.saturation(parseFloat(value));
                        // Do not forget to call this.render with the callback
                        this.render(callback);
                    });
                }
            }

            function VIBRANCE(value)
            {
                return function(context, callback) {
                    Caman(context.canvas, function() {
                        this.vibrance(parseFloat(value));
                        // Do not forget to call this.render with the callback
                        this.render(callback);
                    });
                }
            }
         
            function osd_update_filters()
            {
                var processors = []

                var brightness = parseFloat($("#osd_modifiers #adjustments #brightness").slider("option", "value"));
                var contrast = parseFloat($("#osd_modifiers #adjustments #contrast").slider("option", "value"));
                var exposure = parseFloat($("#osd_modifiers #adjustments #exposure").slider("option", "value"));
                var gamma = parseFloat($("#osd_modifiers #adjustments #gamma").slider("option", "value"));
                var saturation = parseFloat($("#osd_modifiers #adjustments #saturation").slider("option", "value"));
                var vibrance = parseFloat($("#osd_modifiers #adjustments #vibrance").slider("option", "value"));

                // These are standard ones:
                if(brightness != $('#brightness').attr('data-default'))
                {
                    processors.push(OpenSeadragon.Filters.BRIGHTNESS(brightness));
                }

                if(contrast != $('#contrast').attr('data-default'))
                {
                    processors.push(OpenSeadragon.Filters.CONTRAST(contrast));
                }
                

                if(gamma != $('#gamma').attr('data-default'))
                {
                    processors.push(OpenSeadragon.Filters.GAMMA(gamma));
                    
                }

                if(exposure != $('#exposure').attr('data-default'))
                {
                    processors.push(EXPOSURE(exposure));
                    
                }

                if(saturation != $('#saturation').attr('data-default'))
                {
                    processors.push(SATURATION(saturation));
                    
                }

                if(vibrance != $('#vibrance').attr('data-default'))
                {
                    processors.push(VIBRANCE(vibrance));
                }
                // These are buttons, only run if they need to:
                if($('#greyscale').hasClass('ui-state-active'))
                {
                    processors.push(OpenSeadragon.Filters.GREYSCALE());
                }

                // These are buttons, only run if they need to:
                if($('#invert').hasClass('ui-state-active'))
                {
                    processors.push(OpenSeadragon.Filters.INVERT());
                }
                
                // These are buttons, only run if they need to:
                if($('#edges').hasClass('ui-state-active'))
                {
                    processors.push(EDGES());
                }

                // These are buttons, only run if they need to:
                if($('#threshold').hasClass('ui-state-active'))
                {
                    var threshold = parseFloat($("#osd_modifiers #adjustments #thresholdlevel").slider("option", "value"));
                    processors.push(OpenSeadragon.Filters.THRESHOLDING(threshold));
                }
                
                osd_viewer.setFilterOptions({
                    filters: {
                        processors: processors,
                        loadMode: 'async'
                    }
                });
            }

            $("#osd_modifiers #adjustments .slider").each(function() {
                // read initial values from markup and remove that
                var value = parseFloat($(this).attr('data-default'));
                var min = parseFloat($(this).attr('data-min'));
                var max = parseFloat($(this).attr('data-max'));
                var step = parseFloat($(this).attr('data-step'));
                
                $( this ).slider({
                  value: value,
                  min: min,
                  max: max,
                  step: step,
                  animate: true,
                  stop: function( event, ui ) {
                    osd_update_filters();
                  }
                });
            });

            $("#osd_modifiers #adjustments .toggle").each(function()
            {
                $(this).button();
            });

            $("body").on("click", "#osd_modifiers #adjustments .toggle", function(event)
            {
                $(this).toggleClass('ui-state-active');
                if($(this).attr('data-toggle'))
                {
                    if($(this).hasClass('ui-state-active'))
                    {
                        $('#' + $(this).attr('data-toggle')).slideDown();
                    } else
                    {
                        $('#' + $(this).attr('data-toggle')).slideUp();
                    }
                }
                osd_update_filters();
            });

            $("body").on("click", "#osd_modifiers #adjustments .reset", function(event)
            {
                $("#osd_modifiers #adjustments .toggle").removeClass('ui-state-active');
                $("#osd_modifiers .hidden").slideUp();

                $("#osd_modifiers #adjustments .slider").each(function() {
                    // read initial values from markup and remove that
                    var value = parseFloat($(this).attr('data-default'));
                    $( this ).slider('value', value);
                });
                osd_update_filters();
            });

            

        }
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

// Enables the search button
function init_search_button()
{
    $('body').on('click', '.searchbutton', function(event)
    {
        $(this).parent().submit();
    });
}

$(function() {
    init_openseadragon();
    init_page_selector();
    init_search_button();
});