package ui;
import openfl.text.TextField;
import openfl.display.Sprite;
class Button extends Sprite {
    public var text:TextField;
    public function new(text:String){
        var g = get_graphics();
        g.lineStyle();
        g.beginFill(0x00ff00);
        g.drawRect(0,0,20,10);
        g.endFill();
        super();
        this.text = new TextField();
        this.text.selectable = false;
        this.text.mouseEnabled = false;
        this.text.text = text;
        addChild(this.text);
    }
}