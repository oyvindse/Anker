using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Math;
using Toybox.Lang as Lang;
using Toybox.Application as App;
using Toybox.Time as Time;


class AnchorImageClass extends Ui.Drawable {
	
	hidden var mAnchorImagePath, mAnchorImage;
	var anchorStyle;
	var bmp;
	
	function initialize(params) {
	        // You should always call the parent's initializer and
	        // in this case you should pass the params along as size
	        // and location values may be defined.
	        Drawable.initialize(params);
	     
	        anchorStyle = App.getApp().getProperty("AnchorColor");
	        bmp = anchorStyle == 0 ? Ui.loadResource(Rez.Drawables.Anchor) : Ui.loadResource(Rez.Drawables.AnchorBlue);
    }
    
    function draw(dc) {
        dc.drawBitmap(dc.getWidth() / 2 - bmp.getWidth() / 2, dc.getHeight() / 2 - dc.getHeight() / 6 - bmp.getHeight() / 2, bmp);
    }
}