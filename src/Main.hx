package;

import ui.Screen;
import h2d.Layers;
import util.ModHandler;

class Main extends hxd.App {
	public static var inst(default, null):Main;
	public static var dispatcher = new SignalDispatcher();
	public static var screen(default, set):ui.Screen;
	static var layers:h2d.Layers;

	static inline function set_screen(s:ui.Screen):ui.Screen {
		switchScreen(s);
		screen = s;
		return s;
	}

	static function main() {
		#if js
		hxd.Res.initEmbed();
		#else
		hxd.Res.initLocal();
		#end
		inst = new Main();
	}

	public static function switchScreen(s:Screen) {
		if (layers != null) {
			screen.remove();
			layers.add(s, SCREEN_LAYER);
		}
	}

	override function init() {
		hxd.Window.getInstance().onClose = function() {
			exit();
			return true;
		}
		s2d.scaleMode = LetterBox(WIDTH, HEIGHT, true, Center, Center);
		
		layers = new Layers(s2d);
		screen = new TitleScreen();
	}

	override function loadAssets(onLoaded:() -> Void) {
		ModHandler.loadData(() -> {}, onLoaded);
	}

	override function update(dt:Float) {}

	public static function exit() {
		hxd.snd.Manager.get().dispose();
		hxd.System.exit();
	}
}
