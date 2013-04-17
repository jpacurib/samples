package bulletexperiment
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import com.greensock.*;
	import com.greensock.motionPaths.LinePath2D;
	
	/**
	 * ...
	 * @author Jeremy
	 */
	public class Main extends Sprite 
	{
		private var bullet:Shape = new Shape();
		private var tower:Shape = new Shape();
		private var anotherObject:Shape = new Shape();
		private var path:LinePath2D = new LinePath2D([new Point(0, 0),
				new Point(stage.stageWidth-100, 0), 
				new Point(stage.stageWidth-100, 100), 
				new Point(0, 150), 
				new Point(0, 300),
				new Point(stage.stageWidth - 100, 300)]);
		
		private var mouseAttribX:int;
		private var mouseAttribY:int;
		
		private var bulletShoot:Boolean;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			bullet.graphics.beginFill(0xFF0000, 1);
			bullet.graphics.lineStyle(2, 0x000000);
			bullet.graphics.drawCircle(100, 100, 10);
			bullet.graphics.endFill();
			
			tower.graphics.beginFill(0x00FF00, 1);
			tower.graphics.lineStyle(2, 0x000000);
			tower.graphics.drawRect((stage.stageWidth / 2)-50, stage.stageHeight - 100, 100, 100);
			tower.graphics.endFill();
			
			anotherObject.graphics.beginFill(0x0000FF, 1);
			anotherObject.graphics.lineStyle(2, 0x000000);
			anotherObject.graphics.drawRect(0, 0, 100, 100);
			anotherObject.graphics.endFill();			
			
			stage.addEventListener(MouseEvent.CLICK, fireBullet);
			//addChild(bullet);
			addChild(tower);
			addChild(anotherObject);
			path.addFollower(anotherObject);
			TweenLite.to(path, 20, { progress:1 } );
			bulletShoot = false;
		}
		
		private function fireBullet(event:MouseEvent):void 
		{
			if(bulletShoot == false){
				mouseAttribX = mouseX - 100;
				mouseAttribY = mouseY - 100;
				stage.addChild(bullet);
				bullet.x = (stage.stageWidth/2)-100;
				bullet.y = (stage.stageHeight) - 200;
				TweenLite.to(bullet, .5, { x:mouseX - 100, y:mouseY - 100 } );
				bullet.visible = true;
				anotherObject.visible = true;
				this.addEventListener(Event.ENTER_FRAME, checkCollision);	
			}
		}
		
		private function checkCollision(event:Event):void 
		{
		bulletShoot = true;
		if (bullet.hitTestObject(anotherObject)) {
				bullet.visible = false;
				anotherObject.visible = false;
				bulletShoot = false;
			}
		if (bullet.x == mouseAttribX && bullet.y == mouseAttribY) {
			bullet.visible = false;
			bulletShoot = false;
			}
		}
	}
	
}