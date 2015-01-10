package viewer
{
	import image_Stuff.ImageLoader;
	import image_Stuff.ImageEvent;
	
	import flash.display.Sprite;
	
	public class ImageViewer extends Sprite
	{
		//what properties are required
		private var _imageList:Array;
		private var _path:String;
		private var _currentImage:int;
		private var _ld:ImageLoader;
		
		public function ImageViewer()
		{
			super();
			
			//initialize some of these properties
			init();
		}
		private function init():void
		{
			_imageList = [];
			_currentImage = 0;
			
		}
		private function loadImg():void
		{
			_ld = new ImageLoader(_path + _imageList[_currentImage]);
				//used everytime that we have to load a new image
			_ld.addEventListener(ImageEvent.IMAGE_LOADED, onLoad);	
		}
		private function onLoad(e:ImageEvent):void
		{
			//only holds one image at a time
			//Code below is what is utilized so that the image will be
			//replaced with another image
			if(this.numChildren > 0)
			{
				this.removeChildAt(0)
			}
			this.addChild(e.image)
		}
		public function display():void//has to be called from outside of this class
		{
			//starts the loading process
			loadImg();
		}
		public function next():void
		{
			_currentImage ++;
			if (_currentImage ==_imageList.length)//determins how many cycles through the array
			{
				_currentImage = 0;
			}
			_ld = new ImageLoader(_path + _imageList[_currentImage]);
				
			_ld.addEventListener(ImageEvent.IMAGE_LOADED, onLoad);		
		}
		public function previous():void
		{
			_currentImage --;//this allows for the revers direction
			if (_currentImage<0)
			{
				_currentImage = _imageList.length - 1//-1 is due to the 0 based indexing for the array
			}
			_ld = new ImageLoader(_path + _imageList[_currentImage]);
				
			_ld.addEventListener(ImageEvent.IMAGE_LOADED, onLoad);	
		}
		//where are the files located
		public function set path(value:String):void
		{
			_path = value;
		}
		public function set imageList (value:Array):void
		{
			_imageList = value;
		}
	}
}