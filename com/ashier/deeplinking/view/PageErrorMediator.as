
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
	import org.puremvc.interfaces.IMediator;
	import org.puremvc.interfaces.INotification;
	import org.puremvc.patterns.mediator.Mediator;

	public class PageErrorMediator extends Mediator implements IMediator{
		
		public function PageErrorMediator(viewComponent:Object = null) {
			super(viewComponent);
		}
		
		override public function listNotificationInterests():Array{
			return [
					ApplicationFacade.PAGE_ERROR
					];
		}
		
		override public function handleNotification(notification:INotification):void{
			super.handleNotification(notification);
			switch(notification.getName()) {
				case ApplicationFacade.PAGE_ERROR:
					base.holder.addChild(new Page404());
				break;
			}
			sendNotification(ApplicationFacade.TITLE_CHANGE, notification.getBody());
		}
		
		private function get base():MovieClip {
			return DeepLinking(app).base;
		}
		
		private function get app():DeepLinking {
			return viewComponent as DeepLinking;
		}
		
	}
	
}
