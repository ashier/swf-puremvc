
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


package com.ashier.deeplinking.controller {
	
	import com.ashier.deeplinking.view.AboutMediator;
	import com.ashier.deeplinking.view.ApplicationMediator;
	import com.ashier.deeplinking.view.ContactMediator;
	import com.ashier.deeplinking.view.HomeMediator;
	import com.ashier.deeplinking.view.PageErrorMediator;
	import com.ashier.deeplinking.view.PortfolioMediator;
	import org.puremvc.interfaces.ICommand;
	import org.puremvc.interfaces.INotification;
	import org.puremvc.patterns.command.SimpleCommand;

	public class ViewPrepCommand extends SimpleCommand implements ICommand{
		
		override public function execute(notification:INotification):void{
			super.execute(notification);
			facade.registerMediator(new ApplicationMediator(notification.getBody()));
			facade.registerMediator(new HomeMediator(notification.getBody()));
			facade.registerMediator(new AboutMediator(notification.getBody()));
			facade.registerMediator(new ContactMediator(notification.getBody()));
			facade.registerMediator(new PortfolioMediator(notification.getBody()));
			facade.registerMediator(new PageErrorMediator(notification.getBody()));
		}
		
	}
	
}
