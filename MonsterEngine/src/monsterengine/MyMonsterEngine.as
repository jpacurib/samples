package monsterengine
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * Monster Properties
	 */
	public class MyMonsterEngine extends MovieClip
	{
		public var isHit:Boolean = false;
		
		public function MyMonsterEngine() 
		{
			graphics.beginFill(0xFF0000);
			graphics.drawCircle(0, 0, 10);
			graphics.endFill();
			visible = true;
		}
	}
	
}