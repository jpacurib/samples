package topdownview
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class Main extends MovieClip
	{
		[Embed(source = "../../assets/tile.png", mimeType = "image/png")]
		private var grassTileClass:Class;
		
		//private var grassTile:Bitmap = new grassTileClass();
		private var arrayTile:Array;
		private var holderTile:MovieClip = new MovieClip();
		
		private var tileHeight:Number = 32;
		private var tileWidth:Number = 32;
		
		private var gameHeight:Number = 10 * tileHeight;
		private var gameWidth:Number = 10 * tileWidth;
		
		
		public function Main():void 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			arrayTile = new Array();
			
			for (var row:int = 0; row <= 10; row++) {
				
				arrayTile[row] = new Array();
				
				for (var col:int = 0; col <= 10; col++) {
					arrayTile[row][col] = new grassTileClass();
					holderTile.addChild(arrayTile[row][col]);
					//arrayTile[row][col].x = (col - row) * tileWidth;
					//arrayTile[row][col].y = (row + col) * tileHeight;
					arrayTile[row][col].x = col * tileWidth;
					arrayTile[row][col].y = row * tileHeight;
				}
				
			}
			
			addChild(holderTile);
			
			stage.stageHeight = gameHeight;
			stage.stageWidth = gameWidth;
			
			holderTile.x = (stage.stageWidth - holderTile.width)/2;
			holderTile.y = (stage.stageHeight - holderTile.height)/2;
			
		}
		
	}
	
}