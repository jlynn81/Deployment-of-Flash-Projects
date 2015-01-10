package managers
{
	public class ScrollerManager extends SliderManager
	{
		private var _potential:Number
		
		public function ScrollerManager(vertical:Boolean=true)
		{
			super(vertical);
		}
		private function resizeHandle():void
		{
			if (_vertical)
			{
				_handle.height = _track.height *(1 - potential);
			}else{
				_handle.width = _track.width * (1 - potential);
			}
		}

		public function get potential():Number
		{
			return _potential;
		}

		public function set potential(value:Number):void
		{
			if (value > 1)
			{
				value = 1;
			}else if (value <0){
				value = 0;	
			}
			
			_potential = value;
			resizeHandle();
		}

	}
}