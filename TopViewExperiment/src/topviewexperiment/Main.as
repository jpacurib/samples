package topviewexperiment
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class Main extends Sprite 
	{
		[Embed(source = "../../assets/boxtile.png", mimeType = "image/png")]
		private var tileBox:Class;
		[Embed(source = "../../assets/tile.png", mimeType = "image/png")]
		private var tileGrass:Class;
		
		
		//
		private var tileClip:MovieClip = new MovieClip();
		private var tileArray:Array = new Array();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			generateTile();
		}
		
		private function generateTile():void
		{
			for (var row:int = 0 ; row < 20; row ++) 
			{
				tileArray[row] = new Array();
				
				for (var col:int = 0; col < 20; col++) 
				{
					if (col == 10) tileArray[row][col] = new tileBox();
					else tileArray[row][col] = new tileGrass();
					tileArray[row][col].x = col * 32;
					tileArray[row][col].y = row * 32;
					
					tileClip.addChild(tileArray[row][col]);
				}
			}
			
			addChild(tileClip);
			tileClip.x = (stage.stageWidth - tileClip.width) / 2;
			tileClip.y = (stage.stageHeight - tileClip.height) / 2;
		}
		
	}
	
}