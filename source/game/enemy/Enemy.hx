package game.enemy;
 
class Enemy {
    public var id:String;

    public var health:Int;
    public var damage:Int;
    public var defense:Int;
    
    public var damageType:DamageType = Health;

    public var exp:Int;
    public var coins:Int;
    public function new(){
        
    }

}
enum DamageType {
    Health;
    Sanity;
}