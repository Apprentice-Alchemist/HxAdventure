package;

import player.LevelInfo;
import player.Level;
import player.PlayerInfo;
import player.Player;

class Adventure {
	public static function start() {
		player = new Player(PlayerInfo.get("default"));
		level = new Level(LevelInfo.get("one"));
	}

	public static var player:Player;
	public static var health:Int;
	public static var sanity:Int;
	public static var level:Level;
}
