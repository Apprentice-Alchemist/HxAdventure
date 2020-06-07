package;

import player.PlayerInfo;
import player.Player;

class Adventure {
    public static function start(){
        player = new Player(PlayerInfo.get("default"));
    }
    public static var player:Player;
    public static var level:player.Level;
}

