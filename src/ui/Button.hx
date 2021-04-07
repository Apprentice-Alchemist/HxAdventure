package ui;

import h2d.ScaleGrid;
import h2d.RenderContext;
import h2d.Tile;
import h2d.Text;
import hxd.Event;

class Button extends h2d.Interactive {
	public static function createRect(section:String, id:String, onClick:Event->Void) {
		return new Button(69, 21, section, id, onClick);
	}

	public static function createSquare(section:String, id:String, onClick:Event->Void) {
		return new Button(21, 21, section, id, onClick);
	}

	private var bg:Tile;
	private var hover:Tile;
	private var down:Tile;

	private var pressed:Bool;
	private var txt:LText;
	private var grid:ScaleGrid;

	public function new(width:Int, height:Int, section, id, ?parent:h2d.Object, onClick:Event->Void) {
		var tiles = hxd.Res.ui.button.toTile().split(3, true);
		bg = tiles[0];
		hover = tiles[1];
		down = tiles[2];
		super(width, height, parent);
		grid = new h2d.ScaleGrid(bg, Std.int(bg.width / 3), Std.int(bg.height / 3), this);
		grid.width = width;
		grid.height = height;
		this.onClick = onClick;
		txt = new LText(hxd.res.DefaultFont.get(), section, id, this);
		txt.maxWidth = width;
		txt.textAlign = Center;
		// txt.text = label;
		txt.textColor = 0x555555;

		this.scale(2);
	}

	override private function sync(ctx:RenderContext) {
		super.sync(ctx);
		if (isOver()) {
			grid.tile = pressed ? down : hover;
		} else {
			grid.tile = pressed ? down : bg;
		}
		if (pressed && isOver())
			txt.y = 1;
		else
			txt.y = 0;
	}

	override public function handleEvent(e:Event) {
		if (e.kind == EventKind.EPush) {
			pressed = true;
		} else if (e.kind == EventKind.ERelease || e.kind == EventKind.EReleaseOutside) {
			pressed = false;
		}
		super.handleEvent(e);
	}
}
