package util;

import hscript.Parser;
import hscript.Interp;

class EventHandler {
	public static var interp:Interp;
	public static var parser:Parser;

	public static function interpret(expr:Dynamic, ?locals:Map<String, Dynamic>):Dynamic {
		if (interp == null) {
			interp = new Interp();
			loadVars(interp.variables);
		}
		if (locals != null) {
			for (o in locals.keys()) {
				interp.variables.set(o, locals.get(o));
			}
		}
		var tmp:Dynamic = interp.execute(expr);
		if (locals != null) {
			for (o in locals.keys()) {
				interp.variables.remove(o);
			}
		}
		return tmp;
	}

	public static function parseString(str:String) {
		if (parser == null) {
			parser = new Parser();
		}
		return parser.parseString(str);
	}

	private static function _execute(str:String) {
		var p = parseString(str);
		if (p != null) {
			return interpret(p);
		} else if (p == null) {
			return;
		}
	}

	public static function execute(str:String) {
		try {
			_execute(str);
		} catch (e:haxe.Exception) {
			trace("Script Error : " + e.details());
		}
	}

	public static function executeXml(xml:Xml, p:String) {
		if (xml.firstChild().nodeValue != null) {
			execute(xml.firstChild().nodeValue);
		};
	}

	public static function loadVars(v:Map<String, Dynamic>) {
		v.set("null", null);
		v.set("true", true);
		v.set("false", false);
		v.set("Math", Math);
		v.set("Std", Std);
		v.set("StringTools", StringTools);
		v.set("Xml", Xml);
		v.set("Int", Int);
		v.set("Float", Float);
		v.set("String", String);
		v.set("Array", Array);
		v.set("Bool", Bool);
		v.set("StringMap", haxe.ds.StringMap);
		v.set("IntMap", haxe.ds.IntMap);
		v.set("Date", Date);
		v.set("classFields", function(o) {
			if (Std.isOfType(o, Class)) {
				return Type.getClassFields(o);
			} else {
				return Type.getInstanceFields(Type.getClass(o));
			}
		});
		v.set("Reflect", Reflect);
		v.set("copyMap", function(from, to) {
			var i = to.keys();
			while (i.hasNext()) {
				to.remove(i.next());
			}
			var k = from.keys();
			while (k.hasNext()) {
				var k1 = k.next();
				to.set(k1, from.get(k1));
			}
		});
		v.set("Signal", Signal);
		v.set("getPlayer", () -> Adventure.player);
		v.set("getLevel", () -> Adventure.level);
		v.set("Signal", Signal);
		v.set("SignalDispatcher", SignalDispatcher);
		v.set("Const",Const);
	}
}