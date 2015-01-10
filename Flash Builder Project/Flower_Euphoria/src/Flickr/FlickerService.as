package Flickr
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import com.flowers.PhotoVO;
	
	public class FlickerService extends EventDispatcher
	{
		private static const API_KEY:String = "b9d76f7667b032f779ecf6e66a40bab8";
		
		public function FlickerService(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function search(keyword:String, pageNum:int = 1):void
		//defaults to return page 1 of the document
		{
			var url:String = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=" + API_KEY + "&tags=" + keyword+ "&text=&extras=url_l,url_s&per_page=30&page=" + pageNum + "&format=rest";
			//trace(url);
			
			var request:URLRequest = new URLRequest(url);
			
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.load(request);
		}
		private function onComplete(e:Event):void
		{
			//trace(e.target.data);
			var xmlData:XML = new XML(e.target.data);
			
			var photoArray:Array = [];
			
			//loops through the photo node for different images within the image location
			for each (var pXML:XML in xmlData.photos.photo)
			{
				//trace(pXML.@title);
				var iVO:PhotoVO = new PhotoVO();
				iVO.title = pXML.@title;
				iVO.ownerID = pXML.@owner;
				iVO.largeURL = pXML.@url_l;
				iVO.smaleURL = pXML.@url_s;
				
				photoArray.push(iVO);
			}
			trace(photoArray);
			
			var evt:FlickrEvent = new FlickrEvent(FlickrEvent.SEARCH_COMPLETE);
			evt.photoArray = photoArray;
			dispatchEvent(evt);
		}
		
	}
}