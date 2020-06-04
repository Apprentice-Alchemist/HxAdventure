package player;

import arcane.xml.XmlPath;

class PartnerInfo {
	public static final partners:Map<String, PartnerInfo> = new Map<String, PartnerInfo>();

	public static function load(xml:XmlPath) {
		var info = new PartnerInfo(xml);
		partners.set(info.id, info);
		trace('Partner Loaded : ' + info.id);
	}

	public static function get(e:String):Dynamic {
		if(!partners.exists(e)) trace("No partner found : " + e);
		return partners.exists(e) ? partners.get(e) : null;
	}
	public var xml:XmlPath;
	public var id:String;
	public var desc:String;
	public var isReligious:Bool = false;
	public var damageBoost:Int = 0;
	public var healthRegen:Int = 0;
	public var sanityRegen:Int = 0;

	public function new(xml:XmlPath) {
		this.xml = xml;
		id = xml.get('id');
		desc = xml.get('desc') == null ? "partner." + id : xml.get('desc');
		isReligious = xml.get("religious") == "true";
		damageBoost = xml.get("damageBoost") != null ? Std.parseInt(xml.get("damageBoost")) : 0;
	}
}
