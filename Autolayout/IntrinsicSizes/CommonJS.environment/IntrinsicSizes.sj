@STATIC;1.0;p;15;AppController.jt;8030;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;7963;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);
{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("theWindow", "CPWindow")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("showAlignRects:"), function $AppController__showAlignRects_(self, _cmd, sender)
{
    var showAlignRects = (sender == null ? null : (sender.isa.method_msgSend["state"] || _objj_forward)(sender, "state"));
    ((___r1 = ((___r2 = self.theWindow), ___r2 == null ? null : (___r2.isa.method_msgSend["contentView"] || _objj_forward)(___r2, "contentView"))), ___r1 == null ? null : (___r1.isa.method_msgSend["setShowAlignRects:"] || _objj_forward)(___r1, "setShowAlignRects:", showAlignRects));
    var ___r1, ___r2;
}

,["void","id"]), new objj_method(sel_getUid("fitAll:"), function $AppController__fitAll_(self, _cmd, sender)
{
    var p = (sender == null ? null : (sender.isa.method_msgSend["state"] || _objj_forward)(sender, "state")) ? CPLayoutPriorityDefaultLow : CPLayoutPriorityRequired;
    ((___r1 = ((___r2 = ((___r3 = self.theWindow), ___r3 == null ? null : (___r3.isa.method_msgSend["contentView"] || _objj_forward)(___r3, "contentView"))), ___r2 == null ? null : (___r2.isa.method_msgSend["subviews"] || _objj_forward)(___r2, "subviews"))), ___r1 == null ? null : (___r1.isa.method_msgSend["enumerateObjectsUsingBlock:"] || _objj_forward)(___r1, "enumerateObjectsUsingBlock:",     function(view, idx, stop)
    {
        ((___r1 = (view == null ? null : (view.isa.method_msgSend["constraints"] || _objj_forward)(view, "constraints"))), ___r1 == null ? null : (___r1.isa.method_msgSend["enumerateObjectsUsingBlock:"] || _objj_forward)(___r1, "enumerateObjectsUsingBlock:",         function(cst, idx, stop)
        {
            if ((cst == null ? null : (cst.isa.method_msgSend["_constraintType"] || _objj_forward)(cst, "_constraintType")) == "Constraint" && ((cst == null ? null : (cst.isa.method_msgSend["firstAnchor"] || _objj_forward)(cst, "firstAnchor")) == (view == null ? null : (view.isa.method_msgSend["widthAnchor"] || _objj_forward)(view, "widthAnchor")) && (view == null ? null : (view.isa.method_msgSend["intrinsicContentSize"] || _objj_forward)(view, "intrinsicContentSize")).width != CPViewNoInstrinsicMetric) || (cst == null ? null : (cst.isa.method_msgSend["firstAnchor"] || _objj_forward)(cst, "firstAnchor")) == (view == null ? null : (view.isa.method_msgSend["heightAnchor"] || _objj_forward)(view, "heightAnchor")) && (view == null ? null : (view.isa.method_msgSend["intrinsicContentSize"] || _objj_forward)(view, "intrinsicContentSize")).height != CPViewNoInstrinsicMetric)
            {
                (cst == null ? null : (cst.isa.method_msgSend["setPriority:"] || _objj_forward)(cst, "setPriority:", p));
                (view == null ? null : (view.isa.method_msgSend["setNeedsUpdateConstraints:"] || _objj_forward)(view, "setNeedsUpdateConstraints:", YES));
            }        }));
        var ___r1;
    }));
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
    ((___r1 = ((___r2 = self.theWindow), ___r2 == null ? null : (___r2.isa.method_msgSend["contentView"] || _objj_forward)(___r2, "contentView"))), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(___r1, "setNeedsDisplay:", YES));
    var ___r1, ___r2, ___r3;
}

,["void","id"]), new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
}

,["void","CPNotification"]), new objj_method(sel_getUid("awakeFromCib"), function $AppController__awakeFromCib(self, _cmd)
{
    ((___r1 = ((___r2 = self.theWindow), ___r2 == null ? null : (___r2.isa.method_msgSend["contentView"] || _objj_forward)(___r2, "contentView"))), ___r1 == null ? null : (___r1.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(___r1, "setTranslatesAutoresizingMaskIntoConstraints:", YES));
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["setFullPlatformWindow:"] || _objj_forward)(___r1, "setFullPlatformWindow:", YES));
    var ___r1, ___r2;
}

