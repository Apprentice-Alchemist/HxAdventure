package;

import hxd.res.DefaultFont;
import arcane.common.Achievements.Achievement;
import hxd.Res;
using arcane.Utils;

class Main extends App {
	public static function __init__(){
		
	}
	public static var inst:Main;
	// public static final font:Mutable<h2d.Font> = new Mutable();
	public static function main() {
		
		EventHandler.additionalVars = additionalVars;
		ModHandler.extraActions = extraActions;
		Achievements.onAchievement = function(a:Achievement){
			function show(x:Achievement,scene){

			}
			trace(a);
			if(Main.inst.s2d != null){
				show(a,Main.inst.s2d);
			}
		}
		
		Engine.init(inst = new Main());
	}

	static function startLoading(?onComplete:Void->Void) {
		#if hl
		Res.initLocal();
		#elseif js
		Res.initEmbed();
		#end
		ModHandler.loadData(onComplete);
	}

	override function init() {
		// font.set(hxd.Res.Immortal.build(DefaultFont.get().size));
		new TitleScreen();
	}

	override function update(dt:Float) {
		super.update(dt);
	}

	override function loadAssets(onLoaded:() -> Void) {
		startLoading(onLoaded);
	}

	public static function additionalVars(v:Map<String, Dynamic>) {
		v.set("getPlayer", Adventure.player.get);
		v.set("getLevel",Adventure.level.get);
	}

	public static function extraActions(v:Map<String, XmlPath->Void>) {
		v.set("player", PlayerInfo.load);
		v.set("item", ItemInfo.loadItem);
		v.set("partner", PartnerInfo.load);
		v.set("level",LevelInfo.load);
	}
}
