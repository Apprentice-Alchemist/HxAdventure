package util;

import haxe.io.Path;

class ModHandler {
	public static var core_path:String = "core/mod.xml";
	public static var mods_path:String = "assets/mods/";
	public static var mod_file:String = "mod.xml";
	public static var action_map:Map<String, XmlPath->Void> = new Map();
	public static var progress(default, null):Float = 0;

	public static function loadData(onProgress:Void->Void, onComplete:Void->Void) {
		loadActionMap();
		var files = [core_path];
		var loadedFiles = 0;
		for (o in files) {
			parseXml(makeXml(Xml.parse(hxd.Res.loader.loadCache(o, hxd.res.Resource).entry.getBytes().toString()).firstElement(), Path.directory(o)));
			loadedFiles++;
			progress = loadedFiles / files.length;
		}
		if (onComplete != null)
			onComplete();
	}

	public static function loadActionMap() {
		action_map.clear();
		action_map.set("include", function(o:XmlPath) {
			if (o.get("id") != null) {
				var p = new haxe.io.Path((o.path == null ? "" : o.path) + "/" + o.get("id"));
				try {
					parseXml(new XmlPath(Xml.parse(hxd.Res.loader.loadCache(p.toString(), hxd.res.Resource).entry.getText()).firstElement(),
						p.dir == null ? "" : p.dir));
				} catch (e) {
					trace(e.message);
				}
			}
		});
		action_map.set("lang", function(o:XmlPath) {
			util.Lang.load(o);
		});
		action_map.set("achievement", function(o:XmlPath) {
			// Achievements.loadAchievement(new Achievement(o.get("id"),o));
		});
		action_map.set("script", function(o:XmlPath) {
			if (o.get("source") != null) {
				try {
					EventHandler.execute(hxd.Res.load(haxe.io.Path.join([o.path, o.get("source")])).toText());
				} catch (e) {
					trace(e);
				}
				return;
			}
			EventHandler.execute(o.firstChild().toString());
		});
		action_map.set("player", player.PlayerInfo.make);
		action_map.set("item", item.ItemInfo.make);
		action_map.set("partner", player.PartnerInfo.make);
		action_map.set("level", player.LevelInfo.make);
		action_map.set("enemy", enemy.EnemyInfo.make);
	}

	public static function parseXml(s:XmlPath) {
		for (o in s.elements()) {
			if (action_map.exists(o.nodeName)) {
				try {
					action_map.get(o.nodeName)(makeXml(o, s.path));
				} catch (e) {
					trace(s.path,o,e.message);
				}
			}
		}
	}

	public static function makeXml(xml:Xml, path:String):XmlPath {
		return new XmlPath(xml, path);
	}
}
