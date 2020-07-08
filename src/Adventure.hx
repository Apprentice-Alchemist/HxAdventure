package;

import player.Level;
import player.PlayerInfo;
import player.Player;
import arcane.common.Mutable;

class Adventure {
    public static function start(){
        player.set(new Player(PlayerInfo.get("default")));
        level.set(new Level(LevelInfo.get("one")));
    }
    public static var player = new Mutable<Player>();
    public static var health = new Mutable<Int>(null,function(){
        return player.get().health;
    });
    // public st
    public static var level = new Mutable<Level>();
}