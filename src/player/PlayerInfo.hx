package player;

import util.XmlPath;

class PlayerInfo implements util.IInfo {
	public static final players:Map<String, PlayerInfo> = new Map<String, PlayerInfo>();

	public static function make(xml:XmlPath) {
		var info = new PlayerInfo();
		info.load(xml);
		players.set(info.id, info);
		trace('Player loaded : ${info.id}');
	}

	public static function get(e:String):Null<PlayerInfo> {
		if (!players.exists(e))
			trace("No Player found : " + e);
		return players.get(e);
	}

	@:xml public var id:String;
	@:xml public var health:Int;
	@:xml public var sanity:Int;
	public function new() {
	}
}
