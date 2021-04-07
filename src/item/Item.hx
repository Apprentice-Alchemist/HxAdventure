package item;

import player.Player;

class Item {
	public var id:String;
	public var info:ItemInfo;

	public function new(info:ItemInfo) {
		this.info = info;
	}

	public function consume(player:Player) {
		return info.consume(player);
	}
}
