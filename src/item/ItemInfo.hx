package item;

import arcane.xml.XmlPath;
import player.Player;
import haxe.ds.StringMap;

class ItemInfo {
	public var id:String;
	public var xml:XmlPath;

	var canEquip:Bool = false;
	var canConsume:Bool = false;

	public var type:String;
	public var slot:String;
	// On equip stuff
	public var damage:Int = 0;
	public var defense:Int = 0;
	public var durability:Int = 0;

	public function new(_xml:XmlPath) {
		xml = _xml;
		id = xml.get("id");
		type = xml.get("type");
		slot = xml.get("slot");

		if(xml.get("isEquipment") == "true"){
			canEquip = true;
		damage = Utils.parseInt(xml.get("damage"));
		defense = Utils.parseInt(xml.get("defense"));
		durability = Utils.parseInt(xml.get("durability"));
		}
		if(xml.get("consumable") == "true"){
			canEquip = false;
			canConsume = true;
		}
	}

	public function consume(p:Player) {
		for (o in this.xml.elementsNamed('stat')) {
			switch o.get("id") {
				case "health":
					p.addHealth(Utils.parseInt(o.get("value")));
				case "sanity":
					p.addSanity(Utils.parseInt(o.get("value")));
				default:
			}
		}
	}

	public static var items:StringMap<ItemInfo>;

	public static function get(item:String) {
		if (items == null) {
			items = new StringMap<ItemInfo>();
		}
		if (items.exists(item)) {
			return items.get(item);
		} else {
			trace("No item found : " + item);
			return null;
		}
	}

	public static function loadItem(xml:XmlPath) {
		if (items == null) {
			items = new StringMap<ItemInfo>();
		}
		items.set(xml.get("id"), new ItemInfo(xml));
	}
}
