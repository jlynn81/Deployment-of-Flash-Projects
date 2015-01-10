package com.flowers
{
	import com.events.DataEvents;
	
	import flash.events.DataEvent;
	import flash.events.MouseEvent;
	import flash.net.dns.AAAARecord;
	
	import libs.SubmitButton;
	import libs.UserBase;
	import libs.Previous;
	import libs.Next;
	
	public class FlowersView1 extends UserBase
	{
		private var _ms:PhotoVO;
		private var _selectedDate:Date;
		
		public function FlowersView1()	
		{
			super();
			
			nameLabel.border = true;
			nameLabel.background = true;
			nameLabel.textColor = 0x0D1330;
			nameLabel.restrict = "A-Z a-z";
			
			var btn:SubmitButton = new SubmitButton();
			addChild(btn);
			btn.x = 250;
			btn.y = 50;
			btn.addEventListener(MouseEvent.CLICK, showResult);
			
			_selectedDate = new Date();
			//d.date--;
			dateLabel.text = _selectedDate.toLocaleDateString();
			
			var p:Previous = new Previous();
			p.x = -10;
			p.y = -18;
			p.addEventListener(MouseEvent.CLICK, prevDay);
			addChild(p);
			
			var n:Next = new Next();
			n.x = 200;
			n.y = -18;
			n.addEventListener(MouseEvent.CLICK, nextDay);
			addChild(n);
			
		}
		
		private function nextDay(event:MouseEvent):void
		{
			_selectedDate.date++;
			dateLabel.text = _selectedDate.toLocaleDateString();
		}
		private function prevDay(event:MouseEvent):void
		{
			_selectedDate.date--;
			dateLabel.text = _selectedDate.toLocaleDateString();
		}
		private function showResult(event:MouseEvent):void
		{
			// Verify that the user has entered a name.
			if(nameLabel.text == ""){
				// Display an error message and then die.
				trace("No Name Entered");
				return;
			}
			//display error message on a seperate stage
			
			// This should dispatch a custom event to notify the "main" that the user has submitted their data.
			// The event should include variables to hold the "date" and "name" entries.
			var evt:DataEvents = new DataEvents(DataEvents.USER_SUBMIT);
			evt.userName = nameLabel.text;
			evt.date = _selectedDate;
			dispatchEvent(evt);
		}
	}
}