package enemy;

class Enemy {
	public var info:EnemyInfo;

	public function new() {}
}

enum abstract DamageType(String) {
	var Health;
	var Sanity;
	var Both;
}
