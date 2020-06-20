package player;

class LevelInfo
{
	public static final levels:Map<String, LevelInfo> = new Map<String, LevelInfo>();

	public static function load(xml:XmlPath) {
		var info = new LevelInfo(xml);
		levels.set(info.id, info);
		trace('Level Loaded : ' + info.id);
	}

	public static function get(e:String):Dynamic {
		if (!levels.exists(e))
			trace("No level found : " + e);
		return levels.exists(e) ? levels.get(e) : null;
    }

    public var id:String;
    public var xml:XmlPath;
    public function new(xml:XmlPath){
        this.xml = xml;
        this.id = xml.get("id");
    }
}