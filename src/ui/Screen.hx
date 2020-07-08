package ui;

class Screen extends h2d.Scene {
	override public function new() {
		super();
		arcane.Engine.addUpdate(update);
		Main.inst.listen("resize", onResize);
		arcane.Engine.app.setScene(this, true);
	}

	public function update(dt:Float) {
		// trace(Options.shown);
		if (hxd.Key.isPressed(hxd.Key.X) && !Options.shown)
			new Options(this);
		else if (hxd.Key.isPressed(hxd.Key.X) && Options.shown && Options.inst != null)
			Options.doClose();
	}
	override function dispose() {
		Engine.removeUpdate(update);
		Engine.app.removeListener("resize",onResize);
		super.dispose();
	}
	public function onResize(_) {}
}
