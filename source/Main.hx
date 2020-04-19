package;
import openfl.net.SharedObject;
import openfl.Lib;
import player.PlayerInfo;
import item.ItemInfo;
import openfl.display.Bitmap;
import adv.EventHandler;
import adv.ModHandler;
import openfl.display.Sprite;
import ui.Title;
import adv.Container;
class Main extends Sprite {
	public static var container:Container;
	private static var save:SharedObject;
	private static var settings:SharedObject;
	public static function throwError(e:Dynamic){trace(e);}
	public var title:Title;
	public function new() {
		super();
		try{
		container = new Container(256,144);
		save = SharedObject.getLocal("save","adventure");
		settings = SharedObject.getLocal("settings","adventure");
		EventHandler.additionalVars = Main.additionalVars;
		ModHandler.extraActions = Main.loadActions;		
		ModHandler.core_path = "data/core/mod.xml";
		ModHandler.mods_path = "data/mods";
		ModHandler.mod_file = "mod.xml";		
		ModHandler.loadData();
		
		var title = new Title();
		addChild(title);
		}catch(e:Dynamic){
			throwError(e);
		}
	}
	public static function loadActions(action_map:Map<String, Dynamic>) {
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