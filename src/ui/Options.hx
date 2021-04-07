package ui;

import hxd.Res;
import h2d.Graphics;
import h2d.Slider;
import h2d.Flow;
import h2d.Object;
import hxd.Event;
import h2d.Interactive;
import h2d.Bitmap;
import h2d.Tile;

class Options {
	var bg:Graphics;

	public static var shown:Bool = false;
	public static var inst:Options;

	public function new() {
		// // super(100,100);
		// // {

		// // }
		// // bg = new Graphics(this);
		// // drawBg();
		// shown = true;
		// inst = this;
		// var flow = new Flow();
		// @:privateAccess Main.layers.add(flow,NOTIFICATION_LAYER + 1);
		// flow.backgroundTile = Res.ui.button.toTile();
		// // flow.setPosition((width - 410) / 2, (height - 400) / 2);
		// flow.layout = Horizontal;
		// {
		// 	var f = new Flow(flow);
		// 	f.horizontalAlign = Middle;
		// 	f.layout = Vertical;
		// 	f.verticalSpacing = 3;

		// 	var s = new Slider(400, 20, f);
		// 	// s.value = Main.audio.musicVolume;
		// 	s.onChange = function() {
		// 		// Main.audio.musicVolume = s.value;
		// 	}
		// 	var s2 = new Slider(400, 20, f);
		// 	// s2.value = Main.audio.sfxGroup.volume;
		// 	s2.onChange = function() {
		// 		// Main.audio.sfxGroup.volume = s2.value;
		// 	}

		// 	if (Main.screen != null && !(Main.screen is TitleScreen))
		// 		f.addChild(Button.createRect("Exit Game", (_) -> Main.exit()));
		// }
		// flow.addChild(Button.createSquare("X", function(_) {
		// 	// doClose();
		// }));
	}

	public static function toggle() {}
}
