package arcane.adv;
import flixel.util.FlxSave;
import flixel.FlxG;
import openfl.display.Sprite;
import flixel.FlxState;
import flixel.FlxGame;
class App extends Sprite{
	public var game:FlxGame;
	public static var instance:App;
	public static var settings:FlxSave;
	public static var saves:FlxSave;
	override public function new(state:Null<Class<FlxState>>, ?additionalVars:Dynamic = null,?loadActions:Dynamic = null,?core_path:String = "data/core/mod.xml",?mods_path:String = "data/mods",?mod_file:String = "mod.xml"){
		super();
		instance = this;
		settings = new FlxSave();
		settings.bind("settings");
		saves = new FlxSave();
		saves.bind("saves");
		if (settings.data.volume == null) {
			settings.data.volume = 1;
		}		
		settings.flush();
		EventHandler.additionalVars = additionalVars;
		ModHandler.extraActions = loadActions;
		ModHandler.loadData(core_path,mods_path,mod_file);
		game = new FlxGame(0, 0, state, 2);
		addChild(game);
		FlxG.sound.volume = settings.data.volume;
	}
}