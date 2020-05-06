
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import player.Player;
import ui.*;
import flixel.FlxState;

class LevelScreen extends FlxState {
var _player:Player;

public var shopButton:Button;
public var continueButton:Button;
public var equipButton:Button;
public var invButton:Button;

public var text:FlxText;
public var hint:FlxText;

override public function create() {
    try{
    _player = cast(Main.getPlayer(),Player);
    shopButton = new Button(FlxG.stage.width/2 + shopButton.width,FlxG.height - shopButton.height,2,"Enter Shop",toShop);
	continueButton = new Button(FlxG.stage.width / 2 - 2*continueButton.width,FlxG.height - continueButton.height,2,"Continue",doContinue);
	equipButton = new Button(FlxG.stage.width / 2 - 2 * equipButton.width, FlxG.height - 3*equipButton.height,2,"Equipment",_player.showEquipment);
    invButton = new Button(FlxG.stage.width / 2 + invButton.width, 2 * invButton.height,3,"Inventory",_player.showInventory);
    }catch(e:Dynamic){
        trace(e + haxe.CallStack.toString(haxe.CallStack.exceptionStack()));
    }
}
public function toShop(){
    openSubState(new Shop(FlxColor.BLACK));
}
public function doContinue(){

}
}