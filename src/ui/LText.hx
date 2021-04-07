package ui;

import util.Lang;
import h2d.Text;

class LText extends Text {
    override public function new(font:h2d.Font,section:String,id:String,?parent) {
        super(font,parent);
        this.text = Lang.get(section,id);
        Main.dispatcher.listen(LANG_CHANGED,s -> this.text = Lang.get(section,id));
    }
}