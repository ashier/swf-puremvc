
/*
 Copyright (c) 2007 Ashier de Leon  <ashier@gmail.com>
 All rights reserved.

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is furnished
 to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
 PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

 @ignore
 */


package com.ashier.deeplinking.view {
	
	import com.ashier.deeplinking.ApplicationFacade;
	import com.ashier.deeplinking.DeepLinking;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import lib.swfaddress.SWFAddress;
	import lib.swfaddress.SWFAddressEvent;
	import org.puremvc.interfaces.IMediator;
	import org.puremvc.interfaces.INotification;
	import org.puremvc.patterns.mediator.Mediator;
	import org.puremvc.patterns.observer.Notification;

	public class ApplicationMediator extends Mediator implements IMediator{
		
		public function ApplicationMediator(viewComponent:Object = null) {
			super(viewComponent);
			createEvents();
		}
		
		private function createEvents():void {
			SWFAddress.addEventListener(SWFAddressEvent.CHANGE, onAddressChange);
			base.btnHome.addEventListener(MouseEvent.CLICK, onHome);
			base.navigation.addEventListener("navigation_click", onNavigationClick);
		}
		
		private function onAddressChange(e:SWFAddressEvent):void {
			removeAllChild(base.holder);
			
			var val:String = "";
			switch("$"+e.value) {
				case ApplicationFacade.HOME:
				case ApplicationFacade.ABOUT:
				case ApplicationFacade.CONTACT:
				case ApplicationFacade.PORTFOLIO:
				case ApplicationFacade.PORTFOLIO_ONE:
				case ApplicationFacade.PORTFOLIO_TWO:
				case ApplicationFacade.PORTFOLIO_THREE:
					val = "$" + e.value;
					base.navigation.setSelectedState(e.value);
				break;
				default :
					base.navigation.setSelectedState("/");
					val = ApplicationFacade.PAGE_ERROR;
				break;
			}
			sendNotification(val, e);
		}
		
		private function removeAllChild(target:MovieClip):void {
			while (target.numChildren > 0) {
				target.removeChildAt(0);
			}
		}
		
		private function onNavigationClick(e:Event):void {
			sendNotification(ApplicationFacade.ADDRESS_CHANGE, base.navigation.deeplink);
		}
		
		private function onHome(e:MouseEvent):void {
			base.navigation.clearNavigationStates();
			sendNotification(ApplicationFacade.ADDRESS_CHANGE, "/");
		}
		
		override public function listNotificationInterests():Array{
			return [
					ApplicationFacade.TITLE_CHANGE,
					ApplicationFacade.ADDRESS_CHANGE
					];
		}
		
		override public function handleNotification(notification:INotification):void{
			super.handleNotification(notification);
			switch(notification.getName()) {
				case ApplicationFacade.TITLE_CHANGE:
					SWFAddress.setTitle(formatTitle(notification.getBody().value as String));
				break;
				case ApplicationFacade.ADDRESS_CHANGE:
					SWFAddress.setValue(notification.getBody() as String);
				break;
			}
		}
		
		private function formatTitle(title:String):String {
			return 'SWFAddress Website' + (title != '/' ? ' / ' + toTitleCase(replace(title.substr(1, title.length - 2), '/', ' / ')) : '');
		}

		private function toTitleCase(str:String):String {
			return str.substr(0,1).toUpperCase() + str.substr(1);
		}

		private function replace(str, find, replace) {
			return str.split(find).join(replace);
		}
		
		private function get base():MovieClip {
			return DeepLinking(app).base;
		}
		
		private function get app():DeepLinking {
			return viewComponent as DeepLinking;
		}
		
	}
	
}
;