package ui;
// import openfl.events.MouseEvent;
// import openfl.Lib;
// import openfl.display.Sprite;
// import openfl.Assets;
// import openfl.display.Bitmap;
// class Title extends Sprite{
//     var lastTime:Int = 0;
//     public var buttons:Array<Dynamic>;
//     public function new(){
//         buttons = [];
//         super();
//         var logo = new Bitmap(Assets.getBitmapData("data/ui/arcane.adventure_Logo.png"));
//         addChild(logo);
//         logo.x = Lib.current.stage.stageWidth/2 - logo.width/2;
//         logo.y = Lib.current.stage.stageHeight/2 - logo.height/2;        
//         this.buttons.push(addChild(new ui.Button(20,20,"X")));
//         init();
//     }
//     public function init(){
//         destroy();
//         lastTime = Lib.getTimer();
//         Lib.current.stage.addEventListener("enter_frame", enter_frame);
//         this.addEventListener(MouseEvent.CLICK,onClick);        
//     }
//     public function destroy(){
//         Lib.current.stage.removeEventListener("enter_frame",enter_frame);
//     }
//     private function enter_frame(e){
//         var time = Lib.getTimer();
//         var elapsed = lastTime - time;
//         for(o in this.buttons){
//             o.enter_frame(e);
//         }
//     }
//     public function onClick(e){

//     }
// }