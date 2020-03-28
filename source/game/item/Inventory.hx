package game.item;
import haxe.ds.StringMap;
class Inventory {
    public var items:StringMap<Array<Item>>;
 
    public function new(){
        items = new StringMap<Array<Item>>();
        items.set('equipment',new Array<Item>());
        items.set('potions',new Array<Item>());
        items.set('other',new Array<Item>());
        items.set('special',new Array<Item>());
    }
    public function removeItem(item:Item){
        items.get(item.type).remove(item);
        return true;
    }
    public function addItem(item:Item,?count:Int){
        if (count == null){var count =1;}
        if (item.type == "none"){return false;}
        items.get(item.type).push(item);
        return true;
    }
}
