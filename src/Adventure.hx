package;

import player.Level;
import player.PlayerInfo;
import player.Player;
import arcane.common.Mutable;

class Adventure {
    public static function start(){
        player.set(new Player(PlayerInfo.get("default")));
    }
    public static var player:Mutable<Player> = new Mutable();
    public static var level:Mutable<Level> = new Mutable();
}



