package player;
import arcane.xml.XmlPath;

class PlayerInfo {
	public static final players:Map<String, PlayerInfo> = new Map<String, PlayerInfo>();
    public static function load(xml:XmlPath){
        var info = new PlayerInfo(xml);
        players.set(info.id,info);
        trace('Player loaded : ${info.id}');
    }
    public static function get(e:String):Null<PlayerInfo>{
		if (!players.exists(e)) trace("No Player found : " + e);
        return players.get(e);
    }

    public final id:String = "";
    public var health:Int;
    public var sanity:Int;
    public function new(xml:XmlPath){
        id = xml.get("id");
        health = Std.parseInt(xml.get("health"));
        sanity = Std.parseInt(xml.get("sanity"));
    }
}