@STATIC;1.0;p;15;AppController.jt;7148;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;7081;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);
{var the_class = objj_allocateClassPair(CPStackView, "StackView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("drawRect:"), function $StackView__drawRect_(self, _cmd, aRect)
{
    (objj_getClass("StackView").super_class.method_dtable["drawRect:"] || _objj_forward)(self, "drawRect:", aRect);
    var ctx = ((___r1 = (CPGraphicsContext.isa.method_msgSend["currentContext"] || _objj_forward)(CPGraphicsContext, "currentContext")), ___r1 == null ? null : (___r1.isa.method_msgSend["graphicsPort"] || _objj_forward)(___r1, "graphicsPort"));
    ((___r1 = (CPColor.isa.method_msgSend["blackColor"] || _objj_forward)(CPColor, "blackColor")), ___r1 == null ? null : (___r1.isa.method_msgSend["set"] || _objj_forward)(___r1, "set"));
    CGContextSetLineWidth(ctx, 3);
    CGContextStrokeRect(ctx, (self.isa.method_msgSend["bounds"] || _objj_forward)(self, "bounds"));
    var ___r1;
}

,["void","CGRect"]), new objj_method(sel_getUid("mouseDown:"), function $StackView__mouseDown_(self, _cmd, anEvent)
{
    CPLog.debug("StackView\n" + ((___r1 = (self.isa.method_msgSend["constraints"] || _objj_forward)(self, "constraints")), ___r1 == null ? null : (___r1.isa.method_msgSend["description"] || _objj_forward)(___r1, "description")));
    CPLog.debug("WindowView\n" + ((___r1 = ((___r2 = ((___r3 = (self.isa.method_msgSend["window"] || _objj_forward)(self, "window")), ___r3 == null ? null : (___r3.isa.method_msgSend["_windowView"] || _objj_forward)(___r3, "_windowView"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraints"] || _objj_forward)(___r2, "constraints"))), ___r1 == null ? null : (___r1.isa.method_msgSend["description"] || _objj_forward)(___r1, "description")));
    CPLog.debug("ContentView\n" + ((___r1 = ((___r2 = ((___r3 = (self.isa.method_msgSend["window"] || _objj_forward)(self, "window")), ___r3 == null ? null : (___r3.isa.method_msgSend["contentView"] || _objj_forward)(___r3, "contentView"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraints"] || _objj_forward)(___r2, "constraints"))), ___r1 == null ? null : (___r1.isa.method_msgSend["description"] || _objj_forward)(___r1, "description")));
    ((___r1 = (self.isa.method_msgSend["views"] || _objj_forward)(self, "views")), ___r1 == null ? null : (___r1.isa.method_msgSend["enumerateObjectsUsingBlock:"] || _objj_forward)(___r1, "enumerateObjectsUsingBlock:",     function(aView, idx, stop)
    {
        CPLog.debug((aView == null ? null : (aView.isa.method_msgSend["identifier"] || _objj_forward)(aView, "identifier")) + "\n" + ((___r1 = (aView == null ? null : (aView.isa.method_msgSend["constraints"] || _objj_forward)(aView, "constraints"))), ___r1 == null ? null : (___r1.isa.method_msgSend["description"] || _objj_forward)(___r1, "description")));
        var ___r1;
    }));
    var ___r1, ___r2, ___r3;
}

,["void","CPEvent"])]);
}

{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("theWindow", "CPWindow"), new objj_ivar("stackView", "StackView"), new objj_ivar("stackBellow", "StackView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
}

,["void","CPNotification"]), new objj_method(sel_getUid("awakeFromCib"), function $AppController__awakeFromCib(self, _cmd)
{
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["setFullPlatformWindow:"] || _objj_forward)(___r1, "setFullPlatformWindow:", NO));
    var ___r1;
}

,["void"]), new objj_method(sel_getUid("setDistribution:"), function $AppController__setDistribution_(self, _cmd, sender)
{
    var dist = (sender == null ? null : (sender.isa.method_msgSend["selectedSegment"] || _objj_forward)(sender, "selectedSegment"));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setDistribution:"] || _objj_forward)(___r1, "setDistribution:", dist));
    ((___r1 = self.stackBellow), ___r1 == null ? null : (___r1.isa.method_msgSend["setDistribution:"] || _objj_forward)(___r1, "setDistribution:", dist));
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(___r1, "setNeedsDisplay:", YES));
    ((___r1 = self.stackBellow), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(___r1, "setNeedsDisplay:", YES));
    var ___r1;
}

,["void","id"]), new objj_method(sel_getUid("setContentHuggingPriority:"), function $AppController__setContentHuggingPriority_(self, _cmd, sender)
{
    var view = ((___r1 = ((___r2 = self.stackView), ___r2 == null ? null : (___r2.isa.method_msgSend["views"] || _objj_forward)(___r2, "views"))), ___r1 == null ? null : (___r1.isa.method_msgSend["objectAtIndex:"] || _objj_forward)(___r1, "objectAtIndex:", (sender == null ? null : (sender.isa.method_msgSend["tag"] || _objj_forward)(sender, "tag")))),
        value = (sender == null ? null : (sender.isa.method_msgSend["intValue"] || _objj_forward)(sender, "intValue"));
    (view == null ? null : (view.isa.method_msgSend["setContentHuggingPriority:forOrientation:"] || _objj_forward)(view, "setContentHuggingPriority:forOrientation:", value, ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["orientation"] || _objj_forward)(___r1, "orientation"))));
    (view == null ? null : (view.isa.method_msgSend["invalidateIntrinsicContentSize"] || _objj_forward)(view, "invalidateIntrinsicContentSize"));
    var ___r1, ___r2;
}

,["void","id"]), new objj_method(sel_getUid("setContentCompressionResistancePriority:"), function $AppController__setContentCompressionResistancePriority_(self, _cmd, sender)
{
    var view = ((___r1 = ((___r2 = self.stackView), ___r2 == null ? null : (___r2.isa.method_msgSend["views"] || _objj_forward)(___r2, "views"))), ___r1 == null ? null : (___r1.isa.method_msgSend["objectAtIndex:"] || _objj_forward)(___r1, "objectAtIndex:", (sender == null ? null : (sender.isa.method_msgSend["tag"] || _objj_forward)(sender, "tag")))),
        value = (sender == null ? null : (sender.isa.method_msgSend["intValue"] || _objj_forward)(sender, "intValue"));
    (view == null ? null : (view.isa.method_msgSend["setContentCompressionResistancePriority:forOrientation:"] || _objj_forward)(view, "setContentCompressionResistancePriority:forOrientation:", value, ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["orientation"] || _objj_forward)(___r1, "orientation"))));
    (view == null ? null : (view.isa.method_msgSend["invalidateIntrinsicContentSize"] || _objj_forward)(view, "invalidateIntrinsicContentSize"));
    var ___r1, ___r2;
}

,["void","id"])]);
}
p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
e;