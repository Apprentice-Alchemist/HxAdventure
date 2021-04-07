package;

import h2d.Flow;
import explore.AreaSelect;
import hxd.res.DefaultFont;
import h2d.Text;
import ui.Button;

class LevelScreen extends ui.Screen {
	var text:Text;
	var tip:Text;
	var stats:Text;
	// var flow:Flow;

	public function new() {
		super();
		// addChild(flow(new Text(DefaultFont.get()).with(maxWidth = WIDTH / 3,text = "")))
		this.layout = Vertical;

		text = new Text(DefaultFont.get(), this);
		text.maxWidth = WIDTH / 3;
		text.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
		text.tileWrap = true;
		text.textAlign = Center;
		text.setScale(2);

		this.addSpacing(10);

		stats = new Text(DefaultFont.get(), this);
		stats.text = "You have " + Adventure.player.health + " health and " + Adventure.player.sanity + " sanity.";
		stats.setScale(2);
		stats.textAlign = Left;

		this.addSpacing(10);

		var f = new Flow(this);
		f.layout = Horizontal;
		f.maxWidth = 50;
		f.horizontalSpacing = 4;
		f.addChild(Button.createRect("common","equipment", function(_) {}));

		f.addChild(Button.createRect("common","inventory", function(_) {}));
		f.addChild(Button.createRect("common","explore", function(_) {
			Main.screen = new AreaSelect();
		}));
		f.addChild(Button.createRect("common","shop", function(_) {}));
	}

	// override function update(dt:Float) {
		// stats.text = "You have " + Adventure.player.health + " health and " + Adventure.player.sanity + " sanity.";
	// 	super.update(dt);
	// }
}
