@STATIC;1.0;p;15;AppController.jt;14159;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;14091;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);
{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
    var theWindow = ((___r1 = (CPWindow.isa.method_msgSend["alloc"] || _objj_forward)(CPWindow, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithContentRect:styleMask:"] || _objj_forward)(___r1, "initWithContentRect:styleMask:", CGRectMake(200, 200, 800, 400), CPResizableWindowMask | CPTitledWindowMask)),
        contentView = (theWindow == null ? null : (theWindow.isa.method_msgSend["contentView"] || _objj_forward)(theWindow, "contentView"));
    (contentView == null ? null : (contentView.isa.method_msgSend["setIdentifier:"] || _objj_forward)(contentView, "setIdentifier:", "contentView"));
    (contentView == null ? null : (contentView.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(contentView, "setTranslatesAutoresizingMaskIntoConstraints:", YES));
    var leftView = ((___r1 = (ColorView == null ? null : (ColorView.isa.method_msgSend["alloc"] || _objj_forward)(ColorView, "alloc"))), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMakeZero()));
    (leftView == null ? null : (leftView.isa.method_msgSend["setIdentifier:"] || _objj_forward)(leftView, "setIdentifier:", "leftView"));
    (leftView == null ? null : (leftView.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(leftView, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", leftView));
    var middleView = ((___r1 = (ColorView == null ? null : (ColorView.isa.method_msgSend["alloc"] || _objj_forward)(ColorView, "alloc"))), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMakeZero()));
    (middleView == null ? null : (middleView.isa.method_msgSend["setIdentifier:"] || _objj_forward)(middleView, "setIdentifier:", "middleView"));
    (middleView == null ? null : (middleView.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(middleView, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", middleView));
    var rightView = ((___r1 = (ColorView == null ? null : (ColorView.isa.method_msgSend["alloc"] || _objj_forward)(ColorView, "alloc"))), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMakeZero()));
    (rightView == null ? null : (rightView.isa.method_msgSend["setIdentifier:"] || _objj_forward)(rightView, "setIdentifier:", "rightView"));
    (rightView == null ? null : (rightView.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(rightView, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", rightView));
    var left1 = ((___r1 = (leftView == null ? null : (leftView.isa.method_msgSend["leftAnchor"] || _objj_forward)(leftView, "leftAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (contentView == null ? null : (contentView.isa.method_msgSend["leftAnchor"] || _objj_forward)(contentView, "leftAnchor")), 100)),
        top1 = ((___r1 = (leftView == null ? null : (leftView.isa.method_msgSend["topAnchor"] || _objj_forward)(leftView, "topAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (contentView == null ? null : (contentView.isa.method_msgSend["topAnchor"] || _objj_forward)(contentView, "topAnchor")), 100)),
        width1 = ((___r1 = (leftView == null ? null : (leftView.isa.method_msgSend["widthAnchor"] || _objj_forward)(leftView, "widthAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToConstant:"] || _objj_forward)(___r1, "constraintEqualToConstant:", 200)),
        height1 = ((___r1 = (leftView == null ? null : (leftView.isa.method_msgSend["heightAnchor"] || _objj_forward)(leftView, "heightAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToConstant:"] || _objj_forward)(___r1, "constraintEqualToConstant:", 200));
    var left2 = ((___r1 = (rightView == null ? null : (rightView.isa.method_msgSend["rightAnchor"] || _objj_forward)(rightView, "rightAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (contentView == null ? null : (contentView.isa.method_msgSend["rightAnchor"] || _objj_forward)(contentView, "rightAnchor")), -100)),
        top2 = ((___r1 = (rightView == null ? null : (rightView.isa.method_msgSend["topAnchor"] || _objj_forward)(rightView, "topAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (contentView == null ? null : (contentView.isa.method_msgSend["topAnchor"] || _objj_forward)(contentView, "topAnchor")), 100)),
        width2 = ((___r1 = (rightView == null ? null : (rightView.isa.method_msgSend["widthAnchor"] || _objj_forward)(rightView, "widthAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToConstant:"] || _objj_forward)(___r1, "constraintEqualToConstant:", 200)),
        height2 = ((___r1 = (rightView == null ? null : (rightView.isa.method_msgSend["heightAnchor"] || _objj_forward)(rightView, "heightAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToConstant:"] || _objj_forward)(___r1, "constraintEqualToConstant:", 200));
    var midXAnchor = ((___r1 = (leftView == null ? null : (leftView.isa.method_msgSend["rightAnchor"] || _objj_forward)(leftView, "rightAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["anchorAtMidpointToAnchor:"] || _objj_forward)(___r1, "anchorAtMidpointToAnchor:", (rightView == null ? null : (rightView.isa.method_msgSend["leftAnchor"] || _objj_forward)(rightView, "leftAnchor"))));
    var middleConstraintX = (midXAnchor == null ? null : (midXAnchor.isa.method_msgSend["constraintEqualToAnchor:"] || _objj_forward)(midXAnchor, "constraintEqualToAnchor:", (middleView == null ? null : (middleView.isa.method_msgSend["centerXAnchor"] || _objj_forward)(middleView, "centerXAnchor"))));
    var middleConstraintY = ((___r1 = (leftView == null ? null : (leftView.isa.method_msgSend["centerYAnchor"] || _objj_forward)(leftView, "centerYAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:"] || _objj_forward)(___r1, "constraintEqualToAnchor:", (middleView == null ? null : (middleView.isa.method_msgSend["centerYAnchor"] || _objj_forward)(middleView, "centerYAnchor"))));
    var middleConstraintW = ((___r1 = (middleView == null ? null : (middleView.isa.method_msgSend["widthAnchor"] || _objj_forward)(middleView, "widthAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToConstant:"] || _objj_forward)(___r1, "constraintEqualToConstant:", 200));
    var middleConstraintH = ((___r1 = (middleView == null ? null : (middleView.isa.method_msgSend["heightAnchor"] || _objj_forward)(middleView, "heightAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToConstant:"] || _objj_forward)(___r1, "constraintEqualToConstant:", 200));
    ((___r1 = ((___r2 = (leftView == null ? null : (leftView.isa.method_msgSend["rightAnchor"] || _objj_forward)(leftView, "rightAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintLessThanOrEqualToAnchor:constant:"] || _objj_forward)(___r2, "constraintLessThanOrEqualToAnchor:constant:", (middleView == null ? null : (middleView.isa.method_msgSend["leftAnchor"] || _objj_forward)(middleView, "leftAnchor")), -10))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    ((___r1 = ((___r2 = (middleView == null ? null : (middleView.isa.method_msgSend["rightAnchor"] || _objj_forward)(middleView, "rightAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintLessThanOrEqualToAnchor:constant:"] || _objj_forward)(___r2, "constraintLessThanOrEqualToAnchor:constant:", (rightView == null ? null : (rightView.isa.method_msgSend["leftAnchor"] || _objj_forward)(rightView, "leftAnchor")), -10))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    ((___r1 = ((___r2 = (leftView == null ? null : (leftView.isa.method_msgSend["leftAnchor"] || _objj_forward)(leftView, "leftAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintLessThanOrEqualToAnchor:constant:"] || _objj_forward)(___r2, "constraintLessThanOrEqualToAnchor:constant:", (middleView == null ? null : (middleView.isa.method_msgSend["leftAnchor"] || _objj_forward)(middleView, "leftAnchor")), -10))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    var minLeftWidth = ((___r1 = (leftView == null ? null : (leftView.isa.method_msgSend["widthAnchor"] || _objj_forward)(leftView, "widthAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintGreaterThanOrEqualToConstant:"] || _objj_forward)(___r1, "constraintGreaterThanOrEqualToConstant:", 50));
    var minMiddleWidth = ((___r1 = (middleView == null ? null : (middleView.isa.method_msgSend["widthAnchor"] || _objj_forward)(middleView, "widthAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintGreaterThanOrEqualToConstant:"] || _objj_forward)(___r1, "constraintGreaterThanOrEqualToConstant:", 50));
    var minRightWidth = ((___r1 = (rightView == null ? null : (rightView.isa.method_msgSend["widthAnchor"] || _objj_forward)(rightView, "widthAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintGreaterThanOrEqualToConstant:"] || _objj_forward)(___r1, "constraintGreaterThanOrEqualToConstant:", 50));
    (width1 == null ? null : (width1.isa.method_msgSend["setPriority:"] || _objj_forward)(width1, "setPriority:", 200));
    (width2 == null ? null : (width2.isa.method_msgSend["setPriority:"] || _objj_forward)(width2, "setPriority:", 400));
    (middleConstraintW == null ? null : (middleConstraintW.isa.method_msgSend["setPriority:"] || _objj_forward)(middleConstraintW, "setPriority:", 300));
    (CPLayoutConstraint.isa.method_msgSend["activateConstraints:"] || _objj_forward)(CPLayoutConstraint, "activateConstraints:", (___r1 = (CPArray.isa.method_msgSend["alloc"] || _objj_forward)(CPArray, "alloc"), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithObjects:count:"] || _objj_forward)(___r1, "initWithObjects:count:", [left1, top1, width1, height1, left2, top2, width2, height2], 8)));
    (CPLayoutConstraint.isa.method_msgSend["activateConstraints:"] || _objj_forward)(CPLayoutConstraint, "activateConstraints:", (___r1 = (CPArray.isa.method_msgSend["alloc"] || _objj_forward)(CPArray, "alloc"), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithObjects:count:"] || _objj_forward)(___r1, "initWithObjects:count:", [middleConstraintX, middleConstraintY, middleConstraintW, middleConstraintH], 4)));
    (CPLayoutConstraint.isa.method_msgSend["activateConstraints:"] || _objj_forward)(CPLayoutConstraint, "activateConstraints:", (___r1 = (CPArray.isa.method_msgSend["alloc"] || _objj_forward)(CPArray, "alloc"), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithObjects:count:"] || _objj_forward)(___r1, "initWithObjects:count:", [minLeftWidth, minMiddleWidth, minRightWidth], 3)));
    (theWindow == null ? null : (theWindow.isa.method_msgSend["orderFront:"] || _objj_forward)(theWindow, "orderFront:", self));
    var ___r1, ___r2;
}

,["void","CPNotification"])]);
}

{var the_class = objj_allocateClassPair(CPView, "ColorView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("color", "CPColor")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $ColorView__initWithFrame_(self, _cmd, aRect)
{
    self = (objj_getClass("ColorView").super_class.method_dtable["initWithFrame:"] || _objj_forward)(self, "initWithFrame:", aRect);
    self.color = (CPColor.isa.method_msgSend["randomColor"] || _objj_forward)(CPColor, "randomColor");
    return self;
}

,["id","CGRect"]), new objj_method(sel_getUid("drawRect:"), function $ColorView__drawRect_(self, _cmd, aRect)
{
    var ctx = ((___r1 = (CPGraphicsContext.isa.method_msgSend["currentContext"] || _objj_forward)(CPGraphicsContext, "currentContext")), ___r1 == null ? null : (___r1.isa.method_msgSend["graphicsPort"] || _objj_forward)(___r1, "graphicsPort"));
    ((___r1 = self.color), ___r1 == null ? null : (___r1.isa.method_msgSend["set"] || _objj_forward)(___r1, "set"));
    CGContextFillRect(ctx, (self.isa.method_msgSend["bounds"] || _objj_forward)(self, "bounds"));
    ((___r1 = (CPColor.isa.method_msgSend["blackColor"] || _objj_forward)(CPColor, "blackColor")), ___r1 == null ? null : (___r1.isa.method_msgSend["set"] || _objj_forward)(___r1, "set"));
    var path = (CPBezierPath.isa.method_msgSend["bezierPathWithOvalInRect:"] || _objj_forward)(CPBezierPath, "bezierPathWithOvalInRect:", (self.isa.method_msgSend["bounds"] || _objj_forward)(self, "bounds"));
    (path == null ? null : (path.isa.method_msgSend["stroke"] || _objj_forward)(path, "stroke"));
    var ___r1;
}

,["void","CGRect"])]);
}
p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
e;