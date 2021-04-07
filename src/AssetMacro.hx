class AssetMacro {
    #if macro
    public static function run(kind:String,path:String){
        #if !display
        if(haxe.macro.Context.defined("display")) return;
        if(kind == "pak"){
			Sys.command("haxe", ["-lib", "heaps", "-m", "hxd.fmt.pak.Build", "-hl", "hxd.fmt.pak.Build.hl"]);
			Sys.command("hl", ["hxd.fmt.pak.Build.hl","-res","res","-out","export/js/res"]);
        }
        #end
    }
    #end
}