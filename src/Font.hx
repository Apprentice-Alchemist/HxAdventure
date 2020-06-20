package;

import hxd.res.DefaultFont;

class Font {
    @:noCompletion static var inst:h2d.Font;
    public static function get() {
        if(inst == null){inst = DefaultFont.get().clone();}
        return inst;
    }
}