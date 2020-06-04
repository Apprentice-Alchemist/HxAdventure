package ui;

import arcane.xml.XmlPath;

class ScreenInfo {
    public static var screens:Map<String,ScreenInfo>;
    public static function loadScreen(xml:Xml,path){
        if(screens == null){
            screens = new Map();
        }
        screens.set(xml.get("id"),new ScreenInfo(new XmlPath(path,xml)));
    }
    public static function getScreen(name:String):Null<ScreenInfo>{
        if(screens == null){
            screens = new Map();
        }
        if (!screens.exists(name)){
            trace("No Screen Found : " + name);
            return null;
        } else{
            return screens.get(name);
        }
    }

    public var xml:XmlPath;
    public function new(xml:XmlPath){this.xml = xml;}

}