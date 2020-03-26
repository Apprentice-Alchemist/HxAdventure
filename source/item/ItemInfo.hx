package item;

import haxe.ds.StringMap;

class ItemInfo {
	public var id:String;
	public var xml:Xml;
	// var canEquip:Bool = false;
	// var canConsume:Bool = false;
	public var type:String;
	public var slot:String;
	// On equip stuff
	public var damage:Int = 0;
	public var defense:Int = 0;
	public var durability:Int = 0;

	// Consume stuff
	public var healthBoost:Int = 0;
	// var healthRegenBoost = {value: 0, duration: 0};
	public var sanityBoost:Int = 0;
	// var sanityRegenboost = {value: 0, duration: 0};
    public function new(_xml:Xml){
		xml = _xml;
		id = xml.get("id");
		type = xml.get("type");
	    }

 



    public static var items:StringMap<ItemInfo>;
    public static function get(item:String){
        if(items.exists(item)){return items.get(item);} 
        else {
			if(item == "nullItem"){return null;}
            if(items.exists(item) == false){trace("No item found : "+ item);}
            return null;
        }
    }
    public static function loadItem(xml:Xml){
        items.set(xml.get("id"),new ItemInfo(xml));
    }
}