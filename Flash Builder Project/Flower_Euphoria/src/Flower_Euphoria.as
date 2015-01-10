package
{
	import Flickr.FlickerService;
	import Flickr.FlickrEvent;
	
	import com.events.DataEvents;
	import com.flowers.DailyData;
	import com.flowers.FlowerVO;
	import com.flowers.FlowersView1;
	import com.flowers.PhotoVO;
	import com.flowers.ResultWindow;
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.Capabilities;
	
	import flashx.textLayout.formats.BackgroundColor;
	
	[SWF(width="750", height="400", backgroundColor="#000000", frameRate="60")]
	
	public class Flower_Euphoria extends Sprite
	{

		private var _resultWindow:ResultWindow;

		private var _flowerSearchView:FlowersView1;

		private var _svc:FlickerService;
		
		public function Flower_Euphoria()
		{
			
			stage.nativeWindow.x = (Capabilities.screenResolutionX - stage.nativeWindow.width)/2;
			stage.nativeWindow.y = (Capabilities.screenResolutionY - stage.nativeWindow.height)/2;
			
			_flowerSearchView = new FlowersView1();
			this.addChild(_flowerSearchView);
			_flowerSearchView.addEventListener(DataEvents.USER_SUBMIT,submittedData);
			_flowerSearchView.x = 350;
			_flowerSearchView.y = 150;
			
			_resultWindow = new ResultWindow();
			_resultWindow.x = 350;
			_resultWindow.y = 200;
			_resultWindow.scaleX = _resultWindow.scaleY = .9;
			
			_svc = new FlickerService();
			_svc.addEventListener(FlickrEvent.SEARCH_COMPLETE, onSearchComplete)
			//_svc.search("Flowers");
			
			
		}
		
		protected function submittedData(event:DataEvents):void
		{
			
			// date.day will give you a number 0-6 corresponding to sunday-saturday... or indices of a 7-item array.  :-)
			var selectedFlower:FlowerVO = DailyData.getDays()[0];
			_svc.search(selectedFlower.flowerName);
			_resultWindow.updateUserInfo(event.userName,event.date);
			_resultWindow.selectedFlower = selectedFlower;
			
		}
		private function onSearchComplete(e:FlickrEvent):void
		{
			this.addChild(_resultWindow);
			if(this.contains(_flowerSearchView))
			{
				removeChild(_flowerSearchView);
				
			}
			
			_resultWindow.imageList = e.photoArray;
		}
	}
}