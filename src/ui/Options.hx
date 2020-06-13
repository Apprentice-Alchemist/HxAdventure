package ui;

import h2d.Object;
import hxd.Event;
import h2d.Interactive;
import h2d.Bitmap;
import h2d.Tile;

class Options extends h2d.Interactive {
    var t:Bitmap;
    var c:Bitmap;
    var shade:Bitmap;
    var close:SButton;
    public function new(?parent:Object){
        super(parent.getScene().width,parent.getScene().height,parent);
        Main.inst.listen("resize",onResize);
        var a = Tile.fromColor(0x333333, 410, 410);
        var b = Tile.fromColor(0x666666, 400, 400);
        var s = Tile.fromColor(0x000000,getScene().width,getScene().height,0.5);
        t = new Bitmap(a);
        c = new Bitmap(b); 
        shade = new Bitmap(s,this);
        addChild(t);
        addChild(c);
        close = new SButton(3,"X",this,function(_){
            this.remove();
        });
        onResize(null);        
    }
    public function onResize(_){
        this.width = getScene().width;
        this.height = getScene().height;
        shade.remove();
        var s = Tile.fromColor(0x000000, getScene().width, getScene().height, 0.5);
		shade.tile = s;
		t.x = (getScene().width / 2) - 410 / 2;
		t.y = (getScene().height / 2) - 410 / 2;
		c.x = (getScene().width / 2) - 400 / 2;
        c.y = (getScene().height / 2) - 400 / 2;
        close.x = t.x + 410;
        close.y = t.y;
    }
    override function handleEvent(e:Event){
        e.propagate = false;
    }
    
}
