package isometrictiled
{
	import flash.display.Loader;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
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
			var loader:URLLoader = new URLLoader();			
			
			loader.addEventListener(Event.COMPLETE, onMapLoaded);
			loader.load(new URLRequest('map.xml'));
			
		}
		
		public function myEvent(event:MouseEvent):void {
			trace("Hello World");
		}
		
		public function onMapLoaded(event:Event):void {
			
			var mapXML = new XML(event.target.data);
			
			var mapWidth:int = int(mapXML.width);
			var mapHeight:int = int(mapXML.height);
			
			var mapTerrain:String = mapXML.terrain;
			mapTerrain = mapTerrain.split("\t").join('');
			
			tileArray = new Array();
			
			//map parse
			for (var row:int = 0; row < 10; row++) {
				tileArray[row] = new Array();
				
				var mapRowData:Array = mapTerrain[row + 1].split(",");
				
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
				
	}
	
}