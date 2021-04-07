package explore;

import ui.LText;
import util.Lang;
import hxd.res.DefaultFont;
import h2d.Text;
import ui.Button;

class AreaSelect extends ui.Screen {
	var areabuttons = new Array<Button>();
	var txt:Text;

	override public function new() {
		super();
		var a = 0;
		var xe = Adventure.level.info.xml.elementsNamed("area");
		while (xe.hasNext() && (a < 4)) {
			var tmp = xe.next();
			areabuttons[a] = Button.createRect("areas",tmp.get("id"), function(_) {
				new AreaIntro(tmp.get("id"), tmp);
			});
			addChild(areabuttons[a]);
			a++;
		}
		txt = new LText(DefaultFont.get(),"common","areaselect",this);
		// txt.maxWidth = txt.calcTextWidth(txt.text);
		txt.textAlign = Left;
		txt.setScale(3);
	}

	// override function update(dt:Float) {
	// 	super.update(dt);
	// }
}
