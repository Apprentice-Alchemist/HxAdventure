package ui;

class Shop extends h2d.Scene{
    final old:Null<Screen> = null;
    override public function new(pre:Screen){
        super();
        old = pre;
		arcane.Engine.addUpdate(update);
		arcane.Engine.app.listen("resize", onResize);
		arcane.Engine.app.setScene(this, false);
    }
    public function close() {
        // arcane
    }
    public function update(dt:Float) {

    }
    public function onResize(_){

    }
}