package arcane.adv;
import openfl.display.Sprite;
import flixel.FlxState;
import flixel.FlxGame;
class App extends Sprite{
    public var game:FlxGame;
	override public function new(state:Null<Class<FlxState>>, ?additionalVars:Dynamic = null,?loadActions:Dynamic = null,?core_path:String = "data/core/mod.xml",?mods_path:String = "data/mods",?mod_file:String = "mod.xml"){
        super();
		EventHandler.additionalVars = additionalVars;
		ModHandler.extraActions = loadActions;
		ModHandler.core_path = core_path;
		ModHandler.mods_path = mods_path;
		ModHandler.mod_file = mod_file;
		ModHandler.loadData();
		game = new FlxGame(0, 0, state, false, false);
		addChild(game);
    }
}