package game;
import lib.adv.EventHandler;
import haxe.Constraints.Function;
import lib.adv.ModHandler;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.util.FlxSave;
import openfl.display.Sprite;
 
class Main extends Sprite {
	public static function loadActions(action_map:Map<String, Function>) {}
	public static function additionalVars(v:Map<String,Dynamic>){}
	public function new() {
		var startFullscreen:Bool = false;
		var _save:FlxSave = new FlxSave();
		_save.bind("adventure_game");
		#if desktop
		if (_save.data.fullscreen != null) {
			startFullscreen = _save.data.fullscreen;
		}
		#end
		EventHandler.additionalVars = Main.additionalVars;
		ModHandler.extraActions = Main.loadActions;
		
		ModHandler.core_path = "data/core/mod.xml";
		ModHandler.mods_path = "data/mods";
		ModHandler.mod_file = "mod.xml";
		
		ModHandler.loadData();
		super();
		addChild(new FlxGame(320, 240, MenuState, 3, 60, 60, true, startFullscreen));

		if (_save.data.volume != null) {
			FlxG.sound.volume = _save.data.volume;
		}
		_save.close();
	}
}