package;

import player.PlayerInfo;
import item.ItemInfo;
import arcane.adv.EventHandler;
import arcane.adv.ModHandler;

class Main extends arcane.adv.App {
	public function new() {
		super(TitleScreen, Main.additionalVars, Main.loadActions);
		try{
		}catch(e:Dynamic){
			trace(e);
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