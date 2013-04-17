package topdownview
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class Main extends MovieClip
	{
		[Embed(source = "../../assets/isograss.png", mimeType = "image/png")]
		private var grassTileClass:Class;
		
		[Embed(source = "../../assets/isotile.png", mimeType = "image/png")]
		private var boxTileClass:Class;
		
		//private var grassTile:Bitmap = new grassTileClass();
		private var arrayTile:Array;
		private var holderTile:MovieClip = new MovieClip();
		
		private var tileHeight:Number = 24;
		private var tileWidth:Number = 48;
		
		public function Main():void 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			var loader:URLLoader = new URLLoader();
			loader.load(new URLRequest('map.xml'));
			loader.addEventListener(Event.COMPLETE, onMapRead);
			
		}
		
		private function onMapRead(event:Event):void {
			var mapXML:XML = new XML(event.target.data);
			var mapWidth:int = int(mapXML.width);
			var mapHeight:int = int(mapXML.height);
			
			var mapTerrain:String = mapXML.terrain; 
			mapTerrain = mapTerrain.split("\t").join('');
			
			var mapTerrainData:Array = mapTerrain.split('\n');
				
			addChild(holderTile);
			
			arrayTile = new Array();
			
			for (var row:int = 0; row < mapWidth; row++) {
				
				arrayTile[row] = new Array();
				
				var mapRowData:Array = mapTerrainData[row + 1].split(',');
				
				for (var col:int = 0; col < mapHeight; col++) {
					if(mapRowData[col] == '0') arrayTile[row][col] = new grassTileClass();
					else arrayTile[row][col] = new boxTileClass(); 
					// 
					
					holderTile.addChild(arrayTile[row][col]);
					arrayTile[row][col].x = (col - row) * tileWidth / 2;
					arrayTile[row][col].y = (row + col) * tileHeight / 2;
				}
				
			}
			
			holderTile.x = (stage.stageWidth - tileWidth)/2;
			holderTile.y = (stage.stageHeight - holderTile.height)/2;
		}
		
	}
	
}