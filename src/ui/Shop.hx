package ui;

import h2d.Object;

class Shop extends h2d.Object{
    override public function new(){
        super();
		arcane.Engine.addUpdate(update);
		arcane.Engine.app.listen("resize", onResize);
    }
    public function close() {
       
    }
    public function update(dt:Float) {

    }
    public function onResize(s:arcane.signal.Signal){
        
    }
}