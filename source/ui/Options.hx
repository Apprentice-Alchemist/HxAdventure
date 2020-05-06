package ui;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxAxes;
import flixel.ui.FlxBar;
import flixel.util.FlxSave;
import flixel.FlxSubState;

class Options extends FlxSubState {
    var options:FlxSave;
    override public function create(){
        var options = new FlxSave();
        options.bind("settings");
        var volumeBar = new FlxBar(0,0,FlxBarFillDirection.LEFT_TO_RIGHT,300,50);
        volumeBar.screenCenter(FlxAxes.XY);
        volumeBar.createFilledBar(FlxColor.BLACK,FlxColor.GRAY,true,FlxColor.WHITE);
        volumeBar.percent = FlxG.sound.volume * 100;
        var oldVolumeHandler = FlxG.sound.volumeHandler;
        FlxG.sound.volumeHandler = function(f){
            volumeBar.percent = f*100;
        }
        add(volumeBar);
        var volumetext = new FlxText(0,0,volumeBar.width/2);
        volumetext.setFormat(8*3);
        volumetext.text = "Volume";
        volumetext.x = FlxG.width/2 - volumetext.width/2;
        volumetext.y = FlxG.height/2 - volumetext.height;
        add(volumetext);
		var volumeDown = new Button(0, 0,3,"-", function() {
            FlxG.sound.changeVolume(-0.1);            
        });
        volumeDown.loadGraphic("data/ui/button.png",true,20,20);
        volumeDown.resetHelpers();
        volumeDown.label.updateHitbox();
        volumeDown.updateHitbox();        
        volumeDown.x = FlxG.width/2 - volumeBar.width/2 - volumeDown.width/3 - volumeDown.width;
		volumeDown.screenCenter(FlxAxes.Y);
        add(volumeDown);
   
		var volumeUp = new Button(0, 0, 3,"+", function() {
			FlxG.sound.changeVolume(0.1);
		});
		volumeUp.loadGraphic("data/ui/button.png", true, 20, 20);
        volumeUp.resetHelpers();
        volumeUp.label.updateHitbox();
        volumeUp.updateHitbox();
		volumeUp.x = FlxG.width / 2 + volumeBar.width / 2 + volumeUp.width / 3;
		volumeUp.screenCenter(FlxAxes.Y);
        add(volumeUp);
       
        var backButton = new Button(0,0,2,"Back",function(){
            FlxG.sound.volumeHandler = oldVolumeHandler;
            options.data.volume = FlxG.sound.volume;
            close();
        });
        backButton.y = volumeBar.y + 100;
        backButton.screenCenter(FlxAxes.X);
        add(backButton);
		super.create();
    }
}