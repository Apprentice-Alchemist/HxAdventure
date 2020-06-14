package ui;

import h2d.RenderContext;
import h2d.Text;
import hxd.Event;
import h2d.Tile;

class SButton extends h2d.Interactive {
	private var bg:Tile;
	private var hover:Tile;
	private var down:Tile;

	private var pressed:Bool;
	private var txt:Text;

	public function new(?scale:Int = 1, label:String, ?parent:h2d.Object, onClick:Event->Void) {
        var tiles = hxd.Res.ui.button_png.toTile().split(3, true);
		super(tiles[0].width, tiles[0].height, parent);
		this.onClick = onClick;
		txt = new Text(hxd.res.DefaultFont.get(), this);
		txt.maxWidth = tiles[0].width * ((Math.ceil(txt.textHeight) + 4) / tiles[0].height);
		txt.textAlign = Align.Center;
		txt.text = label;
		txt.x = 0;
		txt.y = 0;
		txt.color.setColor(0xffffffff);
		for (o in tiles) {
			o.scaleToSize(o.width * ((Math.ceil(txt.textHeight) + 4) / o.height), ((Math.ceil(txt.textHeight) + 4) / o.height) * o.height);
		}

		this.width = tiles[0].width;
		this.height = tiles[0].height;

		bg = tiles[0];
		hover = tiles[1];
		down = tiles[2];

		this.scale(scale);
	}

	override private function draw(ctx:RenderContext) {
		if (isOver()) {
			emitTile(ctx, pressed ? down : hover);
		} else {
			emitTile(ctx, pressed ? hover : bg);
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