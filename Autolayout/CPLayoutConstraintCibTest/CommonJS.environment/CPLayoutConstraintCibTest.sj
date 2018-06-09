@STATIC;1.0;p;15;AppController.jt;2749;@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.jt;2684;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("AppKit/CPView.j", NO);CPLogRegister(CPLogConsole);

{var the_class = objj_allocateClassPair(CPView, "ColorView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("color", "CPColor")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("viewDidMoveToSuperview"), function $ColorView__viewDidMoveToSuperview(self, _cmd)
{
    self.isa.objj_msgSend1(self, "setColor:", CPColor.isa.objj_msgSend0(CPColor, "randomColor"));
}

,["void"]), new objj_method(sel_getUid("setColor:"), function $ColorView__setColor_(self, _cmd, aColor)
{
    self.color = aColor;
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}

,["void","CPColor"]), new objj_method(sel_getUid("drawRect:"), function $ColorView__drawRect_(self, _cmd, aRect)
{
    var ctx = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    ((___r1 = self.color), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
    CGContextFillRect(ctx, self.isa.objj_msgSend0(self, "bounds"));
    var ___r1;
}

,["void","CGRect"]), new objj_method(sel_getUid("mouseDown:"), function $ColorView__mouseDown_(self, _cmd, anEvent)
{
    if ((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "type")) !== CPLeftMouseDown)
        return;
    var flags = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags"));
    if (flags & CPShiftKeyMask)
    {
        CPLog.debug(((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "_layoutEngine"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")));
    }
    var ___r1, ___r2;
}

,["void","CPEvent"])]);
}

{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("theWindow", "CPWindow"), new objj_ivar("middleButton", "CPButton")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("awakeFromCib"), function $AppController__awakeFromCib(self, _cmd)
{
    ((___r1 = self.theWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFullPlatformWindow:", NO));
    var ___r1;
}

,["void"]), new objj_method(sel_getUid("changeText:"), function $AppController__changeText_(self, _cmd, sender)
{
    ((___r1 = self.middleButton), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setTitle:", (sender == null ? null : sender.isa.objj_msgSend0(sender, "stringValue"))));
    var ___r1;
}

,["void","id"])]);
}
p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
e;