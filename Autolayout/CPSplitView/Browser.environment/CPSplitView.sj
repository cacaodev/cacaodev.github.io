@STATIC;1.0;p;15;AppController.jt;10803;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;10735;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);CPLogRegister(CPLogConsole);

{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
    var theWindow = ((___r1 = (CPWindow.isa.method_msgSend["alloc"] || _objj_forward)(CPWindow, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithContentRect:styleMask:"] || _objj_forward)(___r1, "initWithContentRect:styleMask:", CGRectMake(100, 100, 1000, 500), CPTitledWindowMask | CPResizableWindowMask)),
        contentView = (theWindow == null ? null : (theWindow.isa.method_msgSend["contentView"] || _objj_forward)(theWindow, "contentView"));
    (contentView == null ? null : (contentView.isa.method_msgSend["setIdentifier:"] || _objj_forward)(contentView, "setIdentifier:", "contentView"));
    (contentView == null ? null : (contentView.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(contentView, "setTranslatesAutoresizingMaskIntoConstraints:", YES));
    var splitView = ((___r1 = (SplitView == null ? null : (SplitView.isa.method_msgSend["alloc"] || _objj_forward)(SplitView, "alloc"))), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(100, 100, 600, 300)));
    (splitView == null ? null : (splitView.isa.method_msgSend["setAutoresizingMask:"] || _objj_forward)(splitView, "setAutoresizingMask:", CPViewWidthSizable));
    (splitView == null ? null : (splitView.isa.method_msgSend["setIdentifier:"] || _objj_forward)(splitView, "setIdentifier:", "SplitView"));
    var view1 = ((___r1 = (ColorView == null ? null : (ColorView.isa.method_msgSend["alloc"] || _objj_forward)(ColorView, "alloc"))), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithColor:"] || _objj_forward)(___r1, "initWithColor:", (CPColor.isa.method_msgSend["redColor"] || _objj_forward)(CPColor, "redColor")));
    (view1 == null ? null : (view1.isa.method_msgSend["setIdentifier:"] || _objj_forward)(view1, "setIdentifier:", "view1"));
    (self.isa.method_msgSend["_addPopUpButtonInView:"] || _objj_forward)(self, "_addPopUpButtonInView:", view1);
    var view2 = ((___r1 = (ColorView == null ? null : (ColorView.isa.method_msgSend["alloc"] || _objj_forward)(ColorView, "alloc"))), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithColor:"] || _objj_forward)(___r1, "initWithColor:", (CPColor.isa.method_msgSend["blueColor"] || _objj_forward)(CPColor, "blueColor")));
    (view2 == null ? null : (view2.isa.method_msgSend["setIdentifier:"] || _objj_forward)(view2, "setIdentifier:", "view2"));
    (self.isa.method_msgSend["_addPopUpButtonInView:"] || _objj_forward)(self, "_addPopUpButtonInView:", view2);
    var view3 = ((___r1 = (ColorView == null ? null : (ColorView.isa.method_msgSend["alloc"] || _objj_forward)(ColorView, "alloc"))), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithColor:"] || _objj_forward)(___r1, "initWithColor:", (CPColor.isa.method_msgSend["brownColor"] || _objj_forward)(CPColor, "brownColor")));
    (view3 == null ? null : (view3.isa.method_msgSend["setIdentifier:"] || _objj_forward)(view3, "setIdentifier:", "view3"));
    (self.isa.method_msgSend["_addPopUpButtonInView:"] || _objj_forward)(self, "_addPopUpButtonInView:", view3);
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", splitView));
    (splitView == null ? null : (splitView.isa.method_msgSend["addSubview:"] || _objj_forward)(splitView, "addSubview:", view1));
    (splitView == null ? null : (splitView.isa.method_msgSend["addSubview:"] || _objj_forward)(splitView, "addSubview:", view2));
    (splitView == null ? null : (splitView.isa.method_msgSend["addSubview:"] || _objj_forward)(splitView, "addSubview:", view3));
    (theWindow == null ? null : (theWindow.isa.method_msgSend["orderFront:"] || _objj_forward)(theWindow, "orderFront:", self));
    var ___r1;
}

,["void","CPNotification"]), new objj_method(sel_getUid("_addPopUpButtonInView:"), function $AppController___addPopUpButtonInView_(self, _cmd, aView)
{
    var popup = ((___r1 = (CPPopUpButton.isa.method_msgSend["alloc"] || _objj_forward)(CPPopUpButton, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMakeZero()));
    (popup == null ? null : (popup.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(popup, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    (popup == null ? null : (popup.isa.method_msgSend["addItemsWithTitles:"] || _objj_forward)(popup, "addItemsWithTitles:", (___r1 = (CPArray.isa.method_msgSend["alloc"] || _objj_forward)(CPArray, "alloc"), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithObjects:count:"] || _objj_forward)(___r1, "initWithObjects:count:", ["Intrinsic 1000", "Intrinsic 750", "Intrinsic 500", "Intrinsic 250"], 4))));
    (popup == null ? null : (popup.isa.method_msgSend["selectItemAtIndex:"] || _objj_forward)(popup, "selectItemAtIndex:", 1));
    (popup == null ? null : (popup.isa.method_msgSend["setTarget:"] || _objj_forward)(popup, "setTarget:", self));
    (popup == null ? null : (popup.isa.method_msgSend["setAction:"] || _objj_forward)(popup, "setAction:", sel_getUid("setAntiCompressionPriority:")));
    var centerX = ((___r1 = (popup == null ? null : (popup.isa.method_msgSend["centerXAnchor"] || _objj_forward)(popup, "centerXAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:"] || _objj_forward)(___r1, "constraintEqualToAnchor:", (aView == null ? null : (aView.isa.method_msgSend["centerXAnchor"] || _objj_forward)(aView, "centerXAnchor"))));
    var centerY = ((___r1 = (popup == null ? null : (popup.isa.method_msgSend["centerYAnchor"] || _objj_forward)(popup, "centerYAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:"] || _objj_forward)(___r1, "constraintEqualToAnchor:", (aView == null ? null : (aView.isa.method_msgSend["centerYAnchor"] || _objj_forward)(aView, "centerYAnchor"))));
    var minLeft = ((___r1 = (popup == null ? null : (popup.isa.method_msgSend["leadingAnchor"] || _objj_forward)(popup, "leadingAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintGreaterThanOrEqualToAnchor:"] || _objj_forward)(___r1, "constraintGreaterThanOrEqualToAnchor:", (aView == null ? null : (aView.isa.method_msgSend["leadingAnchor"] || _objj_forward)(aView, "leadingAnchor"))));
    var minRight = ((___r1 = (popup == null ? null : (popup.isa.method_msgSend["trailingAnchor"] || _objj_forward)(popup, "trailingAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintLessThanOrEqualToAnchor:"] || _objj_forward)(___r1, "constraintLessThanOrEqualToAnchor:", (aView == null ? null : (aView.isa.method_msgSend["trailingAnchor"] || _objj_forward)(aView, "trailingAnchor"))));
    (aView == null ? null : (aView.isa.method_msgSend["addSubview:"] || _objj_forward)(aView, "addSubview:", popup));
    (CPLayoutConstraint.isa.method_msgSend["activateConstraints:"] || _objj_forward)(CPLayoutConstraint, "activateConstraints:", (___r1 = (CPArray.isa.method_msgSend["alloc"] || _objj_forward)(CPArray, "alloc"), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithObjects:count:"] || _objj_forward)(___r1, "initWithObjects:count:", [centerX, centerY, minLeft, minRight], 4)));
    var ___r1;
}

,["void","CPView"]), new objj_method(sel_getUid("setAntiCompressionPriority:"), function $AppController__setAntiCompressionPriority_(self, _cmd, sender)
{
    var p = 1000 - (sender == null ? null : (sender.isa.method_msgSend["indexOfSelectedItem"] || _objj_forward)(sender, "indexOfSelectedItem")) * 250;
    (sender == null ? null : (sender.isa.method_msgSend["setContentCompressionResistancePriority:forOrientation:"] || _objj_forward)(sender, "setContentCompressionResistancePriority:forOrientation:", p, 0));
}

,["void","id"])]);
}

{var the_class = objj_allocateClassPair(CPView, "ColorView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("color", "CPColor")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("color"), function $ColorView__color(self, _cmd)
{
    return self.color;
}

,["CPColor"]), new objj_method(sel_getUid("setColor:"), function $ColorView__setColor_(self, _cmd, newValue)
{
    self.color = newValue;
}

,["void","CPColor"]), new objj_method(sel_getUid("initWithColor:"), function $ColorView__initWithColor_(self, _cmd, aColor)
{
    self = (objj_getClass("ColorView").super_class.method_dtable["initWithFrame:"] || _objj_forward)(self, "initWithFrame:", CGRectMakeZero());
    (self == null ? null : (self.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(self, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    self.color = aColor;
    return self;
}

,["id","CPColor"]), new objj_method(sel_getUid("drawRect:"), function $ColorView__drawRect_(self, _cmd, aRect)
{
    var ctx = ((___r1 = (CPGraphicsContext.isa.method_msgSend["currentContext"] || _objj_forward)(CPGraphicsContext, "currentContext")), ___r1 == null ? null : (___r1.isa.method_msgSend["graphicsPort"] || _objj_forward)(___r1, "graphicsPort"));
    ((___r1 = self.color), ___r1 == null ? null : (___r1.isa.method_msgSend["setFill"] || _objj_forward)(___r1, "setFill"));
    CGContextFillRect(ctx, CGRectInsetByInset((self.isa.method_msgSend["bounds"] || _objj_forward)(self, "bounds"), CGInsetMake(2, 2, 2, 2)));
    var ___r1;
}

,["void","CGRect"])]);
}

{var the_class = objj_allocateClassPair(CPSplitView, "SplitView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("drawRect:"), function $SplitView__drawRect_(self, _cmd, aRect)
{
    var ctx = ((___r1 = (CPGraphicsContext.isa.method_msgSend["currentContext"] || _objj_forward)(CPGraphicsContext, "currentContext")), ___r1 == null ? null : (___r1.isa.method_msgSend["graphicsPort"] || _objj_forward)(___r1, "graphicsPort"));
    ((___r1 = (CPColor.isa.method_msgSend["blackColor"] || _objj_forward)(CPColor, "blackColor")), ___r1 == null ? null : (___r1.isa.method_msgSend["setStroke"] || _objj_forward)(___r1, "setStroke"));
    CGContextSetLineWidth(ctx, 2);
    CGContextStrokeRect(ctx, (self.isa.method_msgSend["bounds"] || _objj_forward)(self, "bounds"));
    var ___r1;
}

,["void","CGRect"])]);
}
p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
e;