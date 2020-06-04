package ;

import player.PartnerInfo;
import item.ItemInfo;
import player.PlayerInfo;
import arcane.xml.XmlPath;
import haxe.EntryPoint;
import hxd.Res;
import arcane.adv.ModHandler;
import arcane.adv.EventHandler;

class Main extends arcane.adv.App
{
    public static function main(){
        EventHandler.additionalVars = additionalVars;
        ModHandler.extraActions = extraActions;
		arcane.Engine.__init(new Main());
    }
    static function startLoading(?onComplete:Void->Void){
		#if hl
		Res.initLocal();
		#elseif js
		Res.initEmbed();
		#end
		ModHandler.loadData(onComplete);
    }
    override function init() {
        new TitleScreen();
    }
    override function loadAssets(onLoaded:() -> Void) {
        EntryPoint.addThread(startLoading.bind(onLoaded));
    }
    override function update(dt:Float){
        super.update(dt);
    }
    public static function additionalVars(v:Map<String,Dynamic>){
        
    }
    public static function extraActions(v:Map<String,XmlPath -> Void>){
        v.set("player",PlayerInfo.load);
        v.set("item",ItemInfo.loadItem);
        v.set("partner",PartnerInfo.load);
        // v.set("area")
    }
}
