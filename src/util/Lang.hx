package util;

import ui.LText;

class Lang {
	public static var current(default, set):String = "en_US";

	private static var langs:Map<String, Map<String, Map<String, String>>> = new Map();

	private static inline function set_current(s:String):String {
		if (!langs.exists(s)) {
			Log.error("no lang found with id " + s);
			return current;
		}
		Main.dispatcher.dispatch(new Signal(LANG_CHANGED, s));
		return current = s;
	}
	
	// public static function getText(section:String,id:String) {
	// 	return new LText(section,id);
	// }

	public static function get(section:String,id:String):String {
		var l = langs.get(current);
		if(l != null) {
			var s = l.get(section);
			if(s != null) {
				return s.get(id);
			}
		}
		return "<$section.$id>";
	}

	public static function load(xml:XmlPath) {
		final id = xml.get("id");
		assert(id != null);

		var lang;
		if (langs.exists(id)) {
			lang = langs.get(id);
			assert(lang != null);
		} else {
			lang = new Map();
			langs.set(id, lang);
		}

		for (el in xml.elementsNamed("section")) {
			final id = el.get("id");
			assert(id != null);
			var section;
			if (lang.exists(id))
				section = lang.get(id);
			else {
				section = new Map();
				lang.set(id, section);
			}
			assert(section != null);

			for (el in el.elementsNamed("text")) {
				final id = el.get("id");
				assert(id != null);
				var c = el.firstChild();
				assert(c.nodeType == PCData);
				section.set(id, c.toString());
			}
		}
	}
}
