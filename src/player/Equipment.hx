package player;

import item.ItemInfo;
import item.Item;
import haxe.ds.StringMap;

class Equipment {
	public var slots:StringMap<Item>;

	public function new() {
		slots = new StringMap<Item>();
		try {
			slots.set("weapon", new Item(ItemInfo.get("fists")));
			slots.set("armor", new Item(ItemInfo.get("skin")));
		} catch (_) {}
	}

	public function equip(player:Player, item:Item) {
		var slot = item.info.slot;
		var oldItem = getSlotItem(slot);
		if (oldItem != null && (oldItem.id != "fists" || oldItem.id != "skin")) {
			player.inventory.addItemData(getSlotItem(slot));
		}
		slots.set(slot, item);
		player.updateStats();
	}

	public function unequip(player:Player, slot:String) {
		var oldItem = getSlotItem(slot);
		if (oldItem != null && (oldItem.id != "fists" || oldItem.id != "skin")) {
			player.inventory.addItemData(getSlotItem(slot));
		}
		slots.set(slot, new Item(ItemInfo.get(getDefault(slot))));
		player.updateStats();
	}

	public function getSlotItem(slot:String) {
		if (slots.exists(slot)) {
			return slots.get(slot);
		} else {
			trace("No such slot!");
			return null;
		}
	}

	public function getDefault(s:String) {
		if (s == "weapon") {
			return "fists";
		}
		if (s == "armor") {
			return "skin";
		} else
			return "nullItem";
	}
}
