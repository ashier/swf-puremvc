
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

    import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import org.puremvc.patterns.observer.Notification;

    public class DeepLinking extends MovieClip {
				
        public function DeepLinking():void {
			super();
			initialize();
        }
			
		private var facade:ApplicationFacade = ApplicationFacade.getInstance();
        private function initialize():void {
			facade.notifyObservers(new Notification(ApplicationFacade.START, this));
			createEvents();
			initializeStage();
        }
		
		private function createEvents():void {
			stage.addEventListener(Event.RESIZE, onResize);
		}
		
		private function initializeStage():void {
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			onResize(new Event(Event.RESIZE));
		}
		
		private function onResize(e:Event):void {
			base.x = (stage.stageWidth / 2) - (base.width / 2);
			base.bg.height = stage.stageHeight;
		}
		
    }
}