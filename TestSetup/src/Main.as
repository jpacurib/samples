package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class Main extends Sprite 
	{
		private var myStarling:Starling;
		
		public function Main():void 
		{
			super();			
			myStarling = new Starling(Screen, this.stage);
			myStarling.antiAliasing = 1;
			myStarling.start();
		}
		
				
	}
	
}