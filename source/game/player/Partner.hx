package game.player;

class Partner {
    public var info:PartnerInfo;

    public var id:String;
    public var desc:String;

    public var isReligious:Bool = false;
    public var damageBoost:Int = 0;

	public var healthRegen:Int = 0;
    public var sanityRegen:Int = 0;
    
    public function new(_info:PartnerInfo){
        info = _info;
    }
    
} 