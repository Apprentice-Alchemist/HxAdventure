package;

import explore.AreaSelect;
import hxd.res.DefaultFont;
import arcane.signal.Signal;
import h2d.Text;
import ui.Button;

class LevelScreen extends ui.Screen {

    var text:Text;
    var tip:Text;
    var stats:Text;

    var equipment:Button;
    var inventory:Button;
    var explore:Button;
    var shop:Button;

    public function new() {
        hxd.Res.images.logo.HaxeFlixel.entry.getText();
        super();
        Adventure.start();
        equipment = new Button(3,"Equipment",this,function(_){

        });
        addChild(equipment);
        inventory = new Button(3,"Inventory",this,function(_){

        });
        addChild(inventory);
        explore = new Button(3,"Explore",this,function(_){
            new AreaSelect();
        });
        addChild(explore);
        shop = new Button(3,"Shop",this,function(_){

        });
        text = new Text(DefaultFont.get(),this);
		text.maxWidth = this.width / 3;
		text.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
        text.tileWrap = true;
        text.textAlign = Center;
        text.setScale(2);

        stats = new Text(DefaultFont.get(),this);
        stats.text = "You have " + Adventure.player.get().health + " health and " + Adventure.player.get().sanity + " sanity.";
        stats.setScale(2);
        stats.textAlign = Left;
        addChild(stats);
        addChild(shop);
        onResize(null);

    }
    override function update(dt:Float) {
        stats.text = "You have " + Adventure.player.get().health + " health and " + Adventure.player.get().sanity + " sanity.";
        super.update(dt);
    }
    override function onResize(s:Signal) {
        equipment.y = inventory.y = this.height - (inventory.height * inventory.scaleX) - 20;
        equipment.x = this.width/2 - ((equipment.width * equipment.scaleX) + 10);
        inventory.x = this.width/2 + 10;

        explore.y = shop.y = equipment.y - 20 - (explore.height * explore.scaleY);
        explore.x = equipment.x;
        shop.x = inventory.x;

		text.maxWidth = this.width / 3;
		text.x = this.width / 2 - text.textWidth;
        text.y = 50;
        
        stats.maxWidth = stats.calcTextWidth(stats.text);
        stats.y = shop.y - (stats.textHeight * stats.scaleY) - 10;
        stats.x = this.width / 2 - stats.textWidth;
    }
}