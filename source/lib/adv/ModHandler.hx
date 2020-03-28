package lib.adv;

import game.player.PlayerInfo;
import lib.xml.XmlPath;
import haxe.Constraints.Function;
import openfl.utils.Assets;
import openfl.utils.AssetType;
class ModHandler{
	public static var core_path:String = "data/core/core.xml";
    public static var mods_path:String = "data/mods/";
    public static var mod_file:String = "mod.xml";
    public static var action_map:Map<String,Function> = null;
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
            ModHandler.parseXml(ModHandler.makeXml(Xml.parse(Assets.getText(o)).elementsNamed('data').next(),o));
        }
    }
	public dynamic static function extraActions(action_map:Map<String, Function>) {}
    public static function loadActionMap(){
        if (action_map == null){
            action_map = new Map<String,Function>();
        }
        action_map.clear();
        action_map.set("player",function(e:Xml,p:String){
            PlayerInfo.load(ModHandler.makeXml(e,p));
        });
        action_map.set("action",function(e1:Xml,p1:String){EventHandler.executeXml(e1,p1);});
        ModHandler.extraActions(action_map);
    }
   
    public static function parseXml(s:XmlPath){
        for (o in s.elements()){
            if(action_map.exists(o.nodeName)){
                action_map.get(o.nodeName)(o,s.path);
                // trace(o.nodeName);
            }else{
				trace(StringTools.replace(o.nodeName, o.nodeName.charAt(0), o.nodeName.charAt(0).toUpperCase()) + " is not a thing. Please contact the developper if you wish to have this added to the game.");
            }           
        }
    }
    public static function makeXml(xml:Xml,path:String){
        return new XmlPath(path,xml);
    }
}