package  
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class Screen extends Sprite 
	{

		public function Screen() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init);			
		}		
		
		protected function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
		
			trace("Starling Initialized");			
		}		
		
	}

}