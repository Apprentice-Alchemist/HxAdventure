package ui;

import adv.XmlPath;

class ScreenInfo {
    public static var screens:Map<String,ScreenInfo>;
    public static function loadScreen(xml:XmlPath){

    }
    public static function getScreen(name:String):Null<ScreenInfo>{
        if (!screens.exists(name)){
            trace("No Screen Found : " + name);
            return null;
        } else{
            return screens.get(name);
        }
    }

    public var xml:XmlPath;
    public function new(xml:XmlPath){
        
    }

}