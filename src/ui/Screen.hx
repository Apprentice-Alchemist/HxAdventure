package ui;

class Screen extends h2d.Scene {
	override public function new() {
		super();
		arcane.Engine.addUpdate(update);
		// arcane.Engine.app.listen("resize", onResize);
		Main.inst.listen("resize", onResize);
		arcane.Engine.app.setScene(this, true);
	}

	public function update(dt:Float) {
		if (hxd.Key.isPressed(hxd.Key.X) && !Options.shown)
			new Options(this);
		else if (hxd.Key.isPressed(hxd.Key.X) && Options.shown && Options.inst != null)
			Options.doClose();
	}

	public function onResize(_) {}
}
