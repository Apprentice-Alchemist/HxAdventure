package;

import arcane.utils.Utils;
// import flixel.util.FlxColor;
import haxe.ui.components.*;
import flixel.util.FlxAxes;
// import flixel.FlxG;
// import flixel.FlxSprite;
// import flixel.FlxState;

// class TitleScreen extends FlxState {
//     public var logo:Dynamic;
//     public var play:Button;
//     public var options:Button;
//     #if desktop
//         public var closeButton:Button;
//     #end
// 	override public function create():Void{
//         trace("TitleScreen!");        
//         try{        
//         logo = new FlxSprite("data/ui/Adventure_Logo.png");
//         logo.scale.set(1,1);
//         logo.updateHitbox();
//         logo.screenCenter(FlxAxes.X);
//         logo.y = logo.height/3;
//         add(logo);
//         play = new haxe.ui.components.Button();
//         play.text = "Play";
//         play.fontSize = 30;
//         play.onClick = function(e){
//             trace("Play!");
//         }
//         add(play);
//     //     play = new Button(0,0,2,"Play",clickPlay);
//     //     play.y = 4 * logo.frameHeight / 3;
//     //     play.x = FlxG.stage.stageWidth/2 - 3*play.width;
//     //     play.makeGraphic(Std.int(play.width),Std.int(play.height));
//     //     play.updateHitbox();
//     //     trace("(" + play.x + "," + play.y + ")");
//     //     trace(play.width + "x" + play.height);
//     //     add(play);        
// 	// 		var thing = new flixel.ui.FlxButton(play.x,play.y,"Text",function(){
//     //             trace("Pressed!");
//     //         });
//     //         add(thing);
// 	// 	options = new Button(0, 0, "Options", clickOptions);
//     //     options.y = 4 * logo.frameHeight / 3;
//     //     options.x = FlxG.stage.stageWidth / 2 + 2 * options.width;
//     //     // options.updateHitbox();
//     //     add(options);
//         #if desktop
//     //     closeButton = new Button(0,0,2,"Exit",function(){
//     //         Main.settings.close();
//     //         Main.saves.close();
//     //         Sys.exit(0);
//     //     });
// 	// 	closeButton.y = 4 * logo.frameHeight / 3;
//     //     closeButton.screenCenter(FlxAxes.X);
//     //     // closeButton.updateHitbox();
//     //     add(closeButton);
//         #end
//     }catch(e:Dynamic){
//         trace("Error!");
//         trace(e + Utils.makeCallStack());
//     }
//     }
//     public function clickPlay(){
//         FlxG.camera.fade(2,false,function(){
//             Main.isPlaying = true;
//             FlxG.switchState(new LevelScreen());
//         });
//     }
//     public function clickOptions(){
//         var options = new ui.Options(FlxColor.BLACK);
//         openSubState(options);
//     }
// }