@STATIC;1.0;p;15;AppController.jt;20867;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;20799;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);CPLogRegister(CPLogConsole);

{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("stackView", "StackView"), new objj_ivar("theWindow", "CPWindow")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
    self.theWindow = ((___r1 = (CPWindow.isa.method_msgSend["alloc"] || _objj_forward)(CPWindow, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithContentRect:styleMask:"] || _objj_forward)(___r1, "initWithContentRect:styleMask:", CGRectMake(50, 50, 1200, 400), CPResizableWindowMask | CPTitledWindowMask));
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["setAutolayoutEnabled:"] || _objj_forward)(___r1, "setAutolayoutEnabled:", YES));
    var contentView = ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["contentView"] || _objj_forward)(___r1, "contentView"));
    var segmented = ((___r1 = (CPSegmentedControl.isa.method_msgSend["alloc"] || _objj_forward)(CPSegmentedControl, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(10, 10, 200, 32)));
    (segmented == null ? null : (segmented.isa.method_msgSend["setSegmentCount:"] || _objj_forward)(segmented, "setSegmentCount:", 5));
    (segmented == null ? null : (segmented.isa.method_msgSend["setLabel:forSegment:"] || _objj_forward)(segmented, "setLabel:forSegment:", "Fill", 0));
    (segmented == null ? null : (segmented.isa.method_msgSend["setLabel:forSegment:"] || _objj_forward)(segmented, "setLabel:forSegment:", "Fill Equally", 1));
    (segmented == null ? null : (segmented.isa.method_msgSend["setLabel:forSegment:"] || _objj_forward)(segmented, "setLabel:forSegment:", "Fill Proportionally", 2));
    (segmented == null ? null : (segmented.isa.method_msgSend["setLabel:forSegment:"] || _objj_forward)(segmented, "setLabel:forSegment:", "Equal Spacing", 3));
    (segmented == null ? null : (segmented.isa.method_msgSend["setLabel:forSegment:"] || _objj_forward)(segmented, "setLabel:forSegment:", "Equal Centering", 4));
    (segmented == null ? null : (segmented.isa.method_msgSend["setTarget:"] || _objj_forward)(segmented, "setTarget:", self));
    (segmented == null ? null : (segmented.isa.method_msgSend["setAction:"] || _objj_forward)(segmented, "setAction:", sel_getUid("distribute:")));
    (segmented == null ? null : (segmented.isa.method_msgSend["setSelectedSegment:"] || _objj_forward)(segmented, "setSelectedSegment:", 0));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", segmented));
    var slider = ((___r1 = (CPSlider.isa.method_msgSend["alloc"] || _objj_forward)(CPSlider, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(CGRectGetMaxX((segmented == null ? null : (segmented.isa.method_msgSend["frame"] || _objj_forward)(segmented, "frame"))) + 10, 10, 100, 32)));
    (slider == null ? null : (slider.isa.method_msgSend["setMinValue:"] || _objj_forward)(slider, "setMinValue:", 0));
    (slider == null ? null : (slider.isa.method_msgSend["setMaxValue:"] || _objj_forward)(slider, "setMaxValue:", 50));
    (slider == null ? null : (slider.isa.method_msgSend["setDoubleValue:"] || _objj_forward)(slider, "setDoubleValue:", ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["spacing"] || _objj_forward)(___r1, "spacing"))));
    (slider == null ? null : (slider.isa.method_msgSend["setContinuous:"] || _objj_forward)(slider, "setContinuous:", NO));
    (slider == null ? null : (slider.isa.method_msgSend["setTarget:"] || _objj_forward)(slider, "setTarget:", self));
    (slider == null ? null : (slider.isa.method_msgSend["setAction:"] || _objj_forward)(slider, "setAction:", sel_getUid("setSpacing:")));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", slider));
    var segmentedOrientation = ((___r1 = (CPSegmentedControl.isa.method_msgSend["alloc"] || _objj_forward)(CPSegmentedControl, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(CGRectGetMaxX((slider == null ? null : (slider.isa.method_msgSend["frame"] || _objj_forward)(slider, "frame"))) + 10, 10, 200, 32)));
    (segmentedOrientation == null ? null : (segmentedOrientation.isa.method_msgSend["setSegmentCount:"] || _objj_forward)(segmentedOrientation, "setSegmentCount:", 2));
    (segmentedOrientation == null ? null : (segmentedOrientation.isa.method_msgSend["setLabel:forSegment:"] || _objj_forward)(segmentedOrientation, "setLabel:forSegment:", "Horizontal", 0));
    (segmentedOrientation == null ? null : (segmentedOrientation.isa.method_msgSend["setLabel:forSegment:"] || _objj_forward)(segmentedOrientation, "setLabel:forSegment:", "Vertical", 1));
    (segmentedOrientation == null ? null : (segmentedOrientation.isa.method_msgSend["setTarget:"] || _objj_forward)(segmentedOrientation, "setTarget:", self));
    (segmentedOrientation == null ? null : (segmentedOrientation.isa.method_msgSend["setAction:"] || _objj_forward)(segmentedOrientation, "setAction:", sel_getUid("orientate:")));
    (segmentedOrientation == null ? null : (segmentedOrientation.isa.method_msgSend["setSelectedSegment:"] || _objj_forward)(segmentedOrientation, "setSelectedSegment:", 0));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", segmentedOrientation));
    var huggSlider = ((___r1 = (CPSlider.isa.method_msgSend["alloc"] || _objj_forward)(CPSlider, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(CGRectGetMaxX((segmentedOrientation == null ? null : (segmentedOrientation.isa.method_msgSend["frame"] || _objj_forward)(segmentedOrientation, "frame"))) + 10, 10, 100, 32)));
    (huggSlider == null ? null : (huggSlider.isa.method_msgSend["setMinValue:"] || _objj_forward)(huggSlider, "setMinValue:", 0));
    (huggSlider == null ? null : (huggSlider.isa.method_msgSend["setMaxValue:"] || _objj_forward)(huggSlider, "setMaxValue:", 1000));
    (huggSlider == null ? null : (huggSlider.isa.method_msgSend["setDoubleValue:"] || _objj_forward)(huggSlider, "setDoubleValue:", 250));
    (huggSlider == null ? null : (huggSlider.isa.method_msgSend["setContinuous:"] || _objj_forward)(huggSlider, "setContinuous:", NO));
    (huggSlider == null ? null : (huggSlider.isa.method_msgSend["setTarget:"] || _objj_forward)(huggSlider, "setTarget:", self));
    (huggSlider == null ? null : (huggSlider.isa.method_msgSend["setAction:"] || _objj_forward)(huggSlider, "setAction:", sel_getUid("setHugging:")));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", huggSlider));
    self.stackView = ((___r1 = (StackView == null ? null : (StackView.isa.method_msgSend["alloc"] || _objj_forward)(StackView, "alloc"))), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMakeZero()));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(___r1, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setAlignment:"] || _objj_forward)(___r1, "setAlignment:", CPLayoutAttributeCenterY));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setEdgeInsets:"] || _objj_forward)(___r1, "setEdgeInsets:", CGInsetMake(10, 10, 10, 10)));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setHuggingPriority:forOrientation:"] || _objj_forward)(___r1, "setHuggingPriority:forOrientation:", 255, 0));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setHuggingPriority:forOrientation:"] || _objj_forward)(___r1, "setHuggingPriority:forOrientation:", 255, 1));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", self.stackView));
    var stack1 = ((___r1 = ((___r2 = self.stackView), ___r2 == null ? null : (___r2.isa.method_msgSend["leftAnchor"] || _objj_forward)(___r2, "leftAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (contentView == null ? null : (contentView.isa.method_msgSend["leftAnchor"] || _objj_forward)(contentView, "leftAnchor")), 100)),
        stack2 = ((___r1 = ((___r2 = self.stackView), ___r2 == null ? null : (___r2.isa.method_msgSend["topAnchor"] || _objj_forward)(___r2, "topAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (contentView == null ? null : (contentView.isa.method_msgSend["topAnchor"] || _objj_forward)(contentView, "topAnchor")), 100)),
        stack3 = ((___r1 = ((___r2 = self.stackView), ___r2 == null ? null : (___r2.isa.method_msgSend["rightAnchor"] || _objj_forward)(___r2, "rightAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (contentView == null ? null : (contentView.isa.method_msgSend["rightAnchor"] || _objj_forward)(contentView, "rightAnchor")), -100)),
        stack4 = ((___r1 = ((___r2 = self.stackView), ___r2 == null ? null : (___r2.isa.method_msgSend["bottomAnchor"] || _objj_forward)(___r2, "bottomAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (contentView == null ? null : (contentView.isa.method_msgSend["bottomAnchor"] || _objj_forward)(contentView, "bottomAnchor")), -100));
    (CPLayoutConstraint.isa.method_msgSend["activateConstraints:"] || _objj_forward)(CPLayoutConstraint, "activateConstraints:", [stack1, stack2, stack3, stack4]);
    var views = (___r1 = (CPArray.isa.method_msgSend["alloc"] || _objj_forward)(CPArray, "alloc"), ___r1 == null ? null : (___r1.isa.method_msgSend["init"] || _objj_forward)(___r1, "init")),
        i = 1,
        p = 251;
    for (; i <= 3; i++)
    {
        var view = ((___r1 = (ColorView == null ? null : (ColorView.isa.method_msgSend["alloc"] || _objj_forward)(ColorView, "alloc"))), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithInstrinsicSize:"] || _objj_forward)(___r1, "initWithInstrinsicSize:", CGSizeMake(50 * i, 200)));
        (view == null ? null : (view.isa.method_msgSend["setContentHuggingPriority:forOrientation:"] || _objj_forward)(view, "setContentHuggingPriority:forOrientation:", p--, ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["orientation"] || _objj_forward)(___r1, "orientation"))));
        (view == null ? null : (view.isa.method_msgSend["setIdentifier:"] || _objj_forward)(view, "setIdentifier:", "view" + i));
        (view == null ? null : (view.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(view, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
        (views == null ? null : (views.isa.method_msgSend["addObject:"] || _objj_forward)(views, "addObject:", view));
    }
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setViews:"] || _objj_forward)(___r1, "setViews:", views));
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["orderFront:"] || _objj_forward)(___r1, "orderFront:", self));
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["layout"] || _objj_forward)(___r1, "layout"));
    var ___r1, ___r2;
}

,["void","CPNotification"]), new objj_method(sel_getUid("setHugging:"), function $AppController__setHugging_(self, _cmd, sender)
{
    var k = (sender == null ? null : (sender.isa.method_msgSend["intValue"] || _objj_forward)(sender, "intValue"));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setHuggingPriority:forOrientation:"] || _objj_forward)(___r1, "setHuggingPriority:forOrientation:", k, ((___r2 = self.stackView), ___r2 == null ? null : (___r2.isa.method_msgSend["orientation"] || _objj_forward)(___r2, "orientation"))));
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
    var ___r1, ___r2;
}

,["void","id"]), new objj_method(sel_getUid("distribute:"), function $AppController__distribute_(self, _cmd, sender)
{
    var d = (sender == null ? null : (sender.isa.method_msgSend["selectedSegment"] || _objj_forward)(sender, "selectedSegment"));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setDistribution:"] || _objj_forward)(___r1, "setDistribution:", d));
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
    var ___r1;
}

,["void","id"]), new objj_method(sel_getUid("orientate:"), function $AppController__orientate_(self, _cmd, sender)
{
    var o = (sender == null ? null : (sender.isa.method_msgSend["selectedSegment"] || _objj_forward)(sender, "selectedSegment"));
    ((___r1 = ((___r2 = self.stackView), ___r2 == null ? null : (___r2.isa.method_msgSend["views"] || _objj_forward)(___r2, "views"))), ___r1 == null ? null : (___r1.isa.method_msgSend["enumerateObjectsUsingBlock:"] || _objj_forward)(___r1, "enumerateObjectsUsingBlock:",     function(view, idx, stop)
    {
        if ((view == null ? null : (view.isa.method_msgSend["orientation"] || _objj_forward)(view, "orientation")) !== o)
        {
            var ics = (view == null ? null : (view.isa.method_msgSend["intrinsicSize"] || _objj_forward)(view, "intrinsicSize"));
            (view == null ? null : (view.isa.method_msgSend["setOrientation:"] || _objj_forward)(view, "setOrientation:", o));
            (view == null ? null : (view.isa.method_msgSend["setIntrinsicSize:"] || _objj_forward)(view, "setIntrinsicSize:", CGSizeMake(ics.height, ics.width)));
        }    }));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setOrientation:"] || _objj_forward)(___r1, "setOrientation:", o));
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
    var ___r1, ___r2;
}

,["void","id"]), new objj_method(sel_getUid("setSpacing:"), function $AppController__setSpacing_(self, _cmd, sender)
{
    var k = (sender == null ? null : (sender.isa.method_msgSend["intValue"] || _objj_forward)(sender, "intValue"));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setSpacing:"] || _objj_forward)(___r1, "setSpacing:", k));
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
    var ___r1;
}

,["void","id"])]);
}

{var the_class = objj_allocateClassPair(CPView, "ColorView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("color", "CPColor"), new objj_ivar("intrinsicSize", "CGSize"), new objj_ivar("orientation", "CPInteger")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("intrinsicSize"), function $ColorView__intrinsicSize(self, _cmd)
{
    return self.intrinsicSize;
}

,["CGSize"]), new objj_method(sel_getUid("setIntrinsicSize:"), function $ColorView__setIntrinsicSize_(self, _cmd, newValue)
{
    self.intrinsicSize = newValue;
}

,["void","CGSize"]), new objj_method(sel_getUid("orientation"), function $ColorView__orientation(self, _cmd)
{
    return self.orientation;
}

,["CPInteger"]), new objj_method(sel_getUid("setOrientation:"), function $ColorView__setOrientation_(self, _cmd, newValue)
{
    self.orientation = newValue;
}

,["void","CPInteger"]), new objj_method(sel_getUid("initWithInstrinsicSize:"), function $ColorView__initWithInstrinsicSize_(self, _cmd, aSize)
{
    self = (objj_getClass("ColorView").super_class.method_dtable["initWithFrame:"] || _objj_forward)(self, "initWithFrame:", CGRectMakeZero());
    self.color = (CPColor.isa.method_msgSend["randomColor"] || _objj_forward)(CPColor, "randomColor");
    self.intrinsicSize = aSize;
    self.orientation = 0;
    return self;
}

,["id","CGSize"]), new objj_method(sel_getUid("drawRect:"), function $ColorView__drawRect_(self, _cmd, aRect)
{
    var ctx = ((___r1 = (CPGraphicsContext.isa.method_msgSend["currentContext"] || _objj_forward)(CPGraphicsContext, "currentContext")), ___r1 == null ? null : (___r1.isa.method_msgSend["graphicsPort"] || _objj_forward)(___r1, "graphicsPort"));
    ((___r1 = self.color), ___r1 == null ? null : (___r1.isa.method_msgSend["set"] || _objj_forward)(___r1, "set"));
    CGContextFillRect(ctx, (self.isa.method_msgSend["bounds"] || _objj_forward)(self, "bounds"));
    var ___r1;
}

,["void","CGRect"]), new objj_method(sel_getUid("setIntrinsicSize:"), function $ColorView__setIntrinsicSize_(self, _cmd, aSize)
{
    self.intrinsicSize = aSize;
    (self.isa.method_msgSend["invalidateIntrinsicContentSize"] || _objj_forward)(self, "invalidateIntrinsicContentSize");
}

,["void","CGSize"]), new objj_method(sel_getUid("intrinsicContentSize"), function $ColorView__intrinsicContentSize(self, _cmd)
{
    return self.intrinsicSize;
}

,["CGSize"])]);
}

{var the_class = objj_allocateClassPair(CPStackView, "StackView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("drawRect:"), function $StackView__drawRect_(self, _cmd, aRect)
{
    var ctx = ((___r1 = (CPGraphicsContext.isa.method_msgSend["currentContext"] || _objj_forward)(CPGraphicsContext, "currentContext")), ___r1 == null ? null : (___r1.isa.method_msgSend["graphicsPort"] || _objj_forward)(___r1, "graphicsPort"));
    ((___r1 = (CPColor.isa.method_msgSend["blackColor"] || _objj_forward)(CPColor, "blackColor")), ___r1 == null ? null : (___r1.isa.method_msgSend["set"] || _objj_forward)(___r1, "set"));
    CGContextSetLineWidth(ctx, 3);
    CGContextStrokeRect(ctx, (self.isa.method_msgSend["bounds"] || _objj_forward)(self, "bounds"));
    var ___r1;
}

,["void","CGRect"]), new objj_method(sel_getUid("mouseDown:"), function $StackView__mouseDown_(self, _cmd, anEvent)
{
    CPLog.debug("StackView\n" + ((___r1 = (self.isa.method_msgSend["constraints"] || _objj_forward)(self, "constraints")), ___r1 == null ? null : (___r1.isa.method_msgSend["description"] || _objj_forward)(___r1, "description")));
    CPLog.debug("WindowView\ı" + ((___r1 = ((___r2 = ((___r3 = (self.isa.method_msgSend["window"] || _objj_forward)(self, "window")), ___r3 == null ? null : (___r3.isa.method_msgSend["_windowView"] || _objj_forward)(___r3, "_windowView"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraints"] || _objj_forward)(___r2, "constraints"))), ___r1 == null ? null : (___r1.isa.method_msgSend["description"] || _objj_forward)(___r1, "description")));
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
p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
e;