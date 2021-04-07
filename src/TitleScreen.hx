package;

import h2d.Flow;
import hxd.Event;
import h2d.Bitmap;
import ui.Button;

class TitleScreen extends ui.Screen {
	override public function new() {
		super();
		addChild(
			vbox(
				new Bitmap(hxd.Res.ui.Adventure_Logo.toTile()).with(scaleX = 0.5, scaleY = 0.5),
				Button.createRect("common", "play", clickPlay),
				Button.createRect("common", "options", (_) -> ui.Options.toggle()),
				Button.createRect("common", "exit", (_) -> Main.exit())
			).with(verticalSpacing = 5,layout = Vertical)
		);
	}

	function clickPlay(e:Event) {
		Adventure.start();
		Main.screen = new LevelScreen();
	}

	function clickOptions(e:Event) {
		@:privateAccess new ui.Options();
	}
}
