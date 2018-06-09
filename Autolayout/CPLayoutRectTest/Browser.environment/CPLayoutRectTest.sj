@STATIC;1.0;p;15;AppController.jt;5726;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;5659;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);CPLogRegister(CPLogConsole);

{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("theWindow", "CPWindow"), new objj_ivar("contentView", "CPView"), new objj_ivar("drawingRectangle", "CPLayoutRect")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("drawingRectangle"), function $AppController__drawingRectangle(self, _cmd)
{
    return self.drawingRectangle;
}

,["CPLayoutRect"]), new objj_method(sel_getUid("setDrawingRectangle:"), function $AppController__setDrawingRectangle_(self, _cmd, newValue)
{
    self.drawingRectangle = newValue;
}

,["void","CPLayoutRect"]), new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
    self.drawingRectangle = (CPLayoutRect.isa.method_msgSend["layoutRectWithName:inItem:"] || _objj_forward)(CPLayoutRect, "layoutRectWithName:inItem:", "rectangle", self.contentView);
    ((___r1 = self.drawingRectangle), ___r1 == null ? null : (___r1.isa.method_msgSend["setDelegate:"] || _objj_forward)(___r1, "setDelegate:", self));
    var constraints = ((___r1 = ((___r2 = self.contentView), ___r2 == null ? null : (___r2.isa.method_msgSend["layoutRect"] || _objj_forward)(___r2, "layoutRect"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintsEqualToLayoutRect:"] || _objj_forward)(___r1, "constraintsEqualToLayoutRect:", ((___r2 = self.drawingRectangle), ___r2 == null ? null : (___r2.isa.method_msgSend["layoutRectByInsettingWithConstant:"] || _objj_forward)(___r2, "layoutRectByInsettingWithConstant:", -100))));
    (CPLayoutConstraint.isa.method_msgSend["activateConstraints:"] || _objj_forward)(CPLayoutConstraint, "activateConstraints:", constraints);
    var ___r1, ___r2;
}

,["void","CPNotification"]), new objj_method(sel_getUid("awakeFromCib"), function $AppController__awakeFromCib(self, _cmd)
{
    self.contentView = ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["contentView"] || _objj_forward)(___r1, "contentView"));
    ((___r1 = self.contentView), ___r1 == null ? null : (___r1.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(___r1, "setTranslatesAutoresizingMaskIntoConstraints:", YES));
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["setFullPlatformWindow:"] || _objj_forward)(___r1, "setFullPlatformWindow:", NO));
    var ___r1;
}

,["void"]), new objj_method(sel_getUid("engine:didChangeAnchor:"), function $AppController__engine_didChangeAnchor_(self, _cmd, anEngine, anAnchor)
{
    CPLog.debug((anAnchor == null ? null : (anAnchor.isa.method_msgSend["name"] || _objj_forward)(anAnchor, "name")));
}

,["void","CPLayoutConstraintEngine","CPLayoutAnchor"])]);
}

{var the_class = objj_allocateClassPair(CPView, "ColorView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("color", "CPColor")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("viewDidMoveToWindow"), function $ColorView__viewDidMoveToWindow(self, _cmd)
{
    self.color = (CPColor.isa.method_msgSend["randomColor"] || _objj_forward)(CPColor, "randomColor");
}

,["id"]), new objj_method(sel_getUid("drawRect:"), function $ColorView__drawRect_(self, _cmd, aRect)
{
    var ctx = ((___r1 = (CPGraphicsContext.isa.method_msgSend["currentContext"] || _objj_forward)(CPGraphicsContext, "currentContext")), ___r1 == null ? null : (___r1.isa.method_msgSend["graphicsPort"] || _objj_forward)(___r1, "graphicsPort"));
    ((___r1 = self.color), ___r1 == null ? null : (___r1.isa.method_msgSend["set"] || _objj_forward)(___r1, "set"));
    CGContextFillRect(ctx, (self.isa.method_msgSend["bounds"] || _objj_forward)(self, "bounds"));
    ((___r1 = (CPColor.isa.method_msgSend["blackColor"] || _objj_forward)(CPColor, "blackColor")), ___r1 == null ? null : (___r1.isa.method_msgSend["set"] || _objj_forward)(___r1, "set"));
    CGContextSetLineWidth(ctx, 3);
    var rect = ((___r1 = ((___r2 = (CPApp == null ? null : (CPApp.isa.method_msgSend["delegate"] || _objj_forward)(CPApp, "delegate"))), ___r2 == null ? null : (___r2.isa.method_msgSend["drawingRectangle"] || _objj_forward)(___r2, "drawingRectangle"))), ___r1 == null ? null : (___r1.isa.method_msgSend["valueInEngine:"] || _objj_forward)(___r1, "valueInEngine:", nil));
    ((___r1 = (CPBezierPath.isa.method_msgSend["bezierPathWithOvalInRect:"] || _objj_forward)(CPBezierPath, "bezierPathWithOvalInRect:", rect)), ___r1 == null ? null : (___r1.isa.method_msgSend["stroke"] || _objj_forward)(___r1, "stroke"));
    ((___r1 = (CPBezierPath.isa.method_msgSend["bezierPathWithRect:"] || _objj_forward)(CPBezierPath, "bezierPathWithRect:", rect)), ___r1 == null ? null : (___r1.isa.method_msgSend["stroke"] || _objj_forward)(___r1, "stroke"));
    var ___r1, ___r2;
}

,["void","CGRect"]), new objj_method(sel_getUid("mouseDown:"), function $ColorView__mouseDown_(self, _cmd, anEvent)
{
    CPLog.debug("ContentView\n" + ((___r1 = ((___r2 = ((___r3 = (self.isa.method_msgSend["window"] || _objj_forward)(self, "window")), ___r3 == null ? null : (___r3.isa.method_msgSend["contentView"] || _objj_forward)(___r3, "contentView"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraints"] || _objj_forward)(___r2, "constraints"))), ___r1 == null ? null : (___r1.isa.method_msgSend["description"] || _objj_forward)(___r1, "description")));
    var ___r1, ___r2, ___r3;
}

,["void","CPEvent"])]);
}
p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
e;