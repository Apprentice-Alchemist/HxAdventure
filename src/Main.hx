package ;

import haxe.ui.components.Button;
import haxe.ui.containers.VBox;
import flixel.FlxG;
import haxe.ui.HaxeUIApp;
import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

class Main {
    public static function main() {
        var app = new HaxeUIApp();
        app.ready(function() {
            // var main:Component = ComponentMacros.buildComponent("assets/main.xml");
            var main:Component = new VBox();
            main.paddingBottom = main.paddingTop = main.paddingLeft = main.paddingRight = 5;
            var button:Button = new Button();
            button.text = "Play";
            button.fontSize = 24;
            button.onClick = function(e){
                button.text == "Fail!" ? button.text = "Play" : button.text = "Fail!";
            }
            main.addComponent(button);
            app.addComponent(main);
            app.start();            
        });
    }
}
