package;

final class Const {
    public static final WIDTH = 244 * 3;
    public static final HEIGHT = 144 * 3;

    public static final SCREEN_LAYER = 0;
    /**
     * Battle effects, ie damage/heal popups?
     */
    public static final EFFECT_LAYER = 1;
    public static final NOTIFICATION_LAYER = 2;

    public static final LANG_CHANGED:SignalType<String> = "lang_changed";
}