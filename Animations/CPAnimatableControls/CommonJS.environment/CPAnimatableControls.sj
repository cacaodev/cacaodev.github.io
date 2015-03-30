@STATIC;1.0;p;15;AppController.jt;6091;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;6024;CPLogRegister(CPLogConsole);
objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("theWindow"), new objj_ivar("segmentedControl"), new objj_ivar("tabView"), new objj_ivar("button")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
    self.isa.objj_msgSend1(self, "insertItem:", 0);
    self.isa.objj_msgSend1(self, "insertItem:", 1);
    self.isa.objj_msgSend1(self, "insertItem:", 2);
    ((___r1 = self.tabView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "selectTabViewItemAtIndex:", 0));
    var ___r1;
}
,["void","CPNotification"]), new objj_method(sel_getUid("awakeFromCib"), function $AppController__awakeFromCib(self, _cmd)
{
    ((___r1 = self.theWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFullPlatformWindow:", YES));
    var ___r1;
}
,["void"]), new objj_method(sel_getUid("insertItem:"), function $AppController__insertItem_(self, _cmd, n)
{
    var item = ((___r1 = CPTabViewItem.isa.objj_msgSend0(CPTabViewItem, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithIdentifier:", "Item" + n));
    (item == null ? null : item.isa.objj_msgSend1(item, "setLabel:", "Item" + n));
    var view = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", ((___r2 = ((___r3 = self.tabView), ___r3 == null ? null : ___r3.isa.objj_msgSend0(___r3, "_box"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "bounds"))));
    (view == null ? null : view.isa.objj_msgSend1(view, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "randomColor")));
    var tvbutton = ((___r1 = CPButton.isa.objj_msgSend0(CPButton, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
    (tvbutton == null ? null : tvbutton.isa.objj_msgSend1(tvbutton, "setTitle:", "Item" + n));
    (tvbutton == null ? null : tvbutton.isa.objj_msgSend0(tvbutton, "sizeToFit"));
    (view == null ? null : view.isa.objj_msgSend1(view, "addSubview:", tvbutton));
    (tvbutton == null ? null : tvbutton.isa.objj_msgSend1(tvbutton, "setFrameOrigin:", CGPointMake(100 + 50 * n, 50)));
    var animIn = CABasicAnimation.isa.objj_msgSend1(CABasicAnimation, "animationWithKeyPath:", "alphaValue");
    (animIn == null ? null : animIn.isa.objj_msgSend1(animIn, "setFromValue:", 0));
    (animIn == null ? null : animIn.isa.objj_msgSend1(animIn, "setToValue:", 1));
    var animOut = CABasicAnimation.isa.objj_msgSend1(CABasicAnimation, "animationWithKeyPath:", "alphaValue");
    (animOut == null ? null : animOut.isa.objj_msgSend1(animOut, "setFromValue:", 1));
    (animOut == null ? null : animOut.isa.objj_msgSend1(animOut, "setToValue:", 0));
    (view == null ? null : view.isa.objj_msgSend1(view, "setAnimations:", objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", animOut, "CPAnimationTriggerOrderOut", animIn, "CPAnimationTriggerOrderIn")));
    (item == null ? null : item.isa.objj_msgSend1(item, "setView:", view));
    ((___r1 = self.tabView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addTabViewItem:", item));
    var ___r1, ___r2, ___r3;
}
,["void","int"]), new objj_method(sel_getUid("selectSegment:"), function $AppController__selectSegment_(self, _cmd, sender)
{
    var segment = (sender == null ? null : sender.isa.objj_msgSend0(sender, "intValue"));
    ((___r1 = (CPAnimationContext == null ? null : CPAnimationContext.isa.objj_msgSend0(CPAnimationContext, "currentContext"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDuration:", 0.3));
    ((___r1 = ((___r2 = self.segmentedControl), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "animator"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setSelectedSegment:", segment));
    var ___r1, ___r2;
}
,["void","id"]), new objj_method(sel_getUid("selectTabViewItemIndex:"), function $AppController__selectTabViewItemIndex_(self, _cmd, sender)
{
    var idx = (sender == null ? null : sender.isa.objj_msgSend0(sender, "intValue"));
    ((___r1 = (CPAnimationContext == null ? null : CPAnimationContext.isa.objj_msgSend0(CPAnimationContext, "currentContext"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDuration:", 2));
    ((___r1 = ((___r2 = self.tabView), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "animator"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "selectTabViewItemAtIndex:", idx));
    var ___r1, ___r2;
}
,["void","id"]), new objj_method(sel_getUid("setButtonTextColor:"), function $AppController__setButtonTextColor_(self, _cmd, sender)
{
    ((___r1 = (CPAnimationContext == null ? null : CPAnimationContext.isa.objj_msgSend0(CPAnimationContext, "currentContext"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDuration:", 1));
    ((___r1 = ((___r2 = self.button), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "animator"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTextColor:", (sender == null ? null : sender.isa.objj_msgSend0(sender, "color"))));
    var ___r1, ___r2;
}
,["void","id"]), new objj_method(sel_getUid("setButtonFont:"), function $AppController__setButtonFont_(self, _cmd, sender)
{
    ((___r1 = (CPAnimationContext == null ? null : CPAnimationContext.isa.objj_msgSend0(CPAnimationContext, "currentContext"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setDuration:", 0.5));
    ((___r1 = ((___r2 = self.button), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "animator"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFontSize:", (sender == null ? null : sender.isa.objj_msgSend0(sender, "floatValue"))));
    var ___r1, ___r2;
}
,["void","id"])]);
}p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
e;