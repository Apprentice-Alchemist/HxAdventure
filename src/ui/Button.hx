// package ui;

// import flixel.ui.FlxButton.FlxTypedButton;
// import flixel.text.FlxText;

// /**
//  * Mostly a copy of the FlxButton, but adapted to support scaling.
//  */
// class Button extends FlxTypedButton<FlxText> {
// 	public static inline var NORMAL:Int = 0;
// 	public static inline var HIGHLIGHT:Int = 1;
// 	public static inline var PRESSED:Int = 2;
// 	public var text(get, set):String;

// 	/**
// 	 * Creates a new `Button` object with a gray background
// 	 * and a callback function on the UI thread.
// 	 *
// 	 * @param   X         The x position of the button.
// 	 * @param   Y         The y position of the button.
// 	 * @param   Text      The text that you want to appear on the button.
// 	 * @param   OnClick   The function to call whenever the button is clicked.
// 	 */
// 	public function new(X:Float = 0, Y:Float = 0,?scale:Null<Int> = 2, ?Text:String, ?OnClick:Void->Void) {
// 		for (point in labelOffsets)
// 			point.set(point.x - 1, point.y + 3);
// 		initLabel(Text);
// 		setGraphicSize(Std.int(this.width * scale), Std.int(this.height * scale));
// 		super(X, Y, OnClick);
// 		label.setGraphicSize(Std.int(label.width * scale),Std.int(label.height * scale));
// 		label.updateHitbox();
// 		updateHitbox();
// 		centerOrigin();
// 		resetHelpers();
// 		updateLabelPosition();
// 	}

// 	/**
// 	 * Updates the size of the text field to match the button.
// 	 */
// 	override public function resetHelpers():Void {
// 		super.resetHelpers();

// 		if (label != null) {
// 			label.fieldWidth = label.frameWidth = Std.int(width);
// 			label.size = label.size; // Calls set_size(), don't remove!
// 		}
// 		updateHitbox();
		
// 	}

// 	inline function initLabel(Text:String):Void {
// 		if (Text != null) {
// 			label = new FlxText(x + labelOffsets[NORMAL].x, y + labelOffsets[NORMAL].y, 80, Text);
// 			label.setFormat(null, 8, 0x333333, "center");
// 			label.alpha = labelAlphas[status];
// 			label.drawFrame(true);
// 		}
// 	}

// 	inline function get_text():String {
// 		return (label != null) ? label.text : null;
// 	}

// 	inline function set_text(Text:String):String {
// 		if (label == null) {
// 			initLabel(Text);
// 		} else {
// 			label.text = Text;
// 		}
// 		return Text;
// 	}
// }