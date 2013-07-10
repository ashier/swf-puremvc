
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
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class Navigation extends MovieClip{
		
		public function Navigation() {
			super();
			initializeNavigation();
		}
		
		private function initializeNavigation():void {
			createEvents();
			initializeData();
			hidePortfolioSubNav();
		}
		
		private function createEvents():void {
			btnOne.addEventListener(MouseEvent.CLICK, onClick);
			btnTwo.addEventListener(MouseEvent.CLICK, onClick);
			btnThree.addEventListener(MouseEvent.CLICK, onClick);
			btnAbout.addEventListener(MouseEvent.CLICK, onClick);
			btnPortfolio.addEventListener(MouseEvent.CLICK, onClick);
			btnContact.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function initializeData():void {
			btnAbout.data = "/about/";
			btnPortfolio.data = "/portfolio/";
			btnContact.data = "/contact/";
			btnOne.data = "/portfolio/1/";
			btnTwo.data = "/portfolio/2/";
			btnThree.data = "/portfolio/3/";
		}
		
		private function clearStates():void {
			btnAbout.gotoAndStop(1);
			btnPortfolio.gotoAndStop(1);
			btnContact.gotoAndStop(1);
		}
		
		private function clearSubStates():void {
			btnOne.gotoAndStop(1);
			btnTwo.gotoAndStop(1);
			btnThree.gotoAndStop(1);
		}
		
		public function setSelectedState(d:String):void {
			_deeplink = d;
			switch(_deeplink) {
				case "/":
					clearStates();
					hidePortfolioSubNav();
				break;
				case "/about/":
					clearStates();
					hidePortfolioSubNav();
					btnAbout.gotoAndStop(2);
				break;
				case "/portfolio/":
					clearStates();
					clearSubStates();
					showPortfolioSubNav();
					btnPortfolio.gotoAndStop(2);
				break;
				case "/portfolio/1/":
					clearSubStates();
					showPortfolioSubNav();
					btnPortfolio.gotoAndStop(2);
					btnOne.gotoAndStop(2);
				break;
				case "/portfolio/2/":
					clearSubStates();
					showPortfolioSubNav();
					btnPortfolio.gotoAndStop(2);
					btnTwo.gotoAndStop(2);
				break;
				case "/portfolio/3/":
					clearSubStates();
					showPortfolioSubNav();
					btnPortfolio.gotoAndStop(2);
					btnThree.gotoAndStop(2);
				break;
				case "/contact/":
					clearStates();
					hidePortfolioSubNav();
					btnContact.gotoAndStop(2);
				break;
			}
		}
		
		private function onClick(e:MouseEvent):void {
			setSelectedState(e.target.data);
			dispatchEvent(new Event("navigation_click"));
		}
		
		private var _deeplink:String;
		public function get deeplink():String {
			return _deeplink;
		}
		
		public function clearNavigationStates():void {
			clearStates();
			hidePortfolioSubNav();
		}
		
		private function hidePortfolioSubNav():void {
			btnOne.visible = false;
			btnTwo.visible = false;
			btnThree.visible = false;
			clearSubStates();
		}
		
		private function showPortfolioSubNav():void {
			btnOne.visible = true;
			btnTwo.visible = true;
			btnThree.visible = true;
		}
		
	}
	
}
