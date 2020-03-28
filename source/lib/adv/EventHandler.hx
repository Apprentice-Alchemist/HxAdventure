package lib.adv;

import haxe.ds.IntMap;
import haxe.ds.StringMap;
import hscript.Expr;
import hscript.Parser;
import hscript.Interp;

class EventHandler {
    public static var interp:Interp;
    public static var parser:Parser;
    public static function interpret(expr:Expr){
		if (interp == null) {
            interp = new Interp();
			loadVars(interp.variables);
        }
        interp.execute(expr);
    }
    public static function parseString(str:String){
        if (parser == null){
			parser = new Parser();
        }
		return parser.parseString(str);
    }
    public static function _execute(str:String){
        var p = parseString(str);
        if (p != null){
            return interpret(p);
        } else if (p == null){
            return;
        }
    }
    public static function execute(str:String){
        try{_execute(str);}catch(e:Dynamic){trace("Script Error : " + e);}
    }
    public static function executeXml(xml:Xml,p:String){
		 if (xml.firstChild().nodeValue != null){
            execute(xml.firstChild().nodeValue);
         };
    }
    public static function loadVars(v:Map<String,Dynamic>){
		v.set("null", null);
		v.set("true", true);
		v.set("false", false);
		v.set("Math", Math);
		v.set("trace", function(e) {
		haxe.Log.trace(Std.string(e),{fileName:"hscript",lineNumber:0,methodName: "trace",className: "Hscript"});
		});
        v.set("Std",Std);
        v.set("StringTools",StringTools);
        v.set("Xml",Xml);
		v.set("Int", Int);
		v.set("Float", Float);
		v.set("String", String);
		v.set("Array", Array);
        v.set("Bool", Bool);
        v.set("StringMap",StringMap);
        v.set("IntMap",IntMap);
        v.set("Date", Date);
		// v.set("copyMap", function(from, to) {
		// 	while (true) {
		// 		var i = to.keys();
		// 		if (i.hasNext()) {
		// 			to.remove(i.next());
		// 		} else {
		// 			break;
		// 		}
		// 	}
		// 	var k = from.keys();
		// 	while (k.hasNext()) {
		// 		var k1 = k.next();
		// 		to.set(k1, from.get(k1));
		// 	}
		// });
    }
    public dynamic static function additionalVars(v:Map<String,Dynamic>){

    }
}