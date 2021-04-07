package util;

final class Log {
	public static function info(s:String, ?pos:haxe.PosInfos):Void {
        var t = haxe.Log.formatOutput(s,pos);
        #if js
        untyped console.log(t);
        #end
    }

	public static function warn(s:String, ?pos:haxe.PosInfos):Void {
        var t = haxe.Log.formatOutput(s,pos);
        #if js
        untyped console.warning(t);
        #end
    }

	public static function error(s:String, ?pos:haxe.PosInfos):Void {
        var t = haxe.Log.formatOutput(s,pos);
        #if js
        untyped console.error(t);
        #end
    }
}
