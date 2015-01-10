package color
{
	import flash.events.Event;
	
	public class ColorPickerEvent extends Event
	{
		public static const COLOR_CHANGE:String = "color change";
		
		public var colors:uint;
		
		public function ColorPickerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		public override function clone():Event
		{
			return new ColorPickerEvent(type, bubbles, cancelable);
		}
	}
}