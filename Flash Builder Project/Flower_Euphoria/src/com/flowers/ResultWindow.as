package com.flowers
{
	import com.events.DataEvents;
	import com.flowers.DailyData;
	
	import flash.display.Loader;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	import libs.CloseButton;
	import libs.MinimixeButton;
	import libs.Next;
	import libs.Previous;
	import libs.ResultBase;
	import libs.UserBase;
	
	import viewer.ImageViewer;
	
	
	public class ResultWindow extends ResultBase
	{
		private var _imageList:Array;
		public var sd:Date;
		private var _selectedFlower:FlowerVO;
		private var _currentDay:int;
		public var iv:ImageViewer;
		
		
		public function ResultWindow()
		{
			super();
			
			init();
		}
		private function init():void
		{
			
			var mb:MinimixeButton = new MinimixeButton();
			mb.addEventListener(MouseEvent.CLICK, miniApp);
			this.addChild(mb);
			mb.x = 185;
			mb.y = -210;
			mb.buttonMode = true;
			mb.scaleX = mb.scaleY = .3;
			
			var close:CloseButton = new CloseButton();
			close.addEventListener(MouseEvent.CLICK, closeApp);
			this.addChild(close);
			close.x = 165;
			close.y = -210;
			close.buttonMode = true;
			close.scaleX = close.scaleY = .3;
			
			sd = new Date();
			//d.date--;
			dateLabel.text = sd.toLocaleDateString();
			
			var p:Previous = new Previous();
			p.x = -125;
			p.y = -160;
			p.addEventListener(MouseEvent.CLICK, clickPrevious);
			addChild(p);
			
			var n:Next = new Next();
			n.x = 130;
			n.y = -160;
			n.addEventListener(MouseEvent.CLICK, clickNext);
			addChild(n);
			
		}
		private function clickNext(event:MouseEvent):void
		{
			sd.date++;
			dateLabel.text = sd.toLocaleDateString();
			//click next needs to move to next image
			//trace("Next");
			iv.next();
			
		}
		private function clickPrevious(event:MouseEvent):void
		{
			sd.date--;
			dateLabel.text = sd.toLocaleDateString();
			//click previous needs to move to previous image
			//trace("Previous");
		}
		
		private function miniApp(event:MouseEvent):void
		{
			stage.nativeWindow.minimize();
			//trace("I have minimized the application");
		}
		private function closeApp(event:MouseEvent):void
		{
			stage.nativeWindow.close();
			//trace("I have closed the application");
		}
		

		public function get imageList():Array
		{
			return _imageList;
		}

		public function set imageList(value:Array):void
		{
			_imageList = value;
			
			
			if(_imageList.length < 1){
				return;
			}
			//for each(var p:PhotoVO in _imageList)
			//{
				var l:Loader = new Loader();
				l.load(new URLRequest(_imageList[0].largeURL));
				l.x = -170;
				l.y = -115;
				l.scaleX = l.scaleY = .35;
				imageViewer.addChild(l);
				l.mask = imageViewer.masker;
				
				iv = new ImageViewer();
				
			//}
			
		}

		public function get selectedFlower():FlowerVO
		{
			return _selectedFlower;
		}

		public function set selectedFlower(value:FlowerVO):void
		{
			_selectedFlower = value;
			
			//Update text display
			flowerInfo.flowerInfoLabel.text = _selectedFlower.info;
			flowerInfo.titleLabel.text = _selectedFlower.flowerName;
		}

		public function updateUserInfo(userName:String,selectedDate:Date):void
		{
			userLabel.text = "Hello" + " " + userName;
			dateLabel.text = selectedDate.toLocaleDateString();
		}
	}
}