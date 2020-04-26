package ui;

import flixel.math.FlxPoint;
import flixel.ui.FlxButton;


class Button extends FlxButton {
	override public function new(?x:Null<Int> = 0, ?y:Null<Int>, ?text:Null<String> = "",?func:Null<() -> Void>){
        super(x,y,text,func);
        this.scale = new FlxPoint(3,3);
        this.updateHitbox();
        this.centerOrigin();
        this.label.scale = this.scale;
        this.label.updateHitbox();
        this.label.centerOrigin();
    }
}