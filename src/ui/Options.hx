package ui;

class Options extends h2d.Scene {
    public final old:h2d.Scene = null;
    override public function new(){
		var app = cast(arcane.Engine.app, Main);
		old = cast(arcane.Engine.app, Main).s2d;
        cast(arcane.Engine.app,Main).setScene(this,false);
    }
}