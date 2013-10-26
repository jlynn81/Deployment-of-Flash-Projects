package com.events
{
	import flash.events.Event;
	
	public class DataEvents extends Event
	{
		
		public static const USER_SUBMIT:String = 'userSubmit';
		
		public var userName:String;
		
		public var date:Date;
		
		public function DataEvents(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}