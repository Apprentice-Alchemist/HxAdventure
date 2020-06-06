package;

import h3d.mat.PbrMaterialSetup;
import player.Player;

class Adventure {
    public static final player:Mutable<Player> = new Mutable();
    public static final screen:Mutable<ui.Screen> = new Mutable();
    public static final prev_screen:Mutable<ui.Screen> = new Mutable();
}

@:allow(Adventure)
private class Mutable<T> extends arcane.signal.SignalDispatcher{
	private var __value:T;

	function new() super();

	public inline function get():T
		return __value;

	public inline function set(v:T){
        dispatch(new arcane.signal.Signal("update"));
        __value = v;
    }
}

