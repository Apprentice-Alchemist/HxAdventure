package player;

import openfl.events.Event;
import openfl.events.EventDispatcher;
import item.Inventory;
import item.Item;
import player.PlayerInfo;
class Player extends EventDispatcher {
    public var info:PlayerInfo;
    public var stats:Stats;

    public var health:Int;
    public var max_health:Int;
    public var sanity:Int;
    public var max_sanity:Int;
 
    public var damage:Int;
    public var defense:Int;

    public var exp:Int;
    public var coins:Int;

    public var inventory:Inventory;
    public var equipment:Equipment;

    public var seen_areas_map:Map<String,Bool>;
    public var seen_items_map:Map<String, Bool>;
    public var seen_orbs_map:Map<String, Bool>;
    
    public var partners_map:Map<String, Partner>;
    
    public function new(info:PlayerInfo){
        super();
        this.info = info;
        health = info.health;
        sanity = info.sanity;
        exp = 0;
        coins = 0;
        inventory = new Inventory();
        equipment = new Equipment();
        stats = new Stats();
   }
    public function doEquip(item:Item){
        equipment.equip(this,item);
        return true;
    }
    public function updateStats(){
		var damage = 0;
		for (o in equipment.slots) {
			damage = damage + o.info.damage;
		}
		var defense = 0;
		for (o in equipment.slots) {
			defense = defense + o.info.defense;
		}
    }
    public function addHealth(v:Int){
        this.health = this.health + v;
        dispatchEvent(new Event("change_health"));
    }
    public function setHealth(v:Int){
        this.health = v;
		dispatchEvent(new Event("change_health"));
    }
    public function addSanity(v:Int){
        this.sanity = this.sanity + v;
		dispatchEvent(new Event("change_sanity"));
    }
}