,["void"])]);
}

{var the_class = objj_allocateClassPair(CPView, "ContentView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("showAlignRects", "BOOL")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $ContentView__initWithFrame_(self, _cmd, aRect)
{
    self = (objj_getClass("ContentView").super_class.method_dtable["initWithFrame:"] || _objj_forward)(self, "initWithFrame:", aRect);
    self.showAlignRects = NO;
    return self;
}

,["id","CGRect"]), new objj_method(sel_getUid("setShowAlignRects:"), function $ContentView__setShowAlignRects_(self, _cmd, show)
{
    self.showAlignRects = show;
    (self.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(self, "setNeedsDisplay:", YES);
}

,["void","BOOL"]), new objj_method(sel_getUid("drawRect:"), function $ContentView__drawRect_(self, _cmd, aRect)
{
    if (!self.showAlignRects)
        return;
    var context = ((___r1 = (CPGraphicsContext.isa.method_msgSend["currentContext"] || _objj_forward)(CPGraphicsContext, "currentContext")), ___r1 == null ? null : (___r1.isa.method_msgSend["graphicsPort"] || _objj_forward)(___r1, "graphicsPort"));
    ((___r1 = (self.isa.method_msgSend["subviews"] || _objj_forward)(self, "subviews")), ___r1 == null ? null : (___r1.isa.method_msgSend["enumerateObjectsUsingBlock:"] || _objj_forward)(___r1, "enumerateObjectsUsingBlock:",     function(view, idx, stop)
    {
        if ((view == null ? null : (view.isa.method_msgSend["tag"] || _objj_forward)(view, "tag")) !== 999)
            (self.isa.method_msgSend["drawAlignmentRectForView:inContext:"] || _objj_forward)(self, "drawAlignmentRectForView:inContext:", view, context);
    }));
    var ___r1;
}

,["void","CGRect"]), new objj_method(sel_getUid("drawAlignmentRectForView:inContext:"), function $ContentView__drawAlignmentRectForView_inContext_(self, _cmd, aView, aContext)
{
    var frameRect = (aView == null ? null : (aView.isa.method_msgSend["frame"] || _objj_forward)(aView, "frame")),
        bounds = (self.isa.method_msgSend["bounds"] || _objj_forward)(self, "bounds"),
        alignmentRect = (aView == null ? null : (aView.isa.method_msgSend["alignmentRectForFrame:"] || _objj_forward)(aView, "alignmentRectForFrame:", frameRect)),
        offset = 15,
        lw = aContext.lineWidth;
    CGContextSetFillColor(aContext, (CPColor.isa.method_msgSend["colorWithRed:green:blue:alpha:"] || _objj_forward)(CPColor, "colorWithRed:green:blue:alpha:", 0.8, 0.8, 1, 0.3));
    CGContextFillRect(aContext, frameRect);
    var minx = CGRectGetMinX(alignmentRect),
        maxx = CGRectGetMaxX(alignmentRect),
        miny = CGRectGetMinY(alignmentRect),
        maxy = CGRectGetMaxY(alignmentRect);
    CGContextSetStrokeColor(aContext, (CPColor.isa.method_msgSend["redColor"] || _objj_forward)(CPColor, "redColor"));
    CGContextStrokeLineSegments(aContext, [CGPointMake(minx - offset, miny - lw), CGPointMake(maxx + offset, miny - lw), CGPointMake(minx - offset, maxy), CGPointMake(maxx + offset, maxy), CGPointMake(minx - lw, miny - offset), CGPointMake(minx - lw, maxy + offset), CGPointMake(maxx, miny - offset), CGPointMake(maxx, maxy + offset)], 8);
    CGContextBeginPath(aContext);
    CGContextMoveToPoint(aContext, minx - offset, (miny + maxy) / 2);
    CGContextAddLineToPoint(aContext, maxx + offset, (miny + maxy) / 2);
    CGContextClosePath(aContext);
    CGContextSetStrokeColor(aContext, (CPColor.isa.method_msgSend["greenColor"] || _objj_forward)(CPColor, "greenColor"));
    CGContextStrokePath(aContext);
}

,["void","CPView","id"])]);
}
p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
e;