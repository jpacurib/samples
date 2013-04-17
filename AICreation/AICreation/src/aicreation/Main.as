package aicreation
{
	import com.greensock.motionPaths.LinePath2D;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import com.greensock.*;
	import flash.geom.Point;
	import flash.utils.Timer;

	/**
	 * ...
	 * @author Jeremy
	 */
	public class Main extends Sprite 
	{
		private var myMovieClip:MovieClip = new MovieClip();
		private var imgArray:Array = new Array();
		private var path:LinePath2D = new LinePath2D([new Point(0, 0),
				new Point(stage.stageWidth-32, 0), 
				new Point(stage.stageWidth-32, 150), 
				new Point(0, 150), 
				new Point(0, 300),
				new Point(stage.stageWidth - 32, 300)]);
		//private var timer:Timer = new Timer(5000, -1);
		
		[Embed(source = "../../assets/tile.png", mimeType = "image/png")]
		private var tileClass:Class;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			addChild(path);
			imgArray[0] = new tileClass();
			myMovieClip.addChild(imgArray[0]);	
			
			path.addFollower(myMovieClip);
			addChild(myMovieClip);
			path.visible = false;
			TweenLite.to(path, 20, { progress:1 } );
		}		
	}
	
}