package arcane.debug;

import openfl.events.Event;
import openfl.events.KeyboardEvent;
import flixel.FlxG;
import flixel.system.debug.FlxDebugger;

class Debug {
    // public static var debug:FlxDebugger;
    // public static var hasDebug:Bool;
    // /**
    //     Only trigger the event listeners if Core Flixel Debugger is not active, aka when -debug is not set.
    // **/
    // public static function init(){
    //     debug = null;
    //     hasDebug = false;
    //     // #if !debug
    //     FlxG.stage.addEventListener(KeyboardEvent.KEY_DOWN,key_down);
    //     // #end
    // }
    // static function key_down(e:KeyboardEvent){
    //     if(e.ctrlKey && e.shiftKey && e.keyCode == 68){
    //         if(hasDebug == true && debug != null){
    //             hideDebug();
    //         }else{
    //             showDebug();
    //         }
    //     }
    // }
    // /**
    //     Show debug
    // **/
	// @:privateAccess public static function showDebug(){
	// 	@:privateAccess debug = new FlxDebugger(FlxG.width,FlxG.height);
    //     hasDebug = true;
    //     arcane.adv.App.instance.addChild(debug);
    //     trace("Debug Added");
    // }
    // /**
    //     Hide debug
    // **/
    // public static function hideDebug(){
    //     arcane.adv.App.instance.removeChild(debug);
    //     debug = null;
    //     hasDebug = false;
    //     trace("Debug Removed");
    // }
}