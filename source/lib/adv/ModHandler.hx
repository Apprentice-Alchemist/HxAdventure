package lib.adv;

import player.PlayerInfo;
import lib.xml.XmlPath;
import haxe.Constraints.Function;
import openfl.utils.Assets;
import openfl.utils.AssetType;
class ModHandler{
	public static var core_path:String = "data/core/core.xml";
    public static var mods_path:String = "data/mods/";
    public static var mod_file:String = "mod.xml";
    public static var action_map:Map<String,Function>;
    public static function loadData(){
        ModHandler.loadActionMap();
        var asset_list = Assets.list();
        var mod_list = [core_path];
        for (o in asset_list){
            if (StringTools.startsWith(o,mods_path) && StringTools.endsWith(o,mod_file)){
                mod_list.push(o);
            }
        }
        for (o in mod_list){
            trace("ModList : " + o);
        ModHandler.parseXml(ModHandler.makeXml(Xml.parse(Assets.getText(o)).firstElement(),o));
        }
    }
	public dynamic static function extraActions(action_map:Map<String, Function>) {}
    public static function loadActionMap(){
        action_map.clear();
        action_map.set("player",function(e:Xml,p:String){
            PlayerInfo.load(ModHandler.makeXml(e,p));
        });
        ModHandler.extraActions(action_map);
    }
   
    public static function parseXml(s:XmlPath){
        trace(s.path);
        for (o in s.elements()){
			// trace(action_map.exists(o.nodeName))
            if(action_map.exists(o.nodeName)){
                action_map.get(o.nodeName)(o,s.path);
                trace(o.nodeName);
            }else{
                trace("NodeName not found : " + o.nodeName);
            }           
        }
    }
    public static function makeXml(xml:Xml,path:String){
        return new XmlPath(path,xml);
    }
}