package com.flowers
{
	import flash.display.NativeWindow;
	import flash.display.NativeWindowInitOptions;
	import flash.display.Sprite;
	import flash.system.Capabilities;
	
	public class ScreenLocation extends Sprite
	{
		//to make a new nativeWindow
		private var o:NativeWindowInitOptions = new NativeWindowInitOptions();
		private var n:NativeWindow;
		public function ScreenLocation()
		{
			super();
			
			stage.nativeWindow.x = (Capabilities.screenResolutionX - stage.nativeWindow.width)/2;
			stage.nativeWindow.y = (Capabilities.screenResolutionY - stage.nativeWindow.height)/2;
		
			o.maximizable = false;
			n = new NativeWindow(o);
			n.visible = true;
		}
	}
}