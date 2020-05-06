package arcane.adv;

import openfl.utils.Assets;
import arcane.xml.XmlPath;
class ModHandler{
	public static var core_path:String = "data/core/core.xml";
    public static var mods_path:String = "data/mods/";
    public static var mod_file:String = "mod.xml";
    public static var action_map:Map<String,(xml:Xml,path:String) -> Void> = null;
	public static var extraActions:(action_map:Map<String, (xml:Xml, path:String) -> Void>) -> Void;
	public static function loadData(?core_path:String = "data/core/core.xml", ?mods_path:String = "data/mods/", ?mod_file:String = "mod.xml"){
        try{
        ModHandler.core_path = core_path;
		ModHandler.mods_path = mods_path;
		ModHandler.mod_file = mod_file;
        ModHandler.loadActionMap();
        var asset_list = Assets.list();
        var mod_list = [core_path];
        for (o in asset_list){
            if (StringTools.startsWith(o,mods_path) && StringTools.endsWith(o,mod_file)){
                mod_list.push(o);
            }
        }
        for (o in mod_list){
            ModHandler.parseXml(ModHandler.makeXml(Xml.parse(Assets.getText(o)).firstElement(),o));
        }
    }catch(e:Dynamic){
        trace("Asset Error : " + e);
    }
    }
	
    public static function loadActionMap(){
        if (action_map == null){
			action_map = new Map<String, (xml:Xml, path:String) -> Void>();
        }
        action_map.clear();
        
    }
   
    public static function parseXml(s:XmlPath){
        for (o in s.elements()){
            if(action_map.exists(o.nodeName)){
                action_map.get(o.nodeName)(o,s.path);
            }        
        }
    }
    public static function makeXml(xml:Xml,path:String){
        return new XmlPath(path,xml);
    }
}