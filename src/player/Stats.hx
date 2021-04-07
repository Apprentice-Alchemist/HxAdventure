package player;

class Stats extends SignalDispatcher{
    public var stats:Map<String,Int>;
    public function set(stat:String,value:Int){
        return stats.set(stat,value);
        dispatch(new Signal("updated"));
    }
    public function get(stat:String){
        return stats.get(stat) == null ? 0 : stats.get(stat);
    }
    public function add(stat:String,value:Int){
        if(stats.exists(stat)){
            set(stat,stats.get(stat) + value);
        } else {
            set(stat,value);
        }
    }
    public function new(){
        super();
    }
}
