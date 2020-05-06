package arcane.macros;
#if macro
import haxe.macro.*;
class Macro {
    public static function run(){
        trace(Context.defined("FLX_DEBUG"));
    }
}
#else
class Macro{}
#end