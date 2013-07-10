
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


package com.ashier.deeplinking.view.component {
	
	import com.ashier.deeplinking.model.enum.PortfolioEnum;
	import flash.display.MovieClip;

	public class Portfolio extends MovieClip{
		
		public function Portfolio() {
			super();
			initializePortfolio();
		}
		
		private function initializePortfolio():void {
			try {
				removeAllChild();
				switch(_page) {
					case PortfolioEnum.PAGE_MAIN:
						addChild(new PortfolioMain());
					break;
					case PortfolioEnum.PAGE_ONE:
						addChild(new PortfolioOne());
					break;
					case PortfolioEnum.PAGE_TWO:
						addChild(new PortfolioTwo());
					break;
					case PortfolioEnum.PAGE_THREE:
						addChild(new PortfolioThree());
					break;
				}
			}catch (e:Error) {}
		}
		
		private function removeAllChild():void {
			while (numChildren > 0) {
				removeChildAt(0);
			}
		}
		
		private var _page:String = PortfolioEnum.PAGE_MAIN;
		public function set page(t:String):void {
			_page = t;
			initializePortfolio();
		}
		
		public function get page():String {
			return _page;
		}
		
	}
	
}
