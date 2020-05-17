package ;

import haxe.ui.containers.Box;
import haxe.ui.core.Screen;
import haxe.ui.components.Button;
import haxe.ui.containers.VBox;
import flixel.FlxG;
import haxe.ui.HaxeUIApp;
import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

class Main {
    public static function main() {
        #if hl
        hl.UI.closeConsole();
        #end
        var app = new HaxeUIApp();
        app.ready(function() {
            // var main:Component = ComponentMacros.buildComponent("assets/main.xml");
            var main:Component = new Box();
            main.paddingBottom = main.paddingTop = main.paddingLeft = main.paddingRight = 50;
            var button:Button = new Button();
            button.text = "Play";
            button.fontSize = 32;
            button.left = button.screen.width/2;
            button.top = button.screen.height/2;
            button.iconPosition = "down";
            button.paddingLeft = button.paddingTop = button.paddingRight = button.paddingBottom = 20;
            // button.layout.
            button.onClick = function(e){
                button.text == "Fail!" ? button.text = "Play" : button.text = "Fail!";
            }
            main.addComponent(button);
            app.addComponent(main);
            app.start();            
        });
    }
}
