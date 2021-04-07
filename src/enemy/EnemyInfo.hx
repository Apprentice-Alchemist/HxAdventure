package enemy;

import enemy.Enemy;
import util.XmlPath;

class EnemyInfo implements util.IInfo {
	public static final enemies:Map<String, EnemyInfo> = new Map<String, EnemyInfo>();

	public static function make(xml:XmlPath) {
		var info = new EnemyInfo();
		info.load(xml);
		enemies.set(info.id, info);
		trace('Enemy loaded : ${info.id}');
	}

	public static function get(e:String):Null<EnemyInfo> {
		if (!enemies.exists(e))
			trace("No Enemy found : " + e);
		return enemies.get(e);
	}

	@:xml public var id:String;

	@:xml public var health:Int;
	/**
	 * Physical damage
	 */
	@:xml public var damage:Int;
	/**
	 * Sanity damage
	 */
	@:xml public var sanity:Int;
	@:xml public var defense:Int;

	@:xml public var damageType:DamageType = Health;

    /**Expr on death**/
	@:xml public var exp:Int = 0;
    /**Coins on death**/
	@:xml public var coins:Int = 0;


	public function new() {}
}
