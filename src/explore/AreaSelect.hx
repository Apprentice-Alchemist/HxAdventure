package explore;

import hxd.res.DefaultFont;
import h2d.Text;
import arcane.signal.Signal;

class AreaSelect extends ui.Screen{
    var areabuttons = new Array<Button>();
    var txt:Text;
    override public function new() {
        super();
        var a = 0;
		var xe = Adventure.level.get().info.xml.elementsNamed("area");
        while(xe.hasNext() && (a < 4)){
            var tmp = xe.next();
            areabuttons[a] = new Button(3,Lang.getText("areas",tmp.get("id")),this,function(_){
                new AreaIntro(tmp.get("id"),tmp);
            });
            a++;            
        }
        txt = new Text(DefaultFont.get(),this);
        txt.text = Lang.getText("common","areaselect");
        txt.maxWidth = txt.calcTextWidth(txt.text);
        txt.textAlign = Left;
        txt.setScale(3);
        
        onResize(null);
		
    }
    override function update(dt:Float) {
        super.update(dt);
    }
    override function onResize(_:Signal) {
        super.onResize(_);
		areabuttons[2].y = areabuttons[3].y = this.height - (areabuttons[3].height * areabuttons[3].scaleX) - 90;
		areabuttons[2].x = this.width / 2 - ((areabuttons[2].width * areabuttons[2].scaleX) + 10);
		areabuttons[3].x = this.width / 2 + 10;

		areabuttons[0].y = areabuttons[1].y = areabuttons[2].y - 20 - (areabuttons[0].height * areabuttons[0].scaleY);
		areabuttons[0].x = areabuttons[2].x;
        areabuttons[1].x = areabuttons[3].x;
        
		txt.maxWidth = txt.calcTextWidth(txt.text);
		txt.x = this.width / 2 - txt.textWidth;
        txt.y = areabuttons[0].y - 100;
    }
}