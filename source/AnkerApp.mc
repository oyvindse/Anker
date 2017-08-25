using Toybox.Application as App;

class AnkerApp extends App.AppBase{
	function initialize() {
        AppBase.initialize();
    }
    
    function onStart(state)
    {
    }

    function getInitialView()
    {
        return [new AnkerView()];
    }

    function onStop(state)
    {
    }
}