package objectcollisiondetection
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class Main extends Sprite 
	{
		private var box1:Sprite = new Sprite();
		private var box2:Sprite = new Sprite();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			box1.graphics.beginFill(0x000000);
			box1.graphics.drawRect(0, 0, 100, 100);
			box1.graphics.endFill();
			
			box2.graphics.beginFill(0xFF0000);
			box2.graphics.drawRect(250, 250, 100, 100);
			box2.graphics.endFill();
			
			addChild(box1);
			addChild(box2);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, doKeyboardAction);
		}
		
		private function doKeyboardAction(event:KeyboardEvent):void {
			
			switch(event.keyCode) {
				case 37:
					box2.x -= 5;
					break;
				case 38:
					box2.y -= 5;
					break;
				case 39:
					box2.x += 5;
					break;
				case 40:
					box2.y += 5;
					break;
					
				default:
				
			}
			if (box1.hitTestObject(box2)) {
				trace("Collision Detected");
			}
		}
		
	}
	
}