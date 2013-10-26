package shapes
{
	import interfaces.ISprite;
	
	import flash.display.Sprite;
	
	public class Star extends Sprite implements ISprite
	{
		private var _color:uint;
		private var _radius:int;
		
		public function Star(c:uint = 0xFF000000, r:int = 15)
		{
			_color=c;
			_radius=r;
			createStar();
		}
		
		private function createStar():void
		{
			//canvas is the Star so use the word this in its place
			this.graphics.lineStyle(3, _color);
			this.graphics.moveTo(_radius, 0);
			for (var i:int; i < 11; i++)
			{
				var radius2:Number = _radius;
				
				if (i % 2 > 0)
					radius2 = _radius/2;
				
				var angle:Number = (6.28 / 10) * i;
				
				this.graphics.lineTo(Math.cos(angle) * radius2, Math.sin(angle) * radius2);
				
			}
		}	
		public function update():void
		{
				
		}
	}
}
