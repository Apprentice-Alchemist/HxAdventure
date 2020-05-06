package;

import flixel.util.FlxColor;
import ui.*;
import flixel.util.FlxAxes;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class TitleScreen extends FlxState {
    public var logo:FlxSprite;
    public var play:Button;
    public var options:Button;
    #if desktop
        public var closeButton:Button;
    #end
	override public function create():Void{
        trace("Title");
        logo = new FlxSprite("data/ui/Adventure_Logo.png");
        logo.scale.set(1,1);
        logo.updateHitbox();
        logo.screenCenter(FlxAxes.X);
        logo.y = logo.height/3;
        add(logo);
        play = new Button(0,0,2,"Play",clickPlay);
        play.y = 4 * logo.height / 3;
        play.x = FlxG.stage.stageWidth/2 - 3*play.width;
		play.updateHitbox();
        add(play);        

		options = new Button(0, 0, "Options", clickOptions);
        options.y = 4 * logo.height / 3;
        options.x = FlxG.stage.stageWidth / 2 + 2 * options.width;
        options.updateHitbox();
        add(options);
        #if desktop
        closeButton = new Button(0,0,2,"Exit",function(){
            Main.settings.close();
            Main.saves.close();
            Sys.exit(0);
        });
		closeButton.y = 4 * logo.frameHeight / 3;
        closeButton.screenCenter(FlxAxes.X);
        closeButton.updateHitbox();
        add(closeButton);
        #end
    }
    public function clickPlay(){
        FlxG.camera.fade(2,false,function(){
            Main.isPlaying = true;
            FlxG.switchState(new LevelScreen());
        });
    }
    public function clickOptions(){
        var options = new Options(FlxColor.BLACK);
        openSubState(options);
    }
}