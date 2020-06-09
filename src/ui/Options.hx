package ui;

import h2d.Bitmap;
import h2d.Tile;

class Options extends h2d.Object {
    var t:Bitmap;
    var c:Bitmap;
    public function new(?parent){
        super(parent);
        Main.inst.listen("resize",onResize);
        var a = Tile.fromColor(0x333333, getScene().width - 50, getScene().height - 50);
        var b = Tile.fromColor(0x666666, getScene().width - 60, getScene().height - 60);
        t = new Bitmap(a);
        c = new Bitmap(b); 
        t.x = t.y = 25;
        c.x = c.y = 30;
        addChild(t);
        addChild(c);  
        
    }
    public function onResize(_){
        t.tile = Tile.fromColor(0x333333, getScene().width - 50, getScene().height - 50);
		c.tile = Tile.fromColor(0x666666, getScene().width - 60, getScene().height - 60);
    }
}
