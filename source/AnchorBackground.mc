using Toybox.WatchUi as Ui;
using Toybox.Application as App;
using Toybox.Graphics as Gfx;

class Background extends Ui.Drawable {

	function initialize() {
		Drawable.initialize({ :identifier => "Background" });
	}

	function draw(dc) {
		dc.setColor(Gfx.COLOR_TRANSPARENT, gBackgroundColor);
		dc.clear();
	}
}