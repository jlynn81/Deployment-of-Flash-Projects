package shapes
{
	import shapes.Star;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import shapes.Star;
	
	public class CreatingReusableShapes extends Sprite
	{
		private var _sky:Sprite;
		//its a sprite becasue the child is a Sprite and we are making an instance of the stars
		public function CreatingReusableShapes()
		{
			//to create a stars upon clicking on the screen
			
			_sky = new Sprite();
			this.addChild(_sky);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, makeStar);
			
		}
		private function makeStar(e:MouseEvent):void
		{
			var myStar:Star = new Star();
			myStar.x =e.stageX;
			myStar.y =e.stageY;
			_sky.addChild(myStar);
		}
	}
}