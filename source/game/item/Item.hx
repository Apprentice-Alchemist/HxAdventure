package game.item;

import game.player.Player;
 
class Item {
    public var id:String;
    public var canEquip:Bool = false;
    public var canConsume:Bool = false;
    public var info:ItemInfo;
    public var type:String;
    public var slot:String;
    // On equip stuff
    public var damage:Int=0;
    public var defense:Int=0;
    public var durability:Int=0;
    // Consume stuff
    // var healthBoost:Int;
    // var healthRegenBoost = {value: 0, duration: 0};

    // var sanityBoost:Int;
    // var sanityRegenboost = {value: 0, duration: 0};
    public function new(_info:ItemInfo) {
        info = _info;
        id = info.id;
        durability = info.durability;
        type = info.type;
        slot = info.slot;
        damage = info.damage;
        defense = info.defense;

        if (info.healthBoost == 0 && info.sanityBoost == 0){
            canConsume = false;
        }

    }
    public function equip(player:Player){
        if (this.durability == 0){return false;}
        if (player.doEquip(this)){player.inventory.removeItem(this); return true;} 
        else {trace("Failed to equip item!"); return false;}
    }
    public function consume(player:Player){
        if(canConsume == false){trace("Cannot consume Item!"); return false;}
        player.health = player.health + info.healthBoost;
        player.sanity = player.sanity + info.sanityBoost;
        return player.inventory.removeItem(this);
    }
}
