package;
import haxe.Constraints.Function;
import player.PlayerInfo;
import lib.adv.ModHandler;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.util.FlxSave;
import openfl.display.Sprite;
 
class Main extends Sprite {
	public static function loadActions(action_map:Map<String, Function>) {}
	public function new() {
		var startFullscreen:Bool = false;
		var _save:FlxSave = new FlxSave();
		_save.bind("adventure_game");
		#if desktop
		if (_save.data.fullscreen != null) {
			startFullscreen = _save.data.fullscreen;
		}
		#end
		ModHandler.core_path = "data/core/mod.xml";
		ModHandler.mods_path = "data/mods";
		ModHandler.mod_file = "mod.xml";
		ModHandler.extraActions = Main.loadActions;
		ModHandler.loadData();
		trace(PlayerInfo.get("default"));
		super();
		// addChild(new FlxGame(320, 240, MenuState, 3, 60, 60, true, startFullscreen));

		if (_save.data.volume != null) {
			FlxG.sound.volume = _save.data.volume;
		}
		_save.close();
	}
}