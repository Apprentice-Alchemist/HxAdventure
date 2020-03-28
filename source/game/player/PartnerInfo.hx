package game.player;

import lib.xml.XmlPath;

class PartnerInfo {
	public static var partners:Map<String, PartnerInfo> = null;

	public static function load(xml:XmlPath) {
		if (partners == null) {
			partners = new Map<String, PartnerInfo>();
		}
		var info = new PartnerInfo(xml);
		partners.set(info.id, info);
		trace('Player Loaded : ' + info.id);
	}

	public static function get(e:String):Dynamic {
		if (partners == null) {
			partners = new Map<String, PartnerInfo>();
		}
		return PartnerInfo.partners.exists(e) ? PartnerInfo.partners.get(e) : "No Player found : " + e;
    }
    public var id:String;
    public var desc:String;
	public var isReligious:Bool = false;
	public var damageBoost:Int = 0;
	public var healthRegen:Int = 0;
    public var sanityRegen:Int = 0;
    
    public function new(xml:XmlPath){
        id = xml.get('id');
        desc = xml.get('desc') == null?"partner." + id:xml.get('desc');
        
    }
}