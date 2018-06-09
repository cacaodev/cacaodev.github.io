@STATIC;1.0;p;15;AppController.jt;4362;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;4295;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);CPLogRegister(CPLogConsole);

{var the_class = objj_allocateClassPair(CPView, "ConstraintView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("mouseDown:"), function $ConstraintView__mouseDown_(self, _cmd, anEvent)
{
    if ((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "type")) !== CPLeftMouseDown)
        return;
    var flags = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags"));
    if (flags & CPAlternateKeyMask)
    {
        CPLog.debug(self.isa.objj_msgSend0(self, "identifier") + "\n" + ((___r1 = self.isa.objj_msgSend0(self, "constraints")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")));
    }
    if (flags & CPCommandKeyMask)
    {
        CPLog.debug(self.isa.objj_msgSend0(self, "identifier") + " " + CPStringFromRect(self.isa.objj_msgSend0(self, "frame")));
        CPLog.debug(((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "_layoutEngine"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")));
    }
    var ___r1, ___r2;
}

,["void","CPEvent"])]);
}

{var the_class = objj_allocateClassPair(ConstraintView, "ColorView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("color", "CPColor")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("viewDidMoveToSuperview"), function $ColorView__viewDidMoveToSuperview(self, _cmd)
{
    var identifier = self.isa.objj_msgSend0(self, "identifier");
    if (identifier && (identifier == null ? null : identifier.isa.objj_msgSend0(identifier, "length")) > 0)
    {
        var selColor = CPSelectorFromString(identifier);
        if (CPColor.isa.objj_msgSend1(CPColor, "respondsToSelector:", selColor))
            self.color = CPColor.isa.objj_msgSend1(CPColor, "performSelector:", selColor);
    }
    objj_msgSendSuper0({ receiver:self, super_class:objj_getClass("ColorView").super_class }, "viewDidMoveToSuperview");
}

,["void"]), new objj_method(sel_getUid("drawRect:"), function $ColorView__drawRect_(self, _cmd, aRect)
{
    var ctx = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    ((___r1 = self.color), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
    CGContextFillRect(ctx, self.isa.objj_msgSend0(self, "bounds"));
    var ___r1;
}

,["void","CGRect"])]);
}

{var the_class = objj_allocateClassPair(CPPopUpButton, "CPPopUpButtonBaseline"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("baselineOffsetFromBottom"), function $CPPopUpButtonBaseline__baselineOffsetFromBottom(self, _cmd)
{
    return 4.0;
}

,["float"])]);
}

{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("theWindow", "CPWindow"), new objj_ivar("greenView", "ColorView"), new objj_ivar("maskField", "CPTextField")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("addView:"), function $AppController__addView_(self, _cmd, sender)
{
    var view = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMake(10, 10, 100, 100)));
    (view == null ? null : view.isa.objj_msgSend1(view, "setIdentifier:", "autoresizingMaskView"));
    (view == null ? null : view.isa.objj_msgSend1(view, "setBackgroundColor:", CPColor.isa.objj_msgSend0(CPColor, "randomColor")));
    (view == null ? null : view.isa.objj_msgSend1(view, "setAutoresizingMask:", ((___r1 = self.maskField), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "intValue"))));
    ((___r1 = self.greenView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "addSubview:", view));
    var ___r1;
}

,["void","id"]), new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
}

,["void","CPNotification"])]);
}
p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
e;