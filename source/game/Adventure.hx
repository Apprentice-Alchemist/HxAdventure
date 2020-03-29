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
		loadSave();
		if (player == null){player = new Player(PlayerInfo.get("default"));}
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	public function loadSave(){
		curSave = new FlxSave();
		curSave.bind("adventure_game");
		if(curSave.data.player != null){player = curSave.data.player;}
		curSave.close();
	}
	public function save(){
		curSave = new FlxSave();
		curSave.bind("adventure_game");
		curSave.data.player= player;
		curSave.close();
	}
}
