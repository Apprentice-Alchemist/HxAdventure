package adv;

import haxe.Constraints.Function;
import openfl.utils.Assets;
import openfl.utils.AssetType;
class ModHandler{
    public static var action_map:Map<String,String>;
    public static function loadData(){
        var asset_list = Assets.list();
        var core = Assets.get("data/core/core.xml");
        ModHandler.parseXml(Xml.parse(core));
    }
    public static function loadActionMap(){
        action_map.clear();
        action_map.set("player",function(){};)
    }
    public static function parseXml(s:Xml){

    }
}