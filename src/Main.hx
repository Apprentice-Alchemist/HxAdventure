package;

import arcane.common.Achievements.Achievement;
import hxd.Res;
using arcane.Utils;

class Main extends arcane.adv.App {
	public static var inst:Main;
	
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
		Engine.sound.music.play(hxd.Res.music.Adventure_The_Walk,true);
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
