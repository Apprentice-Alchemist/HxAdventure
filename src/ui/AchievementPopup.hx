package ui;

import hxd.res.DefaultFont;
import h2d.Text;

class AchievementPopup extends h2d.Object{
    override public function new(name:String,description:String = "") {
        var text = new Text(DefaultFont.get(),this);
        text.text = name;
        super();
    }
    public function show(obj:h2d.Object){
        obj.addChild(this);
        haxe.Timer.delay(function(){
            obj.removeChild(this);
        },4000);
    }
}