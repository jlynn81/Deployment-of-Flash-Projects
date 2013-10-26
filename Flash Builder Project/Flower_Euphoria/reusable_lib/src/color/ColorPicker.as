package color
{
	
	import image_Stuff.ImageEvent;
	import image_Stuff.ImageEvent;
	
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import image_Stuff.ImageLoader;
	
	public class ColorPicker extends Sprite
	{
		private var _bmd:BitmapData;
		
		public function ColorPicker(img:String)//image that is used to select color from
		{
			super();
			var ld:ImageLoader = new ImageLoader("images/colorselection.jpg");
			ld.addEventListener(ImageEvent.IMAGE_LOADED, onLoad);
			
		}
		private function onLoad(e:ImageEvent):void
		{
			this.addChild(e.image);
			_bmd = e.image.bitmapData;
			this.addEventListener(MouseEvent.MOUSE_DOWN, onSelect);
		}
		private function onSelect(e:MouseEvent):void
		{
			var colorSelected:uint = _bmd.getPixel(e.localX, e.localY);
				//localX and localY is the acutal location of the color within the bitmapData
			//trace(color.toString(16));//allows you to see the hex decimal of the color selected upon clicking the image
			var evt:ColorPickerEvent = new ColorPickerEvent(ColorPickerEvent.COLOR_CHANGE);	
				evt.colors=colorSelected;
				dispatchEvent(evt);		
		}
	}
}