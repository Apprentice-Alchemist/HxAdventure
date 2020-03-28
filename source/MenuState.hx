package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
#if desktop
import flash.system.System;
#end

class MenuState extends FlxState {
	var logo:FlxSprite;
	var _btnOptions:FlxButton;
	var _btnPlay:FlxButton;
	#if desktop
	var _btnExit:FlxButton;
	#end

	override public function create():Void {
		if (FlxG.sound.music == null) // don't restart the music if it's alredy playing
		{
			#if flash
			FlxG.sound.playMusic(AssetPaths.HaxeFlixel_Tutorial_Game__mp3, 1, true);
			#else
			// FlxG.sound.playMusic('mus/HaxeFlixel_Tutorial_Game.ogg', 1, true);
			#end
		}
		logo = new FlxSprite(20, 20, 'data/ui/Adventure_Logo.png');
		
		logo.setGraphicSize(200);
		logo.updateHitbox();	
		logo.screenCenter(FlxAxes.XY);	
		add(logo);

		_btnPlay = new FlxButton(0, 0, "Play", clickPlay);
		_btnPlay.x = (FlxG.width / 2) - _btnPlay.width - 10;
		_btnPlay.y = FlxG.height - _btnPlay.height - 10;
		// _btnPlay.onUp.sound = FlxG.sound.load(AssetPaths.select__wav);
		add(_btnPlay);

		_btnOptions = new FlxButton(0, 0, "Options", clickOptions);
		_btnOptions.x = (FlxG.width / 2) + 10;
		_btnOptions.y = FlxG.height - _btnOptions.height - 10;
		// _btnOptions.onUp.sound = FlxG.sound.load(AssetPaths.select__wav);
		add(_btnOptions);
 
		#if desktop
		_btnExit = new FlxButton(FlxG.width - 28, 8, "X", function() {
			System.exit(0);
		});
		_btnExit.loadGraphic('data/ui/button.png', true, 20, 20);
		add(_btnExit);
		#end

		FlxG.camera.fade(FlxColor.BLACK, .33, true);

		super.create();
	}

	function clickPlay():Void {
		FlxG.camera.fade(FlxColor.BLACK, .33, false, function() {
			FlxG.switchState(new Adventure());
		});
	}

	function clickOptions():Void {
		FlxG.camera.fade(FlxColor.BLACK, .33, false, function() {
			FlxG.switchState(new OptionsState());
		});
	}
}