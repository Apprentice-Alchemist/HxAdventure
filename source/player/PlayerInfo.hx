package player;

import lib.xml.XmlPath;
 

class PlayerInfo {
    public static var players:Map<String,PlayerInfo> = null;
    public static function load(xml:XmlPath){
        if (players == null){
            players = new Map<String,PlayerInfo>();
        }
        var info = new PlayerInfo(xml);
        players.set(info.id,info);
        trace('Player Loaded : ' + info.id);
    }
    public static function get(e:String){
		if (players == null) {
			players = new Map<String, PlayerInfo>();
		}
        return PlayerInfo.players.exists(e) ? PlayerInfo.players.get(e) : null;
    }

    public var id:String;
    public var health:Int;
    public var sanity:Int;
    public function new(xml:XmlPath){
        id = xml.get("id");
        health = Std.parseInt(xml.get("health"));
        sanity = Std.parseInt(xml.get("sanity"));
    }
}