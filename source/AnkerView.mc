using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Math;
using Toybox.Lang as Lang;
using Toybox.Application as App;
using Toybox.Time as Time;

class AnkerView extends Ui.WatchFace
{
    var bmp;

	function initialize() {
        WatchFace.initialize();
    }
    
    function onLayout(dc)
    {
        bmp = Ui.loadResource(Rez.Drawables.Anchor);
    }

    function onShow()
    {
    }

    function onUpdate(dc)
    {
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        
        dc.drawText(dc.getWidth()/2, (dc.getHeight() - dc.getHeight() / 2.5) , Gfx.FONT_NUMBER_HOT, getTime(), Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText(50, (dc.getHeight() - dc.getHeight() / 2) , Gfx.FONT_SMALL, getMonth(), Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText(dc.getWidth()-50, (dc.getHeight() - dc.getHeight() / 2) , Gfx.FONT_SMALL, getDay(), Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawBitmap(dc.getWidth() / 2 - bmp.getWidth() / 2, dc.getHeight() / 2 - dc.getHeight() / 6 - bmp.getHeight() / 2, bmp);
    }
   	
   	hidden function getTime()
    {
        var clockTime = Sys.getClockTime();
        var hour = clockTime.hour;
        if(!System.getDeviceSettings().is24Hour && hour > 12) {
        	hour = hour - 12;
        }
        
        return hour.format("%02d") + ":" + clockTime.min.format("%02d");
    }
    
    hidden function getDay()
    {
		var now = Time.now();
        var info = Time.Gregorian.info(now, Time.FORMAT_LONG);

        return Lang.format("$1$", [info.day]);
    }
    
    hidden function getMonth()
    {
		var now = Time.now();
        var info = Time.Gregorian.info(now, Time.FORMAT_LONG);

        return Lang.format("$1$", [info.month]);
    }
}