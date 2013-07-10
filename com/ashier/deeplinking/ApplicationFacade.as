
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


package com.ashier.deeplinking {
	
	import com.ashier.deeplinking.controller.StartCommand;
	import com.ashier.helloworld.ApplicationFacade;
	import org.puremvc.interfaces.IFacade;
	import org.puremvc.patterns.facade.Facade;

	public class ApplicationFacade extends Facade implements IFacade{
		
		public static const START:String = "start";
		public static const ADDRESS_CHANGE:String = "address_change";
		public static const TITLE_CHANGE:String = "title_change";
		
		/* VIEWS */
		public static const HOME:String = "$/";
		public static const ABOUT:String = "$/about/";
		public static const CONTACT:String = "$/contact/";
		public static const PORTFOLIO:String = "$/portfolio/";
		public static const PORTFOLIO_ONE:String = "$/portfolio/1/";
		public static const PORTFOLIO_TWO:String = "$/portfolio/2/";
		public static const PORTFOLIO_THREE:String = "$/portfolio/3/";
		public static const PAGE_ERROR:String = "page_error";
		
		public static var instance:ApplicationFacade;
		
		public static function getInstance():ApplicationFacade {
			if (instance == null) {
				instance = new ApplicationFacade();
			}
			return instance;
		}
		
		override protected function initializeController():void{
			super.initializeController();
			registerCommand(ApplicationFacade.START, StartCommand);
		}
		
	}
	
}
