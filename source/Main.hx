package;

import haxe.ui.macros.ComponentMacros;
import haxe.ui.components.Image;
import haxe.ui.HaxeUIApp;
import haxe.ui.Toolkit;

import arcane.adv.App;
import arcane.utils.Utils;
import player.Player;

import openfl.display.Sprite;
import player.PlayerInfo;
import item.ItemInfo;
import arcane.adv.EventHandler;
import arcane.adv.ModHandler;

class Main extends Sprite {
	public static var player:Player;
	public static var isPlaying:Bool = false;
	public static function getPlayer():Null<Player>{
		return player;
	}
	public static var app:HaxeUIApp;
	public static var instance:Main;
	public function new(){
		super();
		#if hl
		hl.UI.closeConsole();
		#end
		Toolkit.init();
		try {			
			instance = this;
			EventHandler.additionalVars = additionalVars;
			ModHandler.extraActions = loadActions;
			ModHandler.loadData();
			app = new HaxeUIApp();
			app.ready(function(){
				var screen = new haxe.ui.containers.Box();
				var button = new haxe.ui.components.Button();
				button.text = "hey!";
				screen.addComponent(button);
				app.addComponent(screen);
				
				app.addComponent(button);
				app.start();
				// trace(screen.)
			},function(){
				Sys.exit(0);
			});			
			}catch(e:Dynamic){
			trace("Fatal Error : " + e + Utils.makeCallStack());
		}
	}
	
	public static function loadActions(action_map:Map<String,Dynamic>) {
		action_map.set("player", function(e:Xml, p:String) {
			PlayerInfo.load(ModHandler.makeXml(e, p));
		});
		action_map.set("item", function(e2:Xml, p2:String) {
			ItemInfo.loadItem(ModHandler.makeXml(e2, p2));
		});
		action_map.set("action", function(e1:Xml, p1:String) {
			EventHandler.executeXml(e1, p1);
		});
		// ModHandler.extraActions(action_map);
	}

	public static function additionalVars(v:Map<String, Dynamic>) {
		// v.set("Button",ui.Button);
		// v.set("FlxG",flixel.FlxG);
		// v.set("FlxSprite",FlxSprite);
		v.set("Main",Main);
	}
}