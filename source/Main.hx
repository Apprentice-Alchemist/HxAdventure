package;

import player.Player;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.util.FlxSave;
import openfl.display.Sprite;
import haxe.CallStack;
import player.PlayerInfo;
import item.ItemInfo;
import arcane.adv.EventHandler;
import arcane.adv.ModHandler;

class Main extends Sprite {
	public static var player:Player;
	public static var isPlaying:Bool = false;
	public static function getPlayer():Null<Player>{
		if(player == null && isPlaying == true){
			player = new Player(PlayerInfo.get("default"));
			return player;
		}else if(isPlaying){
			return player;
		} if(!isPlaying){
			return null;
		}
		return null;
	}
	public var game:FlxGame;
	public static var instance:Main;
	public static var settings:FlxSave;
	public static var saves:FlxSave;
	public function new(){
		#if hl
		hl.UI.closeConsole();
		#end
		trace("MAIN!");
		try {
			trace("MAIN2");
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
			ModHandler.loadData("data/core", "data/mods", "mod.xml");
			game = new FlxGame(0, 0, TitleScreen, 1,60,60,#if hl true #else false #end,false);
			addChild(game);
			trace(game);
			FlxG.sound.volume = settings.data.volume;
		}catch(e:Dynamic){
			trace("Fatal Error : " + e  + CallStack.toString(CallStack.exceptionStack()));
		}
	}
	
	public static function loadActions(action_map:Map<String, (xml:Xml, path:String) -> Void>) {
		action_map.set("player", function(e:Xml, p:String) {
			PlayerInfo.load(ModHandler.makeXml(e, p));
		});
		action_map.set("item", function(e2:Xml, p2:String) {
			ItemInfo.loadItem(ModHandler.makeXml(e2, p2));
		});
		action_map.set("action", function(e1:Xml, p1:String) {
			EventHandler.executeXml(e1, p1);
		});
		ModHandler.extraActions(action_map);
	}

	public static function additionalVars(v:Map<String, Dynamic>) {}
}