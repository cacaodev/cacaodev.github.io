@STATIC;1.0;p;15;AppController.jt;42479;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;16;CPMouseTracker.jt;42390;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("CPMouseTracker.j", YES);var EDIT_PRIORITY = 1000;

{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("pNum", "CPInteger")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
    var constraints = (___r1 = (CPArray.isa.method_msgSend["alloc"] || _objj_forward)(CPArray, "alloc"), ___r1 == null ? null : (___r1.isa.method_msgSend["init"] || _objj_forward)(___r1, "init"));
    self.pNum = 0;
    var theWindow = ((___r1 = (CPWindow.isa.method_msgSend["alloc"] || _objj_forward)(CPWindow, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithContentRect:styleMask:"] || _objj_forward)(___r1, "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessBridgeWindowMask)),
        contentView = (theWindow == null ? null : (theWindow.isa.method_msgSend["contentView"] || _objj_forward)(theWindow, "contentView"));
    (contentView == null ? null : (contentView.isa.method_msgSend["setIdentifier:"] || _objj_forward)(contentView, "setIdentifier:", "contentView"));
    (contentView == null ? null : (contentView.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(contentView, "setTranslatesAutoresizingMaskIntoConstraints:", YES));
    var container = ((___r1 = (ColorView == null ? null : (ColorView.isa.method_msgSend["alloc"] || _objj_forward)(ColorView, "alloc"))), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMakeZero()));
    (container == null ? null : (container.isa.method_msgSend["setIdentifier:"] || _objj_forward)(container, "setIdentifier:", "container"));
    (container == null ? null : (container.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(container, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", container));
    var tf = ((___r1 = (CPTextField.isa.method_msgSend["alloc"] || _objj_forward)(CPTextField, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(50, 10, 1200, 50)));
    (tf == null ? null : (tf.isa.method_msgSend["setFont:"] || _objj_forward)(tf, "setFont:", (CPFont.isa.method_msgSend["boldSystemFontOfSize:"] || _objj_forward)(CPFont, "boldSystemFontOfSize:", 32)));
    (tf == null ? null : (tf.isa.method_msgSend["setStringValue:"] || _objj_forward)(tf, "setStringValue:", "cmd-click on a point to edit the priority of its constrained coordinates."));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", tf));
    var left = ((___r1 = (container == null ? null : (container.isa.method_msgSend["leftAnchor"] || _objj_forward)(container, "leftAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (contentView == null ? null : (contentView.isa.method_msgSend["leftAnchor"] || _objj_forward)(contentView, "leftAnchor")), 50)),
        top = ((___r1 = (container == null ? null : (container.isa.method_msgSend["topAnchor"] || _objj_forward)(container, "topAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (contentView == null ? null : (contentView.isa.method_msgSend["topAnchor"] || _objj_forward)(contentView, "topAnchor")), 100)),
        right = ((___r1 = (container == null ? null : (container.isa.method_msgSend["rightAnchor"] || _objj_forward)(container, "rightAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (contentView == null ? null : (contentView.isa.method_msgSend["rightAnchor"] || _objj_forward)(contentView, "rightAnchor")), -50)),
        bottom = ((___r1 = (container == null ? null : (container.isa.method_msgSend["bottomAnchor"] || _objj_forward)(container, "bottomAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (contentView == null ? null : (contentView.isa.method_msgSend["bottomAnchor"] || _objj_forward)(contentView, "bottomAnchor")), -50));
    (CPLayoutConstraint.isa.method_msgSend["activateConstraints:"] || _objj_forward)(CPLayoutConstraint, "activateConstraints:", (___r1 = (CPArray.isa.method_msgSend["alloc"] || _objj_forward)(CPArray, "alloc"), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithObjects:count:"] || _objj_forward)(___r1, "initWithObjects:count:", [left, top, right, bottom], 4)));
    var p1 = (self.isa.method_msgSend["installLayoutPointAtLocation:inView:priority:"] || _objj_forward)(self, "installLayoutPointAtLocation:inView:priority:", CGPointMake(100, 100), container, 900);
    var p2 = (self.isa.method_msgSend["installLayoutPointAtLocation:inView:priority:"] || _objj_forward)(self, "installLayoutPointAtLocation:inView:priority:", CGPointMake(1100, 100), container, 910);
    var p3 = (self.isa.method_msgSend["installLayoutPointAtLocation:inView:priority:"] || _objj_forward)(self, "installLayoutPointAtLocation:inView:priority:", CGPointMake(1100, 500), container, 920);
    var p4 = (self.isa.method_msgSend["installLayoutPointAtLocation:inView:priority:"] || _objj_forward)(self, "installLayoutPointAtLocation:inView:priority:", CGPointMake(100, 500), container, 930);
    var p5 = (self.isa.method_msgSend["installLayoutPointAtLocation:inView:priority:"] || _objj_forward)(self, "installLayoutPointAtLocation:inView:priority:", CGPointMake(600, 100), container, 500);
    var p6 = (self.isa.method_msgSend["installLayoutPointAtLocation:inView:priority:"] || _objj_forward)(self, "installLayoutPointAtLocation:inView:priority:", CGPointMake(1100, 300), container, 500);
    var p7 = (self.isa.method_msgSend["installLayoutPointAtLocation:inView:priority:"] || _objj_forward)(self, "installLayoutPointAtLocation:inView:priority:", CGPointMake(600, 500), container, 500);
    var p8 = (self.isa.method_msgSend["installLayoutPointAtLocation:inView:priority:"] || _objj_forward)(self, "installLayoutPointAtLocation:inView:priority:", CGPointMake(100, 300), container, 500);
    var midConstraints1 = (p5 == null ? null : (p5.isa.method_msgSend["constraintsBetweenPoint:andPoint:"] || _objj_forward)(p5, "constraintsBetweenPoint:andPoint:", p1, p2));
    var midConstraints2 = (p6 == null ? null : (p6.isa.method_msgSend["constraintsBetweenPoint:andPoint:"] || _objj_forward)(p6, "constraintsBetweenPoint:andPoint:", p2, p3));
    var midConstraints3 = (p7 == null ? null : (p7.isa.method_msgSend["constraintsBetweenPoint:andPoint:"] || _objj_forward)(p7, "constraintsBetweenPoint:andPoint:", p3, p4));
    var midConstraints4 = (p8 == null ? null : (p8.isa.method_msgSend["constraintsBetweenPoint:andPoint:"] || _objj_forward)(p8, "constraintsBetweenPoint:andPoint:", p4, p1));
    (constraints == null ? null : (constraints.isa.method_msgSend["addObjectsFromArray:"] || _objj_forward)(constraints, "addObjectsFromArray:", midConstraints1));
    (constraints == null ? null : (constraints.isa.method_msgSend["addObjectsFromArray:"] || _objj_forward)(constraints, "addObjectsFromArray:", midConstraints2));
    (constraints == null ? null : (constraints.isa.method_msgSend["addObjectsFromArray:"] || _objj_forward)(constraints, "addObjectsFromArray:", midConstraints3));
    (constraints == null ? null : (constraints.isa.method_msgSend["addObjectsFromArray:"] || _objj_forward)(constraints, "addObjectsFromArray:", midConstraints4));
    (CPLayoutConstraint.isa.method_msgSend["activateConstraints:"] || _objj_forward)(CPLayoutConstraint, "activateConstraints:", constraints);
    (theWindow == null ? null : (theWindow.isa.method_msgSend["orderFront:"] || _objj_forward)(theWindow, "orderFront:", self));
    var ___r1;
}

,["void","CPNotification"]), new objj_method(sel_getUid("installLayoutPointAtLocation:inView:priority:"), function $AppController__installLayoutPointAtLocation_inView_priority_(self, _cmd, loc, aView, priority)
{
    var layoutPoint = (aView == null ? null : (aView.isa.method_msgSend["createLayoutPointAtLocation:withPriority:"] || _objj_forward)(aView, "createLayoutPointAtLocation:withPriority:", loc, priority));
    (CPLayoutConstraint.isa.method_msgSend["activateConstraints:"] || _objj_forward)(CPLayoutConstraint, "activateConstraints:", (layoutPoint == null ? null : (layoutPoint.isa.method_msgSend["constraints"] || _objj_forward)(layoutPoint, "constraints")));
    return layoutPoint;
}

,["id","CPPoint","CPView","CPInteger"])]);
}
{
var the_class = objj_getClass("CPLayoutPoint")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPLayoutPoint\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("constraintsBetweenPoint:andPoint:"), function $CPLayoutPoint__constraintsBetweenPoint_andPoint_(self, _cmd, p1, p2)
{
    var midAnchorX = ((___r1 = (p1 == null ? null : (p1.isa.method_msgSend["xAxisAnchor"] || _objj_forward)(p1, "xAxisAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["anchorAtMidpointToAnchor:"] || _objj_forward)(___r1, "anchorAtMidpointToAnchor:", (p2 == null ? null : (p2.isa.method_msgSend["xAxisAnchor"] || _objj_forward)(p2, "xAxisAnchor"))));
    var midAnchorY = ((___r1 = (p1 == null ? null : (p1.isa.method_msgSend["yAxisAnchor"] || _objj_forward)(p1, "yAxisAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["anchorAtMidpointToAnchor:"] || _objj_forward)(___r1, "anchorAtMidpointToAnchor:", (p2 == null ? null : (p2.isa.method_msgSend["yAxisAnchor"] || _objj_forward)(p2, "yAxisAnchor"))));
    var cstX = ((___r1 = (self.isa.method_msgSend["xAxisAnchor"] || _objj_forward)(self, "xAxisAnchor")), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:"] || _objj_forward)(___r1, "constraintEqualToAnchor:", midAnchorX));
    var cstY = ((___r1 = (self.isa.method_msgSend["yAxisAnchor"] || _objj_forward)(self, "yAxisAnchor")), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:"] || _objj_forward)(___r1, "constraintEqualToAnchor:", midAnchorY));
    return (___r1 = (CPArray.isa.method_msgSend["alloc"] || _objj_forward)(CPArray, "alloc"), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithObjects:count:"] || _objj_forward)(___r1, "initWithObjects:count:", [cstX, cstY], 2));
    var ___r1;
}

,["CPArray","id","id"]), new objj_method(sel_getUid("constraintsContainingWithinView:"), function $CPLayoutPoint__constraintsContainingWithinView_(self, _cmd, aView)
{
    var cst1 = ((___r1 = (self.isa.method_msgSend["xAxisAnchor"] || _objj_forward)(self, "xAxisAnchor")), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintGreaterThanOrEqualToConstant:"] || _objj_forward)(___r1, "constraintGreaterThanOrEqualToConstant:", 0));
    var cst2 = ((___r1 = (self.isa.method_msgSend["yAxisAnchor"] || _objj_forward)(self, "yAxisAnchor")), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintGreaterThanOrEqualToConstant:"] || _objj_forward)(___r1, "constraintGreaterThanOrEqualToConstant:", 0));
    var cst3 = ((___r1 = (self.isa.method_msgSend["xAxisAnchor"] || _objj_forward)(self, "xAxisAnchor")), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintLessThanOrEqualToAnchor:"] || _objj_forward)(___r1, "constraintLessThanOrEqualToAnchor:", (aView == null ? null : (aView.isa.method_msgSend["rightAnchor"] || _objj_forward)(aView, "rightAnchor"))));
    var cst4 = ((___r1 = (self.isa.method_msgSend["yAxisAnchor"] || _objj_forward)(self, "yAxisAnchor")), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintLessThanOrEqualToAnchor:"] || _objj_forward)(___r1, "constraintLessThanOrEqualToAnchor:", (aView == null ? null : (aView.isa.method_msgSend["bottomAnchor"] || _objj_forward)(aView, "bottomAnchor"))));
    return (___r1 = (CPArray.isa.method_msgSend["alloc"] || _objj_forward)(CPArray, "alloc"), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithObjects:count:"] || _objj_forward)(___r1, "initWithObjects:count:", [cst1, cst2], 2));
    var ___r1;
}

,["CPArray","CPView"])]);
}
var pNum;

{var the_class = objj_allocateClassPair(CPLayoutPoint, "LayoutPoint"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("xConstraint", "CPArray"), new objj_ivar("yConstraint", "CPArray"), new objj_ivar("initialPriority", "CPInteger")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initialPriority"), function $LayoutPoint__initialPriority(self, _cmd)
{
    return self.initialPriority;
}

,["CPInteger"]), new objj_method(sel_getUid("setInitialPriority:"), function $LayoutPoint__setInitialPriority_(self, _cmd, newValue)
{
    self.initialPriority = newValue;
}

,["void","CPInteger"]), new objj_method(sel_getUid("initAtLocation:priority:owner:"), function $LayoutPoint__initAtLocation_priority_owner_(self, _cmd, aLocation, aPriority, owner)
{
    var idx = pNum++;
    var anchorX = (CPLayoutXAxisAnchor.isa.method_msgSend["anchorNamed:inItem:"] || _objj_forward)(CPLayoutXAxisAnchor, "anchorNamed:inItem:", "x" + idx, owner);
    var anchorY = (CPLayoutYAxisAnchor.isa.method_msgSend["anchorNamed:inItem:"] || _objj_forward)(CPLayoutYAxisAnchor, "anchorNamed:inItem:", "y" + idx, owner);
    self = (objj_getClass("LayoutPoint").super_class.method_dtable["initWithXAxisAnchor:yAxisAnchor:"] || _objj_forward)(self, "initWithXAxisAnchor:yAxisAnchor:", anchorX, anchorY);
    self.xConstraint = (anchorX == null ? null : (anchorX.isa.method_msgSend["constraintEqualToConstant:"] || _objj_forward)(anchorX, "constraintEqualToConstant:", aLocation.x));
    self.yConstraint = (anchorY == null ? null : (anchorY.isa.method_msgSend["constraintEqualToConstant:"] || _objj_forward)(anchorY, "constraintEqualToConstant:", aLocation.y));
    ((___r1 = self.xConstraint), ___r1 == null ? null : (___r1.isa.method_msgSend["setPriority:"] || _objj_forward)(___r1, "setPriority:", aPriority));
    ((___r1 = self.yConstraint), ___r1 == null ? null : (___r1.isa.method_msgSend["setPriority:"] || _objj_forward)(___r1, "setPriority:", aPriority));
    self.initialPriority = aPriority;
    return self;
    var ___r1;
}

,["id","CGPoint","CPInteger","id"]), new objj_method(sel_getUid("setInitialPriority:"), function $LayoutPoint__setInitialPriority_(self, _cmd, p)
{
    if (self.initialPriority !== p)
    {
        self.initialPriority = p;
        (self.isa.method_msgSend["setPriority:"] || _objj_forward)(self, "setPriority:", p);
    }
}

,["void","CPInteger"]), new objj_method(sel_getUid("location"), function $LayoutPoint__location(self, _cmd)
{
    return (self.isa.method_msgSend["valueInEngine:"] || _objj_forward)(self, "valueInEngine:", nil);
}

,["CGPoint"]), new objj_method(sel_getUid("constraints"), function $LayoutPoint__constraints(self, _cmd)
{
    return (___r1 = (CPArray.isa.method_msgSend["alloc"] || _objj_forward)(CPArray, "alloc"), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithObjects:count:"] || _objj_forward)(___r1, "initWithObjects:count:", [self.xConstraint, self.yConstraint], 2));
    var ___r1;
}

,["CPArray"]), new objj_method(sel_getUid("resetStayConstraints"), function $LayoutPoint__resetStayConstraints(self, _cmd)
{
    var location = (self.isa.method_msgSend["location"] || _objj_forward)(self, "location");
    ((___r1 = self.xConstraint), ___r1 == null ? null : (___r1.isa.method_msgSend["setConstant:"] || _objj_forward)(___r1, "setConstant:", location.x));
    ((___r1 = self.yConstraint), ___r1 == null ? null : (___r1.isa.method_msgSend["setConstant:"] || _objj_forward)(___r1, "setConstant:", location.y));
    var ___r1;
}

,["void"]), new objj_method(sel_getUid("suggestLocation:"), function $LayoutPoint__suggestLocation_(self, _cmd, aLocation)
{
    ((___r1 = self.xConstraint), ___r1 == null ? null : (___r1.isa.method_msgSend["setConstant:"] || _objj_forward)(___r1, "setConstant:", aLocation.x));
    ((___r1 = self.yConstraint), ___r1 == null ? null : (___r1.isa.method_msgSend["setConstant:"] || _objj_forward)(___r1, "setConstant:", aLocation.y));
    var ___r1;
}

,["void","CGPoint"]), new objj_method(sel_getUid("moveByOffset:"), function $LayoutPoint__moveByOffset_(self, _cmd, anOffset)
{
    ((___r1 = self.xConstraint), ___r1 == null ? null : (___r1.isa.method_msgSend["setConstant:"] || _objj_forward)(___r1, "setConstant:", ((___r2 = self.xConstraint), ___r2 == null ? null : (___r2.isa.method_msgSend["constant"] || _objj_forward)(___r2, "constant")) + anOffset.x));
    ((___r1 = self.yConstraint), ___r1 == null ? null : (___r1.isa.method_msgSend["setConstant:"] || _objj_forward)(___r1, "setConstant:", ((___r2 = self.yConstraint), ___r2 == null ? null : (___r2.isa.method_msgSend["constant"] || _objj_forward)(___r2, "constant")) + anOffset.y));
    var ___r1, ___r2;
}

,["void","CGPoint"]), new objj_method(sel_getUid("resetPriority"), function $LayoutPoint__resetPriority(self, _cmd)
{
    ((___r1 = self.xConstraint), ___r1 == null ? null : (___r1.isa.method_msgSend["setPriority:"] || _objj_forward)(___r1, "setPriority:", self.initialPriority));
    ((___r1 = self.yConstraint), ___r1 == null ? null : (___r1.isa.method_msgSend["setPriority:"] || _objj_forward)(___r1, "setPriority:", self.initialPriority));
    var ___r1;
}

,["void"]), new objj_method(sel_getUid("setPriority:"), function $LayoutPoint__setPriority_(self, _cmd, aPriority)
{
    ((___r1 = self.xConstraint), ___r1 == null ? null : (___r1.isa.method_msgSend["setPriority:"] || _objj_forward)(___r1, "setPriority:", aPriority));
    ((___r1 = self.yConstraint), ___r1 == null ? null : (___r1.isa.method_msgSend["setPriority:"] || _objj_forward)(___r1, "setPriority:", aPriority));
    var ___r1;
}

,["void","CPInteger"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $LayoutPoint__initialize(self, _cmd)
{
    pNum = 0;
}

,["void"])]);
}

{var the_class = objj_allocateClassPair(CPView, "ColorView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("fillColor", "CPColor"), new objj_ivar("layoutPoints", "CPArray"), new objj_ivar("mouseTracker", "CPMouseTracker"), new objj_ivar("trackingPoint", "CPLayoutPoint"), new objj_ivar("currentLocation", "CGPoint"), new objj_ivar("popover", "CPPopover")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $ColorView__initWithFrame_(self, _cmd, aFrame)
{
    self = (objj_getClass("ColorView").super_class.method_dtable["initWithFrame:"] || _objj_forward)(self, "initWithFrame:", aFrame);
    self.fillColor = (CPColor.isa.method_msgSend["randomColor"] || _objj_forward)(CPColor, "randomColor");
    self.mouseTracker = ((___r1 = (CPMouseTracker.isa.method_msgSend["alloc"] || _objj_forward)(CPMouseTracker, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["init"] || _objj_forward)(___r1, "init"));
    self.layoutPoints = (CPArray.isa.method_msgSend["array"] || _objj_forward)(CPArray, "array");
    self.currentLocation = CGPointMakeZero();
    self.trackingPoint = nil;
    self.popover = nil;
    return self;
    var ___r1;
}

,["id","CGRect"]), new objj_method(sel_getUid("createLayoutPointAtLocation:withPriority:"), function $ColorView__createLayoutPointAtLocation_withPriority_(self, _cmd, aLocation, priority)
{
    var point = ((___r1 = (LayoutPoint.isa.method_msgSend["alloc"] || _objj_forward)(LayoutPoint, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initAtLocation:priority:owner:"] || _objj_forward)(___r1, "initAtLocation:priority:owner:", aLocation, priority, self));
    ((___r1 = self.layoutPoints), ___r1 == null ? null : (___r1.isa.method_msgSend["addObject:"] || _objj_forward)(___r1, "addObject:", point));
    return point;
    var ___r1;
}

,["LayoutPoint","CGPoint","CPInteger"]), new objj_method(sel_getUid("drawString:inRect:"), function $ColorView__drawString_inRect_(self, _cmd, aString, aRect)
{
    var ctx = ((___r1 = (CPGraphicsContext.isa.method_msgSend["currentContext"] || _objj_forward)(CPGraphicsContext, "currentContext")), ___r1 == null ? null : (___r1.isa.method_msgSend["graphicsPort"] || _objj_forward)(___r1, "graphicsPort"));
    ctx.font = ((___r1 = (CPFont.isa.method_msgSend["boldSystemFontOfSize:"] || _objj_forward)(CPFont, "boldSystemFontOfSize:", 20)), ___r1 == null ? null : (___r1.isa.method_msgSend["cssString"] || _objj_forward)(___r1, "cssString"));
    var metrics = ctx.measureText(aString);
    ctx.fillText(aString, CGRectGetMinX(aRect) + (CGRectGetWidth(aRect) - metrics.width) / 2, CGRectGetMaxY(aRect) - (CGRectGetHeight(aRect) - 10) / 2);
    var ___r1;
}

,["void","CPString","CGRect"]), new objj_method(sel_getUid("drawRect:"), function $ColorView__drawRect_(self, _cmd, aRect)
{
    var ctx = ((___r1 = (CPGraphicsContext.isa.method_msgSend["currentContext"] || _objj_forward)(CPGraphicsContext, "currentContext")), ___r1 == null ? null : (___r1.isa.method_msgSend["graphicsPort"] || _objj_forward)(___r1, "graphicsPort"));
    ((___r1 = self.fillColor), ___r1 == null ? null : (___r1.isa.method_msgSend["set"] || _objj_forward)(___r1, "set"));
    CGContextFillRect(ctx, (self.isa.method_msgSend["bounds"] || _objj_forward)(self, "bounds"));
    var normal = (CPColor.isa.method_msgSend["blackColor"] || _objj_forward)(CPColor, "blackColor"),
        selected = (CPColor.isa.method_msgSend["blueColor"] || _objj_forward)(CPColor, "blueColor");
    (normal == null ? null : (normal.isa.method_msgSend["setStroke"] || _objj_forward)(normal, "setStroke"));
    var path = (CPBezierPath.isa.method_msgSend["bezierPath"] || _objj_forward)(CPBezierPath, "bezierPath");
    var rectanglePath = (CPBezierPath.isa.method_msgSend["bezierPath"] || _objj_forward)(CPBezierPath, "bezierPath");
    (path == null ? null : (path.isa.method_msgSend["setLineWidth:"] || _objj_forward)(path, "setLineWidth:", 3));
    ((___r1 = self.layoutPoints), ___r1 == null ? null : (___r1.isa.method_msgSend["enumerateObjectsUsingBlock:"] || _objj_forward)(___r1, "enumerateObjectsUsingBlock:",     function(point, idx, stop)
    {
        var p = (point == null ? null : (point.isa.method_msgSend["location"] || _objj_forward)(point, "location"));
        if (idx == 0)
        {
            (path == null ? null : (path.isa.method_msgSend["moveToPoint:"] || _objj_forward)(path, "moveToPoint:", p));
        }        else if (idx == 4)
        {
            (rectanglePath == null ? null : (rectanglePath.isa.method_msgSend["moveToPoint:"] || _objj_forward)(rectanglePath, "moveToPoint:", p));
        }        else if (idx < 4)
        {
            (path == null ? null : (path.isa.method_msgSend["lineToPoint:"] || _objj_forward)(path, "lineToPoint:", p));
        }        else
        {
            (rectanglePath == null ? null : (rectanglePath.isa.method_msgSend["lineToPoint:"] || _objj_forward)(rectanglePath, "lineToPoint:", p));
        }        if (idx == 3)
        {
            (path == null ? null : (path.isa.method_msgSend["closePath"] || _objj_forward)(path, "closePath"));
        }        else if (idx == 7)
        {
            (rectanglePath == null ? null : (rectanglePath.isa.method_msgSend["closePath"] || _objj_forward)(rectanglePath, "closePath"));
        }    }));
    (path == null ? null : (path.isa.method_msgSend["stroke"] || _objj_forward)(path, "stroke"));
    (rectanglePath == null ? null : (rectanglePath.isa.method_msgSend["stroke"] || _objj_forward)(rectanglePath, "stroke"));
    ((___r1 = (CPColor.isa.method_msgSend["colorWithWhite:alpha:"] || _objj_forward)(CPColor, "colorWithWhite:alpha:", 0.5, 0.2)), ___r1 == null ? null : (___r1.isa.method_msgSend["set"] || _objj_forward)(___r1, "set"));
    (rectanglePath == null ? null : (rectanglePath.isa.method_msgSend["fill"] || _objj_forward)(rectanglePath, "fill"));
    ((___r1 = self.layoutPoints), ___r1 == null ? null : (___r1.isa.method_msgSend["enumerateObjectsUsingBlock:"] || _objj_forward)(___r1, "enumerateObjectsUsingBlock:",     function(point, idx, stop)
    {
        var isSelected = point == self.trackingPoint;
        var color = isSelected ? selected : normal;
        (color == null ? null : (color.isa.method_msgSend["setFill"] || _objj_forward)(color, "setFill"));
        var p = (point == null ? null : (point.isa.method_msgSend["location"] || _objj_forward)(point, "location"));
        var rect = CGRectMake(p.x - 25, p.y - 25, 50, 50);
        ((___r1 = (CPBezierPath.isa.method_msgSend["bezierPathWithOvalInRect:"] || _objj_forward)(CPBezierPath, "bezierPathWithOvalInRect:", rect)), ___r1 == null ? null : (___r1.isa.method_msgSend["fill"] || _objj_forward)(___r1, "fill"));
        var priority = isSelected ? EDIT_PRIORITY : (point == null ? null : (point.isa.method_msgSend["initialPriority"] || _objj_forward)(point, "initialPriority"));
        ((___r1 = (CPColor.isa.method_msgSend["whiteColor"] || _objj_forward)(CPColor, "whiteColor")), ___r1 == null ? null : (___r1.isa.method_msgSend["setFill"] || _objj_forward)(___r1, "setFill"));
        (self.isa.method_msgSend["drawString:inRect:"] || _objj_forward)(self, "drawString:inRect:", ROUND(priority), rect);
        var ___r1;
    }));
    var ___r1;
}

,["void","CGRect"]), new objj_method(sel_getUid("popover"), function $ColorView__popover(self, _cmd)
{
    if (self.popover == nil)
    {
        self.popover = ((___r1 = (CPPopover.isa.method_msgSend["alloc"] || _objj_forward)(CPPopover, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["init"] || _objj_forward)(___r1, "init"));
        ((___r1 = self.popover), ___r1 == null ? null : (___r1.isa.method_msgSend["setBehavior:"] || _objj_forward)(___r1, "setBehavior:", CPPopoverBehaviorTransient));
        ((___r1 = self.popover), ___r1 == null ? null : (___r1.isa.method_msgSend["setDelegate:"] || _objj_forward)(___r1, "setDelegate:", self));
        var vc = ((___r1 = (ContentViewController == null ? null : (ContentViewController.isa.method_msgSend["alloc"] || _objj_forward)(ContentViewController, "alloc"))), ___r1 == null ? null : (___r1.isa.method_msgSend["init"] || _objj_forward)(___r1, "init"));
        (vc == null ? null : (vc.isa.method_msgSend["setTarget:"] || _objj_forward)(vc, "setTarget:", self));
        ((___r1 = self.popover), ___r1 == null ? null : (___r1.isa.method_msgSend["setContentViewController:"] || _objj_forward)(___r1, "setContentViewController:", vc));
    }
    return self.popover;
    var ___r1;
}

,["CPPopover"]), new objj_method(sel_getUid("closePopover:"), function $ColorView__closePopover_(self, _cmd, sender)
{
    ((___r1 = self.popover), ___r1 == null ? null : (___r1.isa.method_msgSend["close"] || _objj_forward)(___r1, "close"));
    var ___r1;
}

,["void","id"]), new objj_method(sel_getUid("popoverDidClose:"), function $ColorView__popoverDidClose_(self, _cmd, aPopover)
{
    var controller = ((___r1 = self.popover), ___r1 == null ? null : (___r1.isa.method_msgSend["contentViewController"] || _objj_forward)(___r1, "contentViewController")),
        currentLayoutPoint = (controller == null ? null : (controller.isa.method_msgSend["layoutPoint"] || _objj_forward)(controller, "layoutPoint")),
        priority = (controller == null ? null : (controller.isa.method_msgSend["priority"] || _objj_forward)(controller, "priority"));
    (currentLayoutPoint == null ? null : (currentLayoutPoint.isa.method_msgSend["setInitialPriority:"] || _objj_forward)(currentLayoutPoint, "setInitialPriority:", priority));
    (controller == null ? null : (controller.isa.method_msgSend["setLayoutPoint:"] || _objj_forward)(controller, "setLayoutPoint:", nil));
    (self.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(self, "setNeedsDisplay:", YES);
    var ___r1;
}

,["void","CPPopover"]), new objj_method(sel_getUid("popoverWillShow:"), function $ColorView__popoverWillShow_(self, _cmd, aPopover)
{
    var controller = (aPopover == null ? null : (aPopover.isa.method_msgSend["contentViewController"] || _objj_forward)(aPopover, "contentViewController")),
        currentLayoutPoint = (controller == null ? null : (controller.isa.method_msgSend["layoutPoint"] || _objj_forward)(controller, "layoutPoint")),
        priority = (currentLayoutPoint == null ? null : (currentLayoutPoint.isa.method_msgSend["initialPriority"] || _objj_forward)(currentLayoutPoint, "initialPriority"));
    (controller == null ? null : (controller.isa.method_msgSend["setPriority:"] || _objj_forward)(controller, "setPriority:", priority));
}

,["void","CPPopover"]), new objj_method(sel_getUid("mouseDown:"), function $ColorView__mouseDown_(self, _cmd, theEvent)
{
    if ((theEvent == null ? null : (theEvent.isa.method_msgSend["type"] || _objj_forward)(theEvent, "type")) !== CPLeftMouseDown)
        return;
    if ((theEvent == null ? null : (theEvent.isa.method_msgSend["modifierFlags"] || _objj_forward)(theEvent, "modifierFlags")) & CPCommandKeyMask)
    {
        var clickedPoint = (self.isa.method_msgSend["layoutPointAtLocation:"] || _objj_forward)(self, "layoutPointAtLocation:", (self.isa.method_msgSend["convertPointFromBase:"] || _objj_forward)(self, "convertPointFromBase:", (theEvent == null ? null : (theEvent.isa.method_msgSend["locationInWindow"] || _objj_forward)(theEvent, "locationInWindow"))));
        if (clickedPoint)
        {
            ((___r1 = ((___r2 = (self.isa.method_msgSend["popover"] || _objj_forward)(self, "popover")), ___r2 == null ? null : (___r2.isa.method_msgSend["contentViewController"] || _objj_forward)(___r2, "contentViewController"))), ___r1 == null ? null : (___r1.isa.method_msgSend["setLayoutPoint:"] || _objj_forward)(___r1, "setLayoutPoint:", clickedPoint));
            var p = (clickedPoint == null ? null : (clickedPoint.isa.method_msgSend["location"] || _objj_forward)(clickedPoint, "location"));
            ((___r1 = (self.isa.method_msgSend["popover"] || _objj_forward)(self, "popover")), ___r1 == null ? null : (___r1.isa.method_msgSend["showRelativeToRect:ofView:preferredEdge:"] || _objj_forward)(___r1, "showRelativeToRect:ofView:preferredEdge:", CGRectMake(p.x - 25, p.y - 25, 50, 50), self, 1));
        }
    }
    else
    {
        ((___r1 = self.mouseTracker), ___r1 == null ? null : (___r1.isa.method_msgSend["trackWithEvent:inView:withDelegate:"] || _objj_forward)(___r1, "trackWithEvent:inView:withDelegate:", theEvent, self, self));
    }
    var ___r1, ___r2;
}

,["void","CPEvent"]), new objj_method(sel_getUid("mouseTracker:shouldStartTrackingWithEvent:"), function $ColorView__mouseTracker_shouldStartTrackingWithEvent_(self, _cmd, tracker, anEvent)
{
    var locationInWindow = (anEvent == null ? null : (anEvent.isa.method_msgSend["locationInWindow"] || _objj_forward)(anEvent, "locationInWindow"));
    self.trackingPoint = (self.isa.method_msgSend["layoutPointAtLocation:"] || _objj_forward)(self, "layoutPointAtLocation:", (self.isa.method_msgSend["convertPointFromBase:"] || _objj_forward)(self, "convertPointFromBase:", locationInWindow));
    if (self.trackingPoint == nil)
        return NO;
    ((___r1 = self.trackingPoint), ___r1 == null ? null : (___r1.isa.method_msgSend["setPriority:"] || _objj_forward)(___r1, "setPriority:", CPLayoutPriorityRequired));
    self.currentLocation = locationInWindow;
    return YES;
    var ___r1;
}

,["BOOL","CPMouseTracker","CPEvent"]), new objj_method(sel_getUid("mouseTracker:shouldContinueTrackingWithEvent:"), function $ColorView__mouseTracker_shouldContinueTrackingWithEvent_(self, _cmd, tracker, anEvent)
{
    if (self.trackingPoint == nil)
        return NO;
    var locationInWindow = (anEvent == null ? null : (anEvent.isa.method_msgSend["locationInWindow"] || _objj_forward)(anEvent, "locationInWindow")),
        moveOffset = CGPointMake(locationInWindow.x - self.currentLocation.x, locationInWindow.y - self.currentLocation.y);
    ((___r1 = self.trackingPoint), ___r1 == null ? null : (___r1.isa.method_msgSend["moveByOffset:"] || _objj_forward)(___r1, "moveByOffset:", moveOffset));
    self.currentLocation = locationInWindow;
    ((___r1 = (self.isa.method_msgSend["window"] || _objj_forward)(self, "window")), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
    (self.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(self, "setNeedsDisplay:", YES);
    return YES;
    var ___r1;
}

,["BOOL","CPMouseTracker","CPEvent"]), new objj_method(sel_getUid("mouseTracker:didStopTrackingWithEvent:"), function $ColorView__mouseTracker_didStopTrackingWithEvent_(self, _cmd, tracker, anEvent)
{
    ((___r1 = self.layoutPoints), ___r1 == null ? null : (___r1.isa.method_msgSend["enumerateObjectsUsingBlock:"] || _objj_forward)(___r1, "enumerateObjectsUsingBlock:",     function(point, idx, stop)
    {
        (point == null ? null : (point.isa.method_msgSend["resetStayConstraints"] || _objj_forward)(point, "resetStayConstraints"));
    }));
    if (self.trackingPoint)
    {
        ((___r1 = self.trackingPoint), ___r1 == null ? null : (___r1.isa.method_msgSend["resetPriority"] || _objj_forward)(___r1, "resetPriority"));
        self.trackingPoint = nil;
    }
    ((___r1 = (self.isa.method_msgSend["window"] || _objj_forward)(self, "window")), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
    (self.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(self, "setNeedsDisplay:", YES);
    self.currentLocation = CGPointMakeZero();
    var ___r1;
}

,["void","CPMouseTracker","CPEvent"]), new objj_method(sel_getUid("layoutPointAtLocation:"), function $ColorView__layoutPointAtLocation_(self, _cmd, localEventPoint)
{
    var idx = ((___r1 = self.layoutPoints), ___r1 == null ? null : (___r1.isa.method_msgSend["indexOfObjectPassingTest:"] || _objj_forward)(___r1, "indexOfObjectPassingTest:",     function(point, idx, stop)
    {
        var location = (point == null ? null : (point.isa.method_msgSend["location"] || _objj_forward)(point, "location")),
            grabrect = CGRectMake(location.x - 25, location.y - 25, 50, 50);
        return CGRectContainsPoint(grabrect, localEventPoint);
    }));
    return idx !== CPNotFound ? ((___r1 = self.layoutPoints), ___r1 == null ? null : (___r1.isa.method_msgSend["objectAtIndex:"] || _objj_forward)(___r1, "objectAtIndex:", idx)) : nil;
    var ___r1;
}

,["CPLayoutPoint","CGPoint"])]);
}

{var the_class = objj_allocateClassPair(CPViewController, "ContentViewController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("layoutPoint", "CPLayoutPoint"), new objj_ivar("priority", "CPInteger"), new objj_ivar("target", "id")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("layoutPoint"), function $ContentViewController__layoutPoint(self, _cmd)
{
    return self.layoutPoint;
}

,["CPLayoutPoint"]), new objj_method(sel_getUid("setLayoutPoint:"), function $ContentViewController__setLayoutPoint_(self, _cmd, newValue)
{
    self.layoutPoint = newValue;
}

,["void","CPLayoutPoint"]), new objj_method(sel_getUid("priority"), function $ContentViewController__priority(self, _cmd)
{
    return self.priority;
}

,["CPInteger"]), new objj_method(sel_getUid("setPriority:"), function $ContentViewController__setPriority_(self, _cmd, newValue)
{
    self.priority = newValue;
}

,["void","CPInteger"]), new objj_method(sel_getUid("target"), function $ContentViewController__target(self, _cmd)
{
    return self.target;
}

,["id"]), new objj_method(sel_getUid("setTarget:"), function $ContentViewController__setTarget_(self, _cmd, newValue)
{
    self.target = newValue;
}

,["void","id"]), new objj_method(sel_getUid("initWithCibName:owner:"), function $ContentViewController__initWithCibName_owner_(self, _cmd, aName, anOwner)
{
    self = (objj_getClass("ContentViewController").super_class.method_dtable["initWithCibName:owner:"] || _objj_forward)(self, "initWithCibName:owner:", aName, anOwner);
    self.priority = 0;
    return self;
}

,["id","id","id"]), new objj_method(sel_getUid("setPriority:"), function $ContentViewController__setPriority_(self, _cmd, p)
{
    if (self.priority !== p)
    {
        self.priority = p;
        CPLog.debug(_cmd + self.priority);
    }
}

,["void","CPInteger"]), new objj_method(sel_getUid("viewDidLoad"), function $ContentViewController__viewDidLoad(self, _cmd)
{
    CPLog.debug(_cmd);
    ((___r1 = (self.isa.method_msgSend["view"] || _objj_forward)(self, "view")), ___r1 == null ? null : (___r1.isa.method_msgSend["setFrame:"] || _objj_forward)(___r1, "setFrame:", CGRectMake(0, 0, 290, 42)));
    var slider = ((___r1 = (CPSlider.isa.method_msgSend["alloc"] || _objj_forward)(CPSlider, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(10, 10, 150, 22)));
    (slider == null ? null : (slider.isa.method_msgSend["setIdentifier:"] || _objj_forward)(slider, "setIdentifier:", "Slider"));
    (slider == null ? null : (slider.isa.method_msgSend["setContinuous:"] || _objj_forward)(slider, "setContinuous:", YES));
    (slider == null ? null : (slider.isa.method_msgSend["setMaxValue:"] || _objj_forward)(slider, "setMaxValue:", 1000));
    ((___r1 = (self.isa.method_msgSend["view"] || _objj_forward)(self, "view")), ___r1 == null ? null : (___r1.isa.method_msgSend["addSubview:"] || _objj_forward)(___r1, "addSubview:", slider));
    ((___r1 = (self.isa.method_msgSend["view"] || _objj_forward)(self, "view")), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
    var textField = ((___r1 = (CPTextField.isa.method_msgSend["alloc"] || _objj_forward)(CPTextField, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(170, 10, 50, 22)));
    (textField == null ? null : (textField.isa.method_msgSend["setIdentifier:"] || _objj_forward)(textField, "setIdentifier:", "TextField"));
    (textField == null ? null : (textField.isa.method_msgSend["setFont:"] || _objj_forward)(textField, "setFont:", (CPFont.isa.method_msgSend["boldSystemFontOfSize:"] || _objj_forward)(CPFont, "boldSystemFontOfSize:", 20)));
    ((___r1 = (self.isa.method_msgSend["view"] || _objj_forward)(self, "view")), ___r1 == null ? null : (___r1.isa.method_msgSend["addSubview:"] || _objj_forward)(___r1, "addSubview:", textField));
    var oc = ((___r1 = (CPObjectController.isa.method_msgSend["alloc"] || _objj_forward)(CPObjectController, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["init"] || _objj_forward)(___r1, "init"));
    (oc == null ? null : (oc.isa.method_msgSend["bind:toObject:withKeyPath:options:"] || _objj_forward)(oc, "bind:toObject:withKeyPath:options:", CPContentBinding, self, "self", nil));
    (textField == null ? null : (textField.isa.method_msgSend["bind:toObject:withKeyPath:options:"] || _objj_forward)(textField, "bind:toObject:withKeyPath:options:", CPValueBinding, oc, "selection.priority", (___r1 = (CPDictionary.isa.method_msgSend["alloc"] || _objj_forward)(CPDictionary, "alloc"), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithObjects:forKeys:"] || _objj_forward)(___r1, "initWithObjects:forKeys:", ["FloatToInt"], [CPValueTransformerNameBindingOption]))));
    (slider == null ? null : (slider.isa.method_msgSend["bind:toObject:withKeyPath:options:"] || _objj_forward)(slider, "bind:toObject:withKeyPath:options:", CPValueBinding, oc, "selection.priority", nil));
    var ok = ((___r1 = (CPButton.isa.method_msgSend["alloc"] || _objj_forward)(CPButton, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(230, 7, 50, 28)));
    (ok == null ? null : (ok.isa.method_msgSend["setIdentifier:"] || _objj_forward)(ok, "setIdentifier:", "OKButton"));
    (ok == null ? null : (ok.isa.method_msgSend["setTitle:"] || _objj_forward)(ok, "setTitle:", "OK"));
    (ok == null ? null : (ok.isa.method_msgSend["setTarget:"] || _objj_forward)(ok, "setTarget:", self.target));
    (ok == null ? null : (ok.isa.method_msgSend["setAction:"] || _objj_forward)(ok, "setAction:", sel_getUid("closePopover:")));
    ((___r1 = (self.isa.method_msgSend["view"] || _objj_forward)(self, "view")), ___r1 == null ? null : (___r1.isa.method_msgSend["addSubview:"] || _objj_forward)(___r1, "addSubview:", ok));
    var ___r1;
}

,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $ContentViewController__initialize(self, _cmd)
{
    var transformer = ((___r1 = (CPFloatToIntegerTransformer == null ? null : (CPFloatToIntegerTransformer.isa.method_msgSend["alloc"] || _objj_forward)(CPFloatToIntegerTransformer, "alloc"))), ___r1 == null ? null : (___r1.isa.method_msgSend["init"] || _objj_forward)(___r1, "init"));
    (CPValueTransformer.isa.method_msgSend["setValueTransformer:forName:"] || _objj_forward)(CPValueTransformer, "setValueTransformer:forName:", transformer, "FloatToInt");
    var ___r1;
}

,["void"])]);
}

{var the_class = objj_allocateClassPair(CPValueTransformer, "CPFloatToIntegerTransformer"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("transformedValue:"), function $CPFloatToIntegerTransformer__transformedValue_(self, _cmd, aValue)
{
    return ROUND(aValue);
}

,["id","id"]), new objj_method(sel_getUid("reverseTransformedValue:"), function $CPFloatToIntegerTransformer__reverseTransformedValue_(self, _cmd, aValue)
{
    return aValue;
}

,["id","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("allowsReverseTransformation"), function $CPFloatToIntegerTransformer__allowsReverseTransformation(self, _cmd)
{
    return YES;
}

,["BOOL"])]);
}
p;16;CPMouseTracker.jt;12526;@STATIC;1.0;t;12506;var startTracking = 1 << 1,
    continueTracking = 1 << 2,
    stopTracking = 1 << 3,
    constrainPoint = 1 << 4,
    handlePeriodicEvents = 1 << 5;

{var the_class = objj_allocateClassPair(CPObject, "CPMouseTracker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_initialPoint", "CGPoint"), new objj_ivar("_previousPoint", "CGPoint"), new objj_ivar("_currentPoint", "CGPoint"), new objj_ivar("_initialEvent", "CPEvent"), new objj_ivar("_previousEvent", "CPEvent"), new objj_ivar("_currentEvent", "CPEvent"), new objj_ivar("_view", "CPView"), new objj_ivar("_delegate", "id"), new objj_ivar("_delay", "double"), new objj_ivar("_interval", "double"), new objj_ivar("_eventMask", "int"), new objj_ivar("_trackingConstraint", "unsigned int"), new objj_ivar("_trackingConstraintKeyMask", "unsigned int"), new objj_ivar("_delegateRespondTo", "int")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initialPoint"), function $CPMouseTracker__initialPoint(self, _cmd)
{
    return self._initialPoint;
}

,["CGPoint"]), new objj_method(sel_getUid("_setInitialPoint:"), function $CPMouseTracker___setInitialPoint_(self, _cmd, newValue)
{
    self._initialPoint = newValue;
}

,["void","CGPoint"]), new objj_method(sel_getUid("currentPoint"), function $CPMouseTracker__currentPoint(self, _cmd)
{
    return self._currentPoint;
}

,["CGPoint"]), new objj_method(sel_getUid("_setCurrentPoint:"), function $CPMouseTracker___setCurrentPoint_(self, _cmd, newValue)
{
    self._currentPoint = newValue;
}

,["void","CGPoint"]), new objj_method(sel_getUid("view"), function $CPMouseTracker__view(self, _cmd)
{
    return self._view;
}

,["CPView"]), new objj_method(sel_getUid("_setView:"), function $CPMouseTracker___setView_(self, _cmd, newValue)
{
    self._view = newValue;
}

,["void","CPView"]), new objj_method(sel_getUid("delegate"), function $CPMouseTracker__delegate(self, _cmd)
{
    return self._delegate;
}

,["id"]), new objj_method(sel_getUid("_setDelegate:"), function $CPMouseTracker___setDelegate_(self, _cmd, newValue)
{
    self._delegate = newValue;
}

,["void","id"]), new objj_method(sel_getUid("delay"), function $CPMouseTracker__delay(self, _cmd)
{
    return self._delay;
}

,["double"]), new objj_method(sel_getUid("_setDelay:"), function $CPMouseTracker___setDelay_(self, _cmd, newValue)
{
    self._delay = newValue;
}

,["void","double"]), new objj_method(sel_getUid("interval"), function $CPMouseTracker__interval(self, _cmd)
{
    return self._interval;
}

,["double"]), new objj_method(sel_getUid("_setInterval:"), function $CPMouseTracker___setInterval_(self, _cmd, newValue)
{
    self._interval = newValue;
}

,["void","double"]), new objj_method(sel_getUid("eventMask"), function $CPMouseTracker__eventMask(self, _cmd)
{
    return self._eventMask;
}

,["int"]), new objj_method(sel_getUid("setEventMask:"), function $CPMouseTracker__setEventMask_(self, _cmd, newValue)
{
    self._eventMask = newValue;
}

,["void","int"]), new objj_method(sel_getUid("trackingConstraint"), function $CPMouseTracker__trackingConstraint(self, _cmd)
{
    return self._trackingConstraint;
}

,["unsigned int"]), new objj_method(sel_getUid("setTrackingConstraint:"), function $CPMouseTracker__setTrackingConstraint_(self, _cmd, newValue)
{
    self._trackingConstraint = newValue;
}

,["void","unsigned int"]), new objj_method(sel_getUid("trackingConstraintKeyMask"), function $CPMouseTracker__trackingConstraintKeyMask(self, _cmd)
{
    return self._trackingConstraintKeyMask;
}

,["unsigned int"]), new objj_method(sel_getUid("setTrackingConstraintKeyMask:"), function $CPMouseTracker__setTrackingConstraintKeyMask_(self, _cmd, newValue)
{
    self._trackingConstraintKeyMask = newValue;
}

,["void","unsigned int"]), new objj_method(sel_getUid("init"), function $CPMouseTracker__init(self, _cmd)
{
    self = (objj_getClass("CPMouseTracker").super_class.method_dtable["init"] || _objj_forward)(self, "init");
    self._delay = 0.2;
    self._interval = 0.025;
    self._initialEvent = nil;
    self._previousEvent = nil;
    self._currentEvent = nil;
    self._initialPoint = CGPointMakeZero();
    self._previousPoint = CGPointMakeZero();
    self._currentPoint = CGPointMakeZero();
    self._delegateRespondTo = 0;
    self._trackingConstraint = 0;
    self._trackingConstraintKeyMask = 0;
    self._eventMask = CPLeftMouseDraggedMask | CPLeftMouseUpMask;
    self._delegate = nil;
    self._view = nil;
    return self;
}

,["id"]), new objj_method(sel_getUid("setPeriodicDelay:interval:"), function $CPMouseTracker__setPeriodicDelay_interval_(self, _cmd, aDelay, anInterval)
{
    self._delay = aDelay;
    self._interval = anInterval;
}

,["void","double","double"]), new objj_method(sel_getUid("_getLocalPoint:"), function $CPMouseTracker___getLocalPoint_(self, _cmd, anEvent)
{
    var locationInWindow = (anEvent == null ? null : (anEvent.isa.method_msgSend["locationInWindow"] || _objj_forward)(anEvent, "locationInWindow"));
    var point = ((___r1 = self._view), ___r1 == null ? null : (___r1.isa.method_msgSend["convertPoint:fromView:"] || _objj_forward)(___r1, "convertPoint:fromView:", locationInWindow, nil));
    return point;
    var ___r1;
}

,["CGPoint","CPEvent"]), new objj_method(sel_getUid("trackWithEvent:inView:withDelegate:"), function $CPMouseTracker__trackWithEvent_inView_withDelegate_(self, _cmd, anEvent, aView, aDelegate)
{
    if ((self.isa.method_msgSend["startTrackingWithEvent:inView:withDelegate:"] || _objj_forward)(self, "startTrackingWithEvent:inView:withDelegate:", anEvent, aView, aDelegate))
    {
        var ret = (self.isa.method_msgSend["continueTrackingWithEvent:"] || _objj_forward)(self, "continueTrackingWithEvent:", anEvent);
    }
    (self.isa.method_msgSend["_releaseEvents"] || _objj_forward)(self, "_releaseEvents");
    return ret;
}

,["BOOL","CPEvent","CPView","id"]), new objj_method(sel_getUid("startTrackingWithEvent:inView:withDelegate:"), function $CPMouseTracker__startTrackingWithEvent_inView_withDelegate_(self, _cmd, anEvent, aView, aDelegate)
{
    (self.isa.method_msgSend["_setDelegate:"] || _objj_forward)(self, "_setDelegate:", aDelegate);
    self._view = aView;
    (self.isa.method_msgSend["_releaseEvents"] || _objj_forward)(self, "_releaseEvents");
    self._initialEvent = anEvent;
    self._currentEvent = anEvent;
    self._initialPoint = (self.isa.method_msgSend["_getLocalPoint:"] || _objj_forward)(self, "_getLocalPoint:", anEvent);
    self._currentPoint = (self.isa.method_msgSend["_constrainPoint:withEvent:"] || _objj_forward)(self, "_constrainPoint:withEvent:", self._initialPoint, anEvent);
    self._previousPoint = self._currentPoint;
    if (self._delegateRespondTo & startTracking)
        return ((___r1 = self._delegate), ___r1 == null ? null : (___r1.isa.method_msgSend["mouseTracker:shouldStartTrackingWithEvent:"] || _objj_forward)(___r1, "mouseTracker:shouldStartTrackingWithEvent:", self, anEvent));
    return YES;
    var ___r1;
}

,["BOOL","CPEvent","CPView","id"]), new objj_method(sel_getUid("continueTrackingWithEvent:"), function $CPMouseTracker__continueTrackingWithEvent_(self, _cmd, anEvent)
{
    if ((anEvent == null ? null : (anEvent.isa.method_msgSend["type"] || _objj_forward)(anEvent, "type")) == CPLeftMouseUp || self._delegateRespondTo & continueTracking && !CGPointEqualToPoint(self._previousPoint, self._currentPoint) && !((___r1 = self._delegate), ___r1 == null ? null : (___r1.isa.method_msgSend["mouseTracker:shouldContinueTrackingWithEvent:"] || _objj_forward)(___r1, "mouseTracker:shouldContinueTrackingWithEvent:", self, anEvent)))
    {
        return (self.isa.method_msgSend["stopTrackingWithEvent:"] || _objj_forward)(self, "stopTrackingWithEvent:", anEvent);
    }
    self._previousEvent = self._currentEvent;
    self._currentEvent = anEvent;
    self._previousPoint = self._currentPoint;
    var local = (self.isa.method_msgSend["_getLocalPoint:"] || _objj_forward)(self, "_getLocalPoint:", anEvent);
    self._currentPoint = (self.isa.method_msgSend["_constrainPoint:withEvent:"] || _objj_forward)(self, "_constrainPoint:withEvent:", local, anEvent);
    (CPApp == null ? null : (CPApp.isa.method_msgSend["setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:"] || _objj_forward)(CPApp, "setTarget:selector:forNextEventMatchingMask:untilDate:inMode:dequeue:", self, sel_getUid("continueTrackingWithEvent:"), self._eventMask, (CPDate.isa.method_msgSend["distantFuture"] || _objj_forward)(CPDate, "distantFuture"), nil, YES));
    return YES;
    var ___r1;
}

,["BOOL","CPEvent"]), new objj_method(sel_getUid("stopTrackingWithEvent:"), function $CPMouseTracker__stopTrackingWithEvent_(self, _cmd, anEvent)
{
    var localPoint = (self.isa.method_msgSend["_getLocalPoint:"] || _objj_forward)(self, "_getLocalPoint:", anEvent);
    self._currentPoint = (self.isa.method_msgSend["_constrainPoint:withEvent:"] || _objj_forward)(self, "_constrainPoint:withEvent:", localPoint, anEvent);
    self._previousPoint = self._currentPoint;
    var stop = NO;
    if (self._delegateRespondTo & stopTracking)
        stop = ((___r1 = self._delegate), ___r1 == null ? null : (___r1.isa.method_msgSend["mouseTracker:didStopTrackingWithEvent:"] || _objj_forward)(___r1, "mouseTracker:didStopTrackingWithEvent:", self, anEvent));
    (self.isa.method_msgSend["_releaseEvents"] || _objj_forward)(self, "_releaseEvents");
    return stop;
    var ___r1;
}

,["BOOL","CPEvent"]), new objj_method(sel_getUid("_releaseEvents"), function $CPMouseTracker___releaseEvents(self, _cmd)
{
    self._initialEvent = nil;
    self._previousEvent = nil;
    self._currentEvent = nil;
}

,["void"]), new objj_method(sel_getUid("_setDelegate:"), function $CPMouseTracker___setDelegate_(self, _cmd, aDelegate)
{
    if (self._delegate != aDelegate)
    {
        self._delegate = aDelegate;
        self._delegateRespondTo = 0;
        if (((___r1 = self._delegate), ___r1 == null ? null : (___r1.isa.method_msgSend["respondsToSelector:"] || _objj_forward)(___r1, "respondsToSelector:", sel_getUid("mouseTracker:shouldStartTrackingWithEvent:"))))
            self._delegateRespondTo |= startTracking;
        if (((___r1 = self._delegate), ___r1 == null ? null : (___r1.isa.method_msgSend["respondsToSelector:"] || _objj_forward)(___r1, "respondsToSelector:", sel_getUid("mouseTracker:shouldContinueTrackingWithEvent:"))))
            self._delegateRespondTo |= continueTracking;
        if (((___r1 = self._delegate), ___r1 == null ? null : (___r1.isa.method_msgSend["respondsToSelector:"] || _objj_forward)(___r1, "respondsToSelector:", sel_getUid("mouseTracker:didStopTrackingWithEvent:"))))
            self._delegateRespondTo |= stopTracking;
        if (((___r1 = self._delegate), ___r1 == null ? null : (___r1.isa.method_msgSend["respondsToSelector:"] || _objj_forward)(___r1, "respondsToSelector:", sel_getUid("mouseTracker:constrainPoint:withEvent:"))))
            self._delegateRespondTo |= constrainPoint;
        if (((___r1 = self._delegate), ___r1 == null ? null : (___r1.isa.method_msgSend["respondsToSelector:"] || _objj_forward)(___r1, "respondsToSelector:", sel_getUid("mouseTracker:handlePeriodicEvent:"))))
            self._delegateRespondTo |= handlePeriodicEvents;
    }
    var ___r1;
}

,["void","id"]), new objj_method(sel_getUid("_constrainPoint:withEvent:"), function $CPMouseTracker___constrainPoint_withEvent_(self, _cmd, aPoint, anEvent)
{
    var constPoint = CGPointCreateCopy(aPoint);
    if (self._delegateRespondTo & constrainPoint)
        constPoint = ((___r1 = self._delegate), ___r1 == null ? null : (___r1.isa.method_msgSend["mouseTracker:constrainPoint:withEvent:"] || _objj_forward)(___r1, "mouseTracker:constrainPoint:withEvent:", self, constPoint, anEvent));
    if (self._trackingConstraint != 0 && (self._trackingConstraintKeyMask == 0 || (anEvent == null ? null : (anEvent.isa.method_msgSend["modifierFlags"] || _objj_forward)(anEvent, "modifierFlags")) & self._trackingConstraintKeyMask))
    {
        if (self._trackingConstraint == 1)
        {
            constPoint.y = self._initialPoint.y;
        }
        else if (self._trackingConstraint == 2)
        {
            constPoint.x = self._initialPoint.x;
        }
        else if (self._trackingConstraint == 3)
        {
            constPoint.y = self._initialPoint.y + (constPoint.x - self._initialPoint.x);
        }
    }
    return constPoint;
    var ___r1;
}

,["CGPoint","CGPoint","CPEvent"])]);
}
p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
e;