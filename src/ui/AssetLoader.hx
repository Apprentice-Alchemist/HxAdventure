package ui;

import sys.thread.Thread;
import h2d.Graphics;
import h2d.RenderContext;
import h2d.Scene;
import h2d.Object;

class AssetLoader extends h2d.Object {
	final onDone:Void->Void;
	final s2d:Scene;
	final bg:Graphics;
	final worker:Thread;
	final main:Thread;

	override public function new(?parent:Object, onDone:Void->Void) {
		super(parent);
		this.onDone = onDone;
		this.s2d = cast(parent, Scene);
		this.bg = new Graphics(this);
		this.worker = Thread.create(work);
		this.main = Thread.current();

		hxd.System.setLoop(mainLoop);
	}

	public function mainLoop() {
		h3d.Engine.getCurrent().render(this.s2d);
		if (Thread.readMessage(false) == "Done") {
			onDone();
		}
	}

	public function work() {
		hxd.Res.initLocal();
		ModHandler.loadData(function() {}, function() {
			main.sendMessage("Done");
		});
	}

	override function sync(ctx:RenderContext) {
		super.sync(ctx);
		bg.clear();
		bg.beginFill(0x0000ff);
		bg.drawRect((s2d.width - 100) / 2, (s2d.height - 10) / 2, 100 * ModHandler.progress, 10);
		bg.endFill();
		bg.lineStyle(2, 0x00ff00);
		bg.drawRect((s2d.width - 100) / 2, (s2d.height - 10) / 2, 100, 10);
	}
}
