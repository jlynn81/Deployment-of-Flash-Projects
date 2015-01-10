package managers
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;

	public class SliderManager extends EventDispatcher
	{
		protected var _track:Sprite;
		protected var _handle:Sprite;
		
		private var _percent:Number = 0;
		protected var _vertical:Boolean = false;
		
		public function SliderManager(vertical:Boolean = false)
		{
			_vertical = vertical;
		}
		
		public function setUpAssets (track:Sprite, handle:Sprite):void
		{
			_track = track;
			_handle = handle;
			
			_handle.buttonMode = true;
			//anytime the mouse is down while ontop of the handle
			_handle.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			
		}
		private function onMouseUp(event:MouseEvent):void
		{
			_handle.stopDrag();
			_handle.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			//this will allow the user to stop drag but will continue to run
			_handle.addEventListener(Event.ENTER_FRAME, calcPercent);
		}
		
		private function onMouseDown(event:MouseEvent):void
		{
			_handle.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			//_handle.stopDrag(false);//this makes the handle move with the mouse left to right
			
			//this helps to make the scroll bar vertical
			if (_vertical)
			{
				_handle.startDrag(false, new Rectangle(0, 0, (_track.height - _handle.height), 0)); 

				
			}else{
				_handle.startDrag(false, new Rectangle(0, 0, (_track.width - _handle.width), 0)); 
			}
			
			//_handle.startDrag(false, new Rectangle(0, 0, (_track.width - _handle.width), 0));
			//(0, 0 top left handle corner of movieclip, _track.width - _handle.width is so that the handle will only go within the track
		}
		
		private function calcPercent(event:Event):void
		{
			//this allows you to calculate a percentage as you scole the handle left to right
			//var prc:Number = _handle.x / (_track.width - _handle.width);
			//this will allow you to beable to stop the percentage from being recieved
			var prc:Number;
			if (_vertical)
			{
				prc = _handle.y / (_track.height - _handle.height);
			}else{
				prc = _handle.x / (_track.width - _handle.width);
			}
			
			if(_percent != prc)
			{
				_percent = prc;
				
				//create a dispatch of an event
				var evt:Event = new Event(Event.CHANGE);
				this.dispatchEvent(evt);
			}
		}
		protected function updateHandle():void
		{
			if (_vertical)
			{
				_handle
			}else{
				_handle.x = (_track.width - _handle.width) * _percent;
			}
		}
		
		public function get percent():Number
		{
			return _percent;
		}
		public function set percent(value:Number):void
		{
			if (value > 1)
			{
				value = 1;
			}else if (value <0){
				value = 0;	
			}
			_percent = value;
			
			updateHandle();
		}
			

		public function get vertical():Boolean
		{
			return _vertical;
		}

		public function set vertical(value:Boolean):void
		{
			_vertical = value;
		}

	}
}