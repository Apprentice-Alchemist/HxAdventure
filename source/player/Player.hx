package player;
import item.Inventory;
import item.Item;
class Player {
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
    public function new(){
        health = 15;
        sanity = 10;

        exp = 0;
        coins = 0;

        inventory = new Inventory();
        equipment = new Equipment();

        stats = new Stats();
   }
   public function updateAttack(){
       var damage = 0;
       for (o in equipment.slots) {
         damage = damage + o.damage;
       }
       return damage;
    }
    public function updateDefense(){
		var defense = 0;
		for (o in equipment.slots) {
			// if (o.defense != null) {
				defense = defense + o.defense;
			// }
        }
		return damage;
    }
    public function doEquip(item:Item){
        equipment.equip(this,item);
        return true;
    }
    public function updateStats(){
        updateAttack();
        updateDefense();
    }
}