package color
{
	import flash.display.Shape;
	
	public class ColorTransform_Box extends Shape
	{
		public function ColorTransform_Box()
		{
			super();
			makeShape();
		}
		private function makeShape():void
		{
			this.graphics.lineStyle(1, 0x000000);
			this.graphics.beginFill(0x000000);
			this.graphics.drawRect(0,0,50,50);
			this.graphics.endFill();
			
		}
	}
}