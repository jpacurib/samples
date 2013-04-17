package buildable
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class Main extends MovieClip
	{
		[Embed(source = "../../assets/isograss.png", mimeType = "image/png")]
		private var isoGrassClass:Class;
		
		[Embed(source = "../../assets/isotile.png", mimeType = "image/png")]
		private var isoTileClass:Class;
		
		private var tileHolder:MovieClip = new MovieClip();
		private var tileArray:Array = new Array();
		private var tileHeight:int = 24;
		private var tileWidth:int = 48;
			
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			var mapLoader:URLLoader = new URLLoader();
			mapLoader.load(new URLRequest('map.xml'));
			mapLoader.addEventListener(Event.COMPLETE, onMapLoad);
		}
		
		private function onMapLoad(event:Event):void 
		{
			var mapXML:XML = new XML(event.target.data);
			var mapWidth:int = int(mapXML.width);
			var mapHeight:int = int(mapXML.height);
			
			var mapTerrain:String = mapXML.terrain;
			mapTerrain = mapTerrain.split('\t').join('');
			
			var mapTerrainData:Array = mapTerrain.split('\n');
			
			tileArray = new Array();
			addChild(tileHolder);
			//Generator
			for (var row:int = 0 ; row < mapWidth; row++) {
				
				tileArray[row] = new Array();
				var mapRowData:Array = mapTerrainData[row + 1].split(',');
				
				for (var col:int = 0; col < mapHeight; col++) {
					if (mapRowData[col] == '0') {
						tileArray[row][col] = new isoGrassClass();
						tileHolder.addEventListener(MouseEvent.CLICK, onMouseClick);
					}
					else {
						tileArray[row][col] = new isoTileClass();
					}
					
					tileHolder.addChild(tileArray[row][col]);
					
					tileArray[row][col].x = (col - row) * tileWidth / 2;
					tileArray[row][col].y = (row + col) * tileHeight / 2;
					
				}
				
				tileHolder.x = (stage.stageWidth - tileWidth) / 2;
				tileHolder.y = (stage.stageHeight - tileHeight) / 2;
			}
		}
		
		private function onMouseClick(event:Event):void {
			trace(event);
		}
		
	}
	
}