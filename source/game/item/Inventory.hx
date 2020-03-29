package game.item;

class Inventory {
    public var items:Array<Item>;
 
    public function new(){
		items = new Array<Item>();
    }
    public function removeItem(item:String){
        return items.remove(new Item(ItemInfo.get(item)));
    }
    public function addItem(item:String,?count:Int){
        if (count == null){var count = 1;}
        if(ItemInfo.get(item) == null){return false;}
        for (o in 0...count){
            items.push(new Item(ItemInfo.get(item)));
        }
        return true;
    }
    public function addItemData(item:Item){
        if (item != null){ items.push(item); return true;}
        return false;
    }
    public function removeItemData(item:Item){
        return items.remove(item);
    }
}