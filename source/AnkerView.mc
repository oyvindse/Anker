using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Math;
using Toybox.Lang as Lang;
using Toybox.Application as App;
using Toybox.Time as Time;

var gBackgroundColor;

class AnkerView extends Ui.WatchFace
{
	function initialize() {
        WatchFace.initialize();
    }
    
    function onLayout(dc)
    {
        
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    function onShow()
    {
    }

    function onUpdate(dc)
    {
    	var timeColor = App.getApp().getProperty("TimeColor").toNumber();
        var monthColor = App.getApp().getProperty("MonthColor").toNumber();
        var dayColor = App.getApp().getProperty("DayColor").toNumber();
       	gBackgroundColor = App.getApp().getProperty("BackgroundColor").toNumber();
    
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        dc.clear();
        
        var timeDisplay = View.findDrawableById("TimeLabel");
        timeDisplay.setColor(timeColor);
        timeDisplay.setText(getTime());
        
        var monthDisplay = View.findDrawableById("MonthLabel");
        monthDisplay.setColor(monthColor);
        monthDisplay.setText(getMonth());
        
        var dateDisplay = View.findDrawableById("DateLabel");
        dateDisplay.setColor(dayColor);
        dateDisplay.setText(getDay());
        
        View.onUpdate(dc);
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