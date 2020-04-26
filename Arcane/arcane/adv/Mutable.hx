package arcane.adv;

import openfl.events.Event;
import openfl.events.EventDispatcher;

class Mutable extends EventDispatcher{
    public inline function get(){
        return value;
    }
    public function set(v:Dynamic){
        dispatchEvent(new Event("updated"));
        return value = v;
    }
    var value:Dynamic;
    public function new(){
        value = null;
        super();
    }
}