package ui;

class Screen extends h2d.Scene {
	override public function new() {
		super();
		arcane.Engine.addUpdate(update);
		// arcane.Engine.app.listen("resize", onResize);
		Main.inst.listen("resize", onResize);
		arcane.Engine.app.setScene(this, true);
	}

	public function update(dt:Float) {}

	public function onResize(_) {}
}
