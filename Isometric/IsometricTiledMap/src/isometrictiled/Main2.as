package isometrictiled
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class Main extends MovieClip
	{
		[Embed(source = "../../assets/grass.png", mimeType = "image/png")]
		private var myTileClass:Class;
		
		private var myTile:Bitmap = new myTileClass();
		
		private var tileArray:Array;
		private var tileHolder:MovieClip = new MovieClip();
		private var tileHeight:Number = 24;
		private var tileWidth:Number = 48;
		
		
		public function Main():void {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 	{
			tileArray = new Array();

			for (var row:int = 0; row < 10; row++) {
				tileArray[row] = new Array();
				
				for (var col:int = 0; col < 10; col++) {	
					tileArray[row][col] = new myTileClass();
					tileHolder.addChild(tileArray[row][col]);
					tileArray[row][col].x = (col - row) * tileWidth / 2;
					tileArray[row][col].y = (row + col) * tileHeight / 2;
					//tileHolder.addEventListener(MouseEvent.CLICK, myEvent);
					}
				
			}
			
			addChild(tileHolder);
			tileHolder.x = (stage.stageWidth - tileWidth) / 2;
			tileHolder.y = (stage.stageHeight - tileHolder.height) / 2;			
			tileHolder.addEventListener(MouseEvent.CLICK, myEvent);
			
		}
		
		public function myEvent(event:MouseEvent):void {
			trace(tileArray[x][y]);
		}
		
	}
	
}