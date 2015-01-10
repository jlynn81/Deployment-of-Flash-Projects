package shapes
{
	import flash.display.Shape;
	
	public class Circles extends Shape
	{
		private var _c:Number;
		private var _s:Number;
		
		public function Circles(color:Number, size:Number)
		{
			super();
			
			_c = color;
			_s = size;
			
			this.graphics.lineStyle(1, _c);
			
			this.graphics.beginFill(_c);
			
			this.graphics.drawCircle(0,0,_s);
			
			this.graphics.endFill();
		}
	}
}