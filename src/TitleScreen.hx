package;

import hxd.Save;
import h3d.scene.Skin.Joint;
import h2d.Flow;
import hxd.Event;
import h2d.Bitmap;
import ui.Button;

class TitleScreen extends ui.Screen {
	var options:Button;
    var play:Button;
    var exit:Button;
	var bm:Array<Bitmap> = [];
	var buttons:Flow;
	var titlelogo:Bitmap;

	override public function new() {
		super();
		addChild(titlelogo = new Bitmap(hxd.Res.ui.Adventure_Logo.toTile(), this));
		titlelogo.scaleX = titlelogo.scaleY = 0.75;
		addChild(play = new Button(3, "Play", this, clickPlay));
        addChild(options = new Button(3, "Options", this, clickOptions));
        #if hl
        addChild(exit = new Button(3,"Exit",this,function(_){
            hxd.System.exit();
        }));
        #end
		onResize(null);
	}

	override public function update(dt:Float) {}

	override public function onResize(_) {
		titlelogo.x = width / 2 - ((titlelogo.tile.width * titlelogo.scaleX) / 2) - 1;
		titlelogo.y = 10;

		play.x = (width / 2) - ((play.width * play.scaleX) / 2) - 1;
		play.y = titlelogo.y + titlelogo.tile.height + 10;

		options.x = (width / 2) - ((options.width * options.scaleX) / 2) - 1;
        options.y = play.y + (play.height * play.scaleY) + 5;
        #if hl
        exit.x = (width / 2) - ((exit.width * exit.scaleX) / 2) - 1;
        exit.y = options.y + (options.height * options.scaleY) + 5;
        #end
	}

	function clickPlay(e:Event) {
    
    }

	function clickOptions(e:Event) {}
}
