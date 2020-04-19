package ui;
import openfl.display.Sprite as OpenFLSprite;
class Sprite extends OpenFLSprite{
    public var xml:Xml;
    public function new(?x:Null<Int>,?y:Null<Int>){
        var path = xml.get("path");
        super();
    }
}