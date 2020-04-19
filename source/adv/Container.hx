package adv;

import openfl.display.Sprite;

class Container extends Sprite{
    private var _width:Int;
    private var _height:Int;
    public function new(width:Int,height:Int){
        super();
        _width = width;
        _height = height;
    }
    public function addDisplay(d:Sprite,layer:Int,first:Bool = false){
		var i = this.get_numChildren();
		while (i <= layer) {
			this.addChild(new openfl.display.Sprite());
			i++;
        }
        var s = cast(d,Sprite);
		if (first) {
			s.addChildAt(d, 0);
		} else {
			s.addChild(d);
		}
    }
    public function getWidth(){
        return _width;
    }
    public function getHeight() {
        return _height;
    }
}