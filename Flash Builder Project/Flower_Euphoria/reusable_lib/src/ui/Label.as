package ui
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class Label extends Sprite
	{
		private var _tf:TextField;
		private var _fmt:TextFormat;
		private var _font:String;
		private var _size:int;
		private var _color:uint;
		private var _text:String;
		
		public function Label(font:String = "Trebuchet MS", size:int = 11, color:uint = 0x222222)
		{
			super();
			_text = "";
			_font = font;
			_size = size;
			_color = color;
			
			createTF();
			createFMT();
			
		}
		
		private function createFMT():void
		{
			_fmt = new TextFormat(_font, _size, _color);
			_tf.defaultTextFormat = _fmt;
		}
		
		private function createTF():void
		{
			_tf = new TextField();
			_tf.autoSize = TextFieldAutoSize.LEFT;
			_tf.multiline = false;
			_tf.selectable = false;
			_tf.mouseEnabled = false;
			
			this.addChild(_tf);
		}
		private function reApplyText ():void
		{
			_tf.defaultTextFormat = _fmt;
			_tf.text = _text;
		}
		
		
		
		// -----------------GETTER / SETTER --------------//
		public function get font():String
		{
			return _font;
		}
		
		public function set font(value:String):void
		{
			_font = value;
			_fmt.font = _font;
			reApplyText();
		}
		
		public function get size():int
		{
			return _size;
		}
		
		public function set size(value:int):void
		{
			_size = value;
			_fmt.size = _size;
			reApplyText();
		}
		
		public function get color():uint
		{
			return _color;
		}
		
		public function set color(value:uint):void
		{
			_color = value;
			_fmt.color = _color;
			reApplyText();
		}
		
		public function get text():String
		{
			return _text;
		}
		
		public function set text(value:String):void
		{
			_text = value;
			reApplyText();
		}
		
		
	}
}