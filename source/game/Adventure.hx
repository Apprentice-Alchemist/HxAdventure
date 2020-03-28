package game;
 
import game.player.PlayerInfo;
import flixel.util.FlxSave;
import flixel.FlxState;
import game.player.Player;
class Adventure extends FlxState
{	public static var curSave:FlxSave;
	public static var player:Player;
	override public function create():Void
	{	
		curSave = new FlxSave();
		curSave.bind("adventure_game");

		if (curSave.data.player == null){
			player = new Player(PlayerInfo.get("default"));
			trace(player.info.id);
			save();
			super.create();
		} else if (curSave.data.player != null) {
			player = curSave.data.player;
			trace(player);
			super.create();
		}
		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	public function save(){
		curSave.data.player= player;
		curSave.flush();
	}
}
