package Flickr
{
	import flash.events.Event;
	
	public class FlickrEvent extends Event
	{
		public static const SEARCH_COMPLETE:String = "search Complete";
		
		public var photoArray:Array;
		
		public function FlickrEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}