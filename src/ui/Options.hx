package ui;

class Options extends h2d.Scene {
    public final old:h2d.Scene = null;
    override public function new(){
        super();
		old = Main.inst.s2d;
        Main.inst.setScene(this,false);
    }
    function close(){
        if(old != null) Main.inst.setScene(old,true);
    }
}