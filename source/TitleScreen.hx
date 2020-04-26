package;

import flixel.util.FlxAxes;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.FlxState;

class TitleScreen extends FlxState {
    public var logo:FlxSprite;
    public var play:FlxButton;
    public var options:FlxButton;
    #if desktop
        public var closeButton:FlxButton;
    #end
	override public function create():Void{
        if(FlxG.sound.music == null){

        }
        logo = new FlxSprite("data/ui/Adventure_Logo.png");
        logo.screenCenter(FlxAxes.X);
        logo.y = logo.height/3;
        add(logo);
        play = new ui.Button("Play",clickPlay);
		play.y = 4 * logo.height / 3;
        play.x = FlxG.stage.stageWidth/2 - play.width - play.width/2;
        add(play);        
        options = new ui.Button("Options",clickOptions);
        options.y = 4 * logo.height / 3;
        options.x = FlxG.stage.stageWidth/2 + options.width/2;     
        add(options);
    }
    public function clickPlay(){
        FlxG.camera.fade(1,true,function(){
            FlxG.switchState(new FlxState());
        });
    }
    public function clickOptions(){

    }
}