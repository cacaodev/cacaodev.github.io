@STATIC;1.0;p;15;AppController.jt;4111;@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.jt;4046;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("AppKit/CPView.j", NO);CPLogRegister(CPLogConsole);

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
    if (flags & CPCommandKeyMask)
    {
        CPLog.debug(self.isa.objj_msgSend0(self, "identifier") + " " + CPStringFromRect(self.isa.objj_msgSend0(self, "frame")));
        CPLog.debug(((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "_layoutEngine"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "getInfo")));
    }
    if (flags & CPShiftKeyMask)
    {
        CPLog.debug(((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "_layoutEngine"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")));
    }
    var ___r1, ___r2;
}

,["void","CPEvent"])]);
}

{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("compressionWindow", "CPWindow"), new objj_ivar("huggingWindow", "CPWindow"), new objj_ivar("sizeToFitButtonWindow", "CPWindow"), new objj_ivar("sizeToFitLabelWindow", "CPWindow")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("awakeFromCib"), function $AppController__awakeFromCib(self, _cmd)
{
}

,["void"]), new objj_method(sel_getUid("changeButtonTitle:"), function $AppController__changeButtonTitle_(self, _cmd, sender)
{
    var text = (sender == null ? null : sender.isa.objj_msgSend0(sender, "stringValue")),
        button = ((___r1 = ((___r2 = (sender == null ? null : sender.isa.objj_msgSend0(sender, "window"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "viewWithTag:", 1000));
    (button == null ? null : button.isa.objj_msgSend1(button, "setTitle:", text));
    var ___r1, ___r2;
}

,["void","id"]), new objj_method(sel_getUid("changeLabelText:"), function $AppController__changeLabelText_(self, _cmd, sender)
{
    var text = (sender == null ? null : sender.isa.objj_msgSend0(sender, "stringValue")),
        textField = ((___r1 = ((___r2 = (sender == null ? null : sender.isa.objj_msgSend0(sender, "window"))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "viewWithTag:", 1000));
    (textField == null ? null : textField.isa.objj_msgSend1(textField, "setStringValue:", text));
    (textField == null ? null : textField.isa.objj_msgSend0(textField, "invalidateIntrinsicContentSize"));
    var ___r1, ___r2;
}

,["void","id"])]);
}
p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
e;