package ;

import arcane.adv.App;
import player.PartnerInfo;
import item.ItemInfo;
import player.PlayerInfo;
import arcane.xml.XmlPath;
import haxe.EntryPoint;
import hxd.Res;
import arcane.adv.ModHandler;
import arcane.adv.EventHandler;
import arcane.Engine as ArcEngine;

class Main extends arcane.adv.App
{
    public static var inst:Main;
    public static function main(){
        #if hl hl.UI.closeConsole(); #end    
        EventHandler.additionalVars = additionalVars;
        ModHandler.extraActions = extraActions;
        ArcEngine.__init(inst = new Main());
    }
    static function startLoading(?onComplete:Void->Void){
		#if hl
        Res.initEmbed();
		#elseif js
		Res.initEmbed();
		#end
        ModHandler.loadData(onComplete);
    }
    override function init() {
        new TitleScreen();

    }
    override function update(dt:Float) {
        super.update(dt);
    }
    override function loadAssets(onLoaded:() -> Void) {
        EntryPoint.addThread(startLoading.bind(onLoaded));
    }
    public static function additionalVars(v:Map<String,Dynamic>){
        v.set("player",null);
    }
    public static function extraActions(v:Map<String,XmlPath -> Void>){
        v.set("player",PlayerInfo.load);
        v.set("item",ItemInfo.loadItem);
        v.set("partner",PartnerInfo.load);
    }
}
