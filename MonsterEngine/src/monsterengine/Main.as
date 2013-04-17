package monsterengine
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class Main extends MovieClip
	{
		private var monsterArray:Array = new Array();
		private var monsterCounter:int;
		private var lastTime:int;
		private const totalMonster:int = 100;
		
		public function Main():void 
		{
			startMonsterEngine();
		}
		
		private function startMonsterEngine():void 
		{
			lastTime = 0;
			monsterCounter = 0;
			this.addEventListener(Event.ENTER_FRAME, startLoop);
			this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		}
		
		private function startLoop(event:Event):void 
		{
			if (lastTime == 0) lastTime = getTimer();
			
			var timeDifference:int = getTimer() - lastTime;
			lastTime += timeDifference;
			
			monsterCounter += timeDifference;
			
			if (monsterCounter <= 0) 
			{
				var monster:MyMonsterEngine = new MyMonsterEngine();
				monster.x = -30;
				monster.y = Math.random() * 480;
				this.addChild(monster);
				monsterArray.push(monster);
				monsterCounter = totalMonster;
				
			}
			
			//move
			for (var i:int = monsterArray.length -1; i >= 0; i--) 
			{
				var ms:MyMonsterEngine = monsterArray[i];
				if (ms.x > 670 || ms.isHit) 
				{
					this.removeChild(ms);
					monsterArray.splice(i, 1);
				}
			}
		}
		
		private function mouseDown(event:MouseEvent):void 
		{
			if (event.target is MyMonsterEngine) 
			{
				var ms:MyMonsterEngine = event.target as MyMonsterEngine;
				ms.isHit = true;
			}
		}
	}
	
}