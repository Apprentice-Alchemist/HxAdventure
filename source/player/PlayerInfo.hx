package player;
 

class PlayerInfo {
    public static var players:Map<String,PlayerInfo> = null;
    public static function load(xml:Xml){
        if (players == null){
            players = new Map<String,PlayerInfo>();
        }
        var info = new PlayerInfo(xml);
        players.set(info.id,info);
        trace('Player Loaded');
    }
    public static function get(e:String){
        return PlayerInfo.players.exists(e) ? PlayerInfo.players.get(e) : null;
    }

    public var id:String;
    public var health:Int;
    public var sanity:Int;

    public function new(xml:Xml){
        id = xml.get("id");
        health = Std.parseInt(xml.get("health"));
        sanity = Std.parseInt(xml.get("sanity"));
    }
}