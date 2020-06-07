package ui;

import h2d.Object;

class Shop extends h2d.Object{
    final old:Null<Screen> = null;
    override public function new(pre:Screen){
        super();
		arcane.Engine.addUpdate(update);
		arcane.Engine.app.listen("resize", onResize);
    }
    public function close() {
        // arcane
    }
    public function update(dt:Float) {

    }
    public function onResize(_){

    }
}