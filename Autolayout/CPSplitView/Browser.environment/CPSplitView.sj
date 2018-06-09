@STATIC;1.0;p;15;AppController.jt;42845;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;42777;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);CPLogRegister(CPLogConsole);

{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("splitView", "SplitView"), new objj_ivar("splitViewRight", "CPLayoutConstraint"), new objj_ivar("priorityPopover", "CPPopover")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("splitView"), function $AppController__splitView(self, _cmd)
{
    return self.splitView;
}

,["SplitView"]), new objj_method(sel_getUid("setSplitView:"), function $AppController__setSplitView_(self, _cmd, newValue)
{
    self.splitView = newValue;
}

,["void","SplitView"]), new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
    var theWindow = ((___r1 = (CPWindow.isa.method_msgSend["alloc"] || _objj_forward)(CPWindow, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithContentRect:styleMask:"] || _objj_forward)(___r1, "initWithContentRect:styleMask:", CGRectMake(100, 100, 1000, 500), CPTitledWindowMask | CPResizableWindowMask | CPClosableWindowMask)),
        contentView = (theWindow == null ? null : (theWindow.isa.method_msgSend["contentView"] || _objj_forward)(theWindow, "contentView"));
    (theWindow == null ? null : (theWindow.isa.method_msgSend["setTitle:"] || _objj_forward)(theWindow, "setTitle:", (CPDate.isa.method_msgSend["date"] || _objj_forward)(CPDate, "date")));
    (contentView == null ? null : (contentView.isa.method_msgSend["setIdentifier:"] || _objj_forward)(contentView, "setIdentifier:", "contentView"));
    (contentView == null ? null : (contentView.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(contentView, "setTranslatesAutoresizingMaskIntoConstraints:", YES));
    var slider = ((___r1 = (CPSlider.isa.method_msgSend["alloc"] || _objj_forward)(CPSlider, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(10, 10, 100, 32)));
    (slider == null ? null : (slider.isa.method_msgSend["setDoubleValue:"] || _objj_forward)(slider, "setDoubleValue:", 5));
    (slider == null ? null : (slider.isa.method_msgSend["setTarget:"] || _objj_forward)(slider, "setTarget:", self));
    (slider == null ? null : (slider.isa.method_msgSend["setAction:"] || _objj_forward)(slider, "setAction:", sel_getUid("_setDividerThickness:")));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", slider));
    var segmented = ((___r1 = (CPSegmentedControl.isa.method_msgSend["alloc"] || _objj_forward)(CPSegmentedControl, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(120, 10, 100, 32)));
    (segmented == null ? null : (segmented.isa.method_msgSend["setSegmentCount:"] || _objj_forward)(segmented, "setSegmentCount:", 2));
    (segmented == null ? null : (segmented.isa.method_msgSend["setSelectedSegment:"] || _objj_forward)(segmented, "setSelectedSegment:", 1));
    (segmented == null ? null : (segmented.isa.method_msgSend["setLabel:forSegment:"] || _objj_forward)(segmented, "setLabel:forSegment:", "Horizontal", 0));
    (segmented == null ? null : (segmented.isa.method_msgSend["setLabel:forSegment:"] || _objj_forward)(segmented, "setLabel:forSegment:", "Vertical", 1));
    (segmented == null ? null : (segmented.isa.method_msgSend["setTarget:"] || _objj_forward)(segmented, "setTarget:", self));
    (segmented == null ? null : (segmented.isa.method_msgSend["setAction:"] || _objj_forward)(segmented, "setAction:", sel_getUid("_setvertical:")));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", segmented));
    var button = ((___r1 = (CPButton.isa.method_msgSend["alloc"] || _objj_forward)(CPButton, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(240, 10, 100, 32)));
    (button == null ? null : (button.isa.method_msgSend["setTitle:"] || _objj_forward)(button, "setTitle:", "setPosition:"));
    (button == null ? null : (button.isa.method_msgSend["setTarget:"] || _objj_forward)(button, "setTarget:", self));
    (button == null ? null : (button.isa.method_msgSend["setAction:"] || _objj_forward)(button, "setAction:", sel_getUid("setPosition:")));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", button));
    var addSubview = ((___r1 = (CPButton.isa.method_msgSend["alloc"] || _objj_forward)(CPButton, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(350, 10, 100, 32)));
    (addSubview == null ? null : (addSubview.isa.method_msgSend["setTitle:"] || _objj_forward)(addSubview, "setTitle:", "addSubview:"));
    (addSubview == null ? null : (addSubview.isa.method_msgSend["setTarget:"] || _objj_forward)(addSubview, "setTarget:", self));
    (addSubview == null ? null : (addSubview.isa.method_msgSend["setAction:"] || _objj_forward)(addSubview, "setAction:", sel_getUid("addSubview:")));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", addSubview));
    var removeSubview = ((___r1 = (CPButton.isa.method_msgSend["alloc"] || _objj_forward)(CPButton, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(460, 10, 100, 32)));
    (removeSubview == null ? null : (removeSubview.isa.method_msgSend["setTitle:"] || _objj_forward)(removeSubview, "setTitle:", "removeSubview"));
    (removeSubview == null ? null : (removeSubview.isa.method_msgSend["setTarget:"] || _objj_forward)(removeSubview, "setTarget:", self));
    (removeSubview == null ? null : (removeSubview.isa.method_msgSend["setAction:"] || _objj_forward)(removeSubview, "setAction:", sel_getUid("removeSubview:")));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", removeSubview));
    var wider = ((___r1 = (CPButton.isa.method_msgSend["alloc"] || _objj_forward)(CPButton, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(570, 10, 200, 32)));
    (wider == null ? null : (wider.isa.method_msgSend["setButtonType:"] || _objj_forward)(wider, "setButtonType:", CPOnOffButton));
    (wider == null ? null : (wider.isa.method_msgSend["setTitle:"] || _objj_forward)(wider, "setTitle:", "SplitView width"));
    (wider == null ? null : (wider.isa.method_msgSend["setTarget:"] || _objj_forward)(wider, "setTarget:", self));
    (wider == null ? null : (wider.isa.method_msgSend["setAction:"] || _objj_forward)(wider, "setAction:", sel_getUid("wider:")));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", wider));
    self.splitView = ((___r1 = (SplitView == null ? null : (SplitView.isa.method_msgSend["alloc"] || _objj_forward)(SplitView, "alloc"))), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMakeZero()));
    ((___r1 = self.splitView), ___r1 == null ? null : (___r1.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(___r1, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    ((___r1 = self.splitView), ___r1 == null ? null : (___r1.isa.method_msgSend["setValue:forThemeAttribute:"] || _objj_forward)(___r1, "setValue:forThemeAttribute:", 5, "divider-thickness"));
    ((___r1 = self.splitView), ___r1 == null ? null : (___r1.isa.method_msgSend["setIsPaneSplitter:"] || _objj_forward)(___r1, "setIsPaneSplitter:", YES));
    ((___r1 = self.splitView), ___r1 == null ? null : (___r1.isa.method_msgSend["setDelegate:"] || _objj_forward)(___r1, "setDelegate:", self));
    ((___r1 = self.splitView), ___r1 == null ? null : (___r1.isa.method_msgSend["setIdentifier:"] || _objj_forward)(___r1, "setIdentifier:", "SplitView"));
    ((___r1 = self.splitView), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(___r1, "setNeedsDisplay:", YES));
    var left = ((___r1 = ((___r2 = self.splitView), ___r2 == null ? null : (___r2.isa.method_msgSend["leftAnchor"] || _objj_forward)(___r2, "leftAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (contentView == null ? null : (contentView.isa.method_msgSend["leftAnchor"] || _objj_forward)(contentView, "leftAnchor")), 50));
    self.splitViewRight = ((___r1 = ((___r2 = self.splitView), ___r2 == null ? null : (___r2.isa.method_msgSend["rightAnchor"] || _objj_forward)(___r2, "rightAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (contentView == null ? null : (contentView.isa.method_msgSend["rightAnchor"] || _objj_forward)(contentView, "rightAnchor")), -200));
    var top = ((___r1 = ((___r2 = self.splitView), ___r2 == null ? null : (___r2.isa.method_msgSend["topAnchor"] || _objj_forward)(___r2, "topAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (slider == null ? null : (slider.isa.method_msgSend["bottomAnchor"] || _objj_forward)(slider, "bottomAnchor")), 10));
    var bottom = ((___r1 = ((___r2 = self.splitView), ___r2 == null ? null : (___r2.isa.method_msgSend["bottomAnchor"] || _objj_forward)(___r2, "bottomAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (contentView == null ? null : (contentView.isa.method_msgSend["bottomAnchor"] || _objj_forward)(contentView, "bottomAnchor")), -50));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", self.splitView));
    (CPLayoutConstraint.isa.method_msgSend["activateConstraints:"] || _objj_forward)(CPLayoutConstraint, "activateConstraints:", (___r1 = (CPArray.isa.method_msgSend["alloc"] || _objj_forward)(CPArray, "alloc"), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithObjects:count:"] || _objj_forward)(___r1, "initWithObjects:count:", [left, self.splitViewRight, top, bottom], 4)));
    (theWindow == null ? null : (theWindow.isa.method_msgSend["orderFront:"] || _objj_forward)(theWindow, "orderFront:", self));
    var ___r1, ___r2;
}

,["void","CPNotification"]), new objj_method(sel_getUid("priorityPopover"), function $AppController__priorityPopover(self, _cmd)
{
    if (!self.priorityPopover)
    {
        self.priorityPopover = ((___r1 = (CPPopover.isa.method_msgSend["alloc"] || _objj_forward)(CPPopover, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["init"] || _objj_forward)(___r1, "init"));
        ((___r1 = self.priorityPopover), ___r1 == null ? null : (___r1.isa.method_msgSend["setDelegate:"] || _objj_forward)(___r1, "setDelegate:", self));
        var controller = ((___r1 = (PopoverController == null ? null : (PopoverController.isa.method_msgSend["alloc"] || _objj_forward)(PopoverController, "alloc"))), ___r1 == null ? null : (___r1.isa.method_msgSend["init"] || _objj_forward)(___r1, "init"));
        ((___r1 = self.priorityPopover), ___r1 == null ? null : (___r1.isa.method_msgSend["setContentViewController:"] || _objj_forward)(___r1, "setContentViewController:", controller));
    }
    return self.priorityPopover;
    var ___r1;
}

,["void"]), new objj_method(sel_getUid("wider:"), function $AppController__wider_(self, _cmd, sender)
{
    ((___r1 = self.splitViewRight), ___r1 == null ? null : (___r1.isa.method_msgSend["setConstant:"] || _objj_forward)(___r1, "setConstant:", (sender == null ? null : (sender.isa.method_msgSend["state"] || _objj_forward)(sender, "state")) ? -50 : -200));
    ((___r1 = ((___r2 = self.splitView), ___r2 == null ? null : (___r2.isa.method_msgSend["window"] || _objj_forward)(___r2, "window"))), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
    var ___r1, ___r2;
}

,["void","id"]), new objj_method(sel_getUid("addSubview:"), function $AppController__addSubview_(self, _cmd, sender)
{
    var aView = ((___r1 = (ColorView == null ? null : (ColorView.isa.method_msgSend["alloc"] || _objj_forward)(ColorView, "alloc"))), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMakeZero()));
    (aView == null ? null : (aView.isa.method_msgSend["setIntrinsicSize:"] || _objj_forward)(aView, "setIntrinsicSize:", CGSizeMake(100, -1)));
    (aView == null ? null : (aView.isa.method_msgSend["setIdentifier:"] || _objj_forward)(aView, "setIdentifier:", "view" + ((___r1 = ((___r2 = self.splitView), ___r2 == null ? null : (___r2.isa.method_msgSend["subviews"] || _objj_forward)(___r2, "subviews"))), ___r1 == null ? null : (___r1.isa.method_msgSend["count"] || _objj_forward)(___r1, "count"))));
    var antiCompSlider = ((___r1 = (CPSlider.isa.method_msgSend["alloc"] || _objj_forward)(CPSlider, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMakeZero()));
    (antiCompSlider == null ? null : (antiCompSlider.isa.method_msgSend["setIdentifier:"] || _objj_forward)(antiCompSlider, "setIdentifier:", "Anti Compression"));
    (antiCompSlider == null ? null : (antiCompSlider.isa.method_msgSend["setTag:"] || _objj_forward)(antiCompSlider, "setTag:", 1));
    (antiCompSlider == null ? null : (antiCompSlider.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(antiCompSlider, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    (antiCompSlider == null ? null : (antiCompSlider.isa.method_msgSend["setMinValue:"] || _objj_forward)(antiCompSlider, "setMinValue:", 0));
    (antiCompSlider == null ? null : (antiCompSlider.isa.method_msgSend["setMaxValue:"] || _objj_forward)(antiCompSlider, "setMaxValue:", 1000));
    (antiCompSlider == null ? null : (antiCompSlider.isa.method_msgSend["setDoubleValue:"] || _objj_forward)(antiCompSlider, "setDoubleValue:", 1));
    (antiCompSlider == null ? null : (antiCompSlider.isa.method_msgSend["setContinuous:"] || _objj_forward)(antiCompSlider, "setContinuous:", YES));
    (antiCompSlider == null ? null : (antiCompSlider.isa.method_msgSend["setTarget:"] || _objj_forward)(antiCompSlider, "setTarget:", self));
    (antiCompSlider == null ? null : (antiCompSlider.isa.method_msgSend["setAction:"] || _objj_forward)(antiCompSlider, "setAction:", sel_getUid("priorityAction:")));
    var huggingSlider = ((___r1 = (CPSlider.isa.method_msgSend["alloc"] || _objj_forward)(CPSlider, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMakeZero()));
    (huggingSlider == null ? null : (huggingSlider.isa.method_msgSend["setIdentifier:"] || _objj_forward)(huggingSlider, "setIdentifier:", "Hugging"));
    (huggingSlider == null ? null : (huggingSlider.isa.method_msgSend["setTag:"] || _objj_forward)(huggingSlider, "setTag:", 2));
    (huggingSlider == null ? null : (huggingSlider.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(huggingSlider, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    (huggingSlider == null ? null : (huggingSlider.isa.method_msgSend["setMinValue:"] || _objj_forward)(huggingSlider, "setMinValue:", 0));
    (huggingSlider == null ? null : (huggingSlider.isa.method_msgSend["setMaxValue:"] || _objj_forward)(huggingSlider, "setMaxValue:", 1000));
    (huggingSlider == null ? null : (huggingSlider.isa.method_msgSend["setDoubleValue:"] || _objj_forward)(huggingSlider, "setDoubleValue:", 1));
    (huggingSlider == null ? null : (huggingSlider.isa.method_msgSend["setContinuous:"] || _objj_forward)(huggingSlider, "setContinuous:", YES));
    (huggingSlider == null ? null : (huggingSlider.isa.method_msgSend["setTarget:"] || _objj_forward)(huggingSlider, "setTarget:", self));
    (huggingSlider == null ? null : (huggingSlider.isa.method_msgSend["setAction:"] || _objj_forward)(huggingSlider, "setAction:", sel_getUid("priorityAction:")));
    var holdingSlider = ((___r1 = (CPSlider.isa.method_msgSend["alloc"] || _objj_forward)(CPSlider, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMakeZero()));
    (holdingSlider == null ? null : (holdingSlider.isa.method_msgSend["setIdentifier:"] || _objj_forward)(holdingSlider, "setIdentifier:", "Holding"));
    (holdingSlider == null ? null : (holdingSlider.isa.method_msgSend["setTag:"] || _objj_forward)(holdingSlider, "setTag:", 3));
    (holdingSlider == null ? null : (holdingSlider.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(holdingSlider, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    (holdingSlider == null ? null : (holdingSlider.isa.method_msgSend["setMinValue:"] || _objj_forward)(holdingSlider, "setMinValue:", 0));
    (holdingSlider == null ? null : (holdingSlider.isa.method_msgSend["setMaxValue:"] || _objj_forward)(holdingSlider, "setMaxValue:", 1000));
    (holdingSlider == null ? null : (holdingSlider.isa.method_msgSend["setDoubleValue:"] || _objj_forward)(holdingSlider, "setDoubleValue:", 1));
    (holdingSlider == null ? null : (holdingSlider.isa.method_msgSend["setContinuous:"] || _objj_forward)(holdingSlider, "setContinuous:", YES));
    (holdingSlider == null ? null : (holdingSlider.isa.method_msgSend["setTarget:"] || _objj_forward)(holdingSlider, "setTarget:", self));
    (holdingSlider == null ? null : (holdingSlider.isa.method_msgSend["setAction:"] || _objj_forward)(holdingSlider, "setAction:", sel_getUid("priorityAction:")));
    (aView == null ? null : (aView.isa.method_msgSend["addSubview:"] || _objj_forward)(aView, "addSubview:", antiCompSlider));
    (aView == null ? null : (aView.isa.method_msgSend["addSubview:"] || _objj_forward)(aView, "addSubview:", huggingSlider));
    (aView == null ? null : (aView.isa.method_msgSend["addSubview:"] || _objj_forward)(aView, "addSubview:", holdingSlider));
    var center = ((___r1 = (antiCompSlider == null ? null : (antiCompSlider.isa.method_msgSend["centerLayoutPoint"] || _objj_forward)(antiCompSlider, "centerLayoutPoint"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintsEqualToLayoutPoint:"] || _objj_forward)(___r1, "constraintsEqualToLayoutPoint:", (aView == null ? null : (aView.isa.method_msgSend["centerLayoutPoint"] || _objj_forward)(aView, "centerLayoutPoint"))));
    var width = ((___r1 = (antiCompSlider == null ? null : (antiCompSlider.isa.method_msgSend["widthAnchor"] || _objj_forward)(antiCompSlider, "widthAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToConstant:"] || _objj_forward)(___r1, "constraintEqualToConstant:", 100));
    var bellow = ((___r1 = (huggingSlider == null ? null : (huggingSlider.isa.method_msgSend["topAnchor"] || _objj_forward)(huggingSlider, "topAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (antiCompSlider == null ? null : (antiCompSlider.isa.method_msgSend["bottomAnchor"] || _objj_forward)(antiCompSlider, "bottomAnchor")), 10));
    var centerX = ((___r1 = (huggingSlider == null ? null : (huggingSlider.isa.method_msgSend["centerXAnchor"] || _objj_forward)(huggingSlider, "centerXAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:"] || _objj_forward)(___r1, "constraintEqualToAnchor:", (aView == null ? null : (aView.isa.method_msgSend["centerXAnchor"] || _objj_forward)(aView, "centerXAnchor"))));
    var width2 = ((___r1 = (huggingSlider == null ? null : (huggingSlider.isa.method_msgSend["widthAnchor"] || _objj_forward)(huggingSlider, "widthAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToConstant:"] || _objj_forward)(___r1, "constraintEqualToConstant:", 100));
    var bellow2 = ((___r1 = (holdingSlider == null ? null : (holdingSlider.isa.method_msgSend["topAnchor"] || _objj_forward)(holdingSlider, "topAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (huggingSlider == null ? null : (huggingSlider.isa.method_msgSend["bottomAnchor"] || _objj_forward)(huggingSlider, "bottomAnchor")), 10));
    var centerX2 = ((___r1 = (holdingSlider == null ? null : (holdingSlider.isa.method_msgSend["centerXAnchor"] || _objj_forward)(holdingSlider, "centerXAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:"] || _objj_forward)(___r1, "constraintEqualToAnchor:", (aView == null ? null : (aView.isa.method_msgSend["centerXAnchor"] || _objj_forward)(aView, "centerXAnchor"))));
    var width22 = ((___r1 = (holdingSlider == null ? null : (holdingSlider.isa.method_msgSend["widthAnchor"] || _objj_forward)(holdingSlider, "widthAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToConstant:"] || _objj_forward)(___r1, "constraintEqualToConstant:", 100));
    var constraints = (___r1 = (CPArray.isa.method_msgSend["alloc"] || _objj_forward)(CPArray, "alloc"), ___r1 == null ? null : (___r1.isa.method_msgSend["init"] || _objj_forward)(___r1, "init"));
    (constraints == null ? null : (constraints.isa.method_msgSend["addObjectsFromArray:"] || _objj_forward)(constraints, "addObjectsFromArray:", center));
    (constraints == null ? null : (constraints.isa.method_msgSend["addObjectsFromArray:"] || _objj_forward)(constraints, "addObjectsFromArray:", (___r1 = (CPArray.isa.method_msgSend["alloc"] || _objj_forward)(CPArray, "alloc"), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithObjects:count:"] || _objj_forward)(___r1, "initWithObjects:count:", [width, centerX, width2, bellow, bellow2, centerX2, width22], 7))));
    (CPLayoutConstraint.isa.method_msgSend["activateConstraints:"] || _objj_forward)(CPLayoutConstraint, "activateConstraints:", constraints);
    ((___r1 = self.splitView), ___r1 == null ? null : (___r1.isa.method_msgSend["addArrangedSubview:"] || _objj_forward)(___r1, "addArrangedSubview:", aView));
    var last = ((___r1 = ((___r2 = self.splitView), ___r2 == null ? null : (___r2.isa.method_msgSend["arrangedSubviews"] || _objj_forward)(___r2, "arrangedSubviews"))), ___r1 == null ? null : (___r1.isa.method_msgSend["count"] || _objj_forward)(___r1, "count")) - 1;
    ((___r1 = self.splitView), ___r1 == null ? null : (___r1.isa.method_msgSend["setHoldingPriority:forSubviewAtIndex:"] || _objj_forward)(___r1, "setHoldingPriority:forSubviewAtIndex:", 250 - last, last));
    (aView == null ? null : (aView.isa.method_msgSend["updateLayout"] || _objj_forward)(aView, "updateLayout"));
    var ___r1, ___r2;
}

,["void","id"]), new objj_method(sel_getUid("removeSubview:"), function $AppController__removeSubview_(self, _cmd, sender)
{
    var arrangedSubviews = ((___r1 = self.splitView), ___r1 == null ? null : (___r1.isa.method_msgSend["arrangedSubviews"] || _objj_forward)(___r1, "arrangedSubviews"));
    var view = (arrangedSubviews == null ? null : (arrangedSubviews.isa.method_msgSend["objectAtIndex:"] || _objj_forward)(arrangedSubviews, "objectAtIndex:", (arrangedSubviews == null ? null : (arrangedSubviews.isa.method_msgSend["count"] || _objj_forward)(arrangedSubviews, "count")) - 1));
    ((___r1 = self.splitView), ___r1 == null ? null : (___r1.isa.method_msgSend["removeArrangedSubview:"] || _objj_forward)(___r1, "removeArrangedSubview:", view));
    var ___r1;
}

,["void","id"]), new objj_method(sel_getUid("setPosition:"), function $AppController__setPosition_(self, _cmd, sender)
{
    ((___r1 = self.splitView), ___r1 == null ? null : (___r1.isa.method_msgSend["setPosition:ofDividerAtIndex:"] || _objj_forward)(___r1, "setPosition:ofDividerAtIndex:", 100, 0));
    var ___r1;
}

,["void","id"]), new objj_method(sel_getUid("_setvertical:"), function $AppController___setvertical_(self, _cmd, sender)
{
    var value = (sender == null ? null : (sender.isa.method_msgSend["selectedSegment"] || _objj_forward)(sender, "selectedSegment"));
    ((___r1 = self.splitView), ___r1 == null ? null : (___r1.isa.method_msgSend["setVertical:"] || _objj_forward)(___r1, "setVertical:", value));
    var ___r1;
}

,["void","id"]), new objj_method(sel_getUid("_setDividerThickness:"), function $AppController___setDividerThickness_(self, _cmd, sender)
{
    var value = (sender == null ? null : (sender.isa.method_msgSend["intValue"] || _objj_forward)(sender, "intValue"));
    ((___r1 = self.splitView), ___r1 == null ? null : (___r1.isa.method_msgSend["setDividerThickness:"] || _objj_forward)(___r1, "setDividerThickness:", value));
    var ___r1;
}

,["void","id"]), new objj_method(sel_getUid("priorityAction:"), function $AppController__priorityAction_(self, _cmd, sender)
{
    var popover = (self.isa.method_msgSend["priorityPopover"] || _objj_forward)(self, "priorityPopover"),
        controller = (popover == null ? null : (popover.isa.method_msgSend["contentViewController"] || _objj_forward)(popover, "contentViewController"));
    if (!(popover == null ? null : (popover.isa.method_msgSend["isShown"] || _objj_forward)(popover, "isShown")))
    {
        (controller == null ? null : (controller.isa.method_msgSend["setSender:"] || _objj_forward)(controller, "setSender:", sender));
        (popover == null ? null : (popover.isa.method_msgSend["showRelativeToRect:ofView:preferredEdge:"] || _objj_forward)(popover, "showRelativeToRect:ofView:preferredEdge:", nil, sender, CPMaxYEdge));
    }
    if ((sender == null ? null : (sender.isa.method_msgSend["isHighlighted"] || _objj_forward)(sender, "isHighlighted")))
    {
        (controller == null ? null : (controller.isa.method_msgSend["_updateLayout"] || _objj_forward)(controller, "_updateLayout"));
    }
    else
    {
        (popover == null ? null : (popover.isa.method_msgSend["performClose:"] || _objj_forward)(popover, "performClose:", sender));
    }
}

,["void","id"]), new objj_method(sel_getUid("popoverShouldClose:"), function $AppController__popoverShouldClose_(self, _cmd, aPopover)
{
    CPLog.info("popover " + aPopover + " should close");
    return YES;
}

,["BOOL","CPPopover"]), new objj_method(sel_getUid("popoverDidClose:"), function $AppController__popoverDidClose_(self, _cmd, aPopover)
{
    var sender = ((___r1 = (aPopover == null ? null : (aPopover.isa.method_msgSend["contentViewController"] || _objj_forward)(aPopover, "contentViewController"))), ___r1 == null ? null : (___r1.isa.method_msgSend["sender"] || _objj_forward)(___r1, "sender")),
        value = (sender == null ? null : (sender.isa.method_msgSend["intValue"] || _objj_forward)(sender, "intValue")),
        arrangedSubview = (sender == null ? null : (sender.isa.method_msgSend["superview"] || _objj_forward)(sender, "superview"));
    switch((sender == null ? null : (sender.isa.method_msgSend["tag"] || _objj_forward)(sender, "tag"))) {
        case 1:
            (arrangedSubview == null ? null : (arrangedSubview.isa.method_msgSend["setContentCompressionResistancePriority:forOrientation:"] || _objj_forward)(arrangedSubview, "setContentCompressionResistancePriority:forOrientation:", value, 0));
            (arrangedSubview == null ? null : (arrangedSubview.isa.method_msgSend["setNeedsUpdateConstraints:"] || _objj_forward)(arrangedSubview, "setNeedsUpdateConstraints:", YES));
            ((___r1 = ((___r2 = self.splitView), ___r2 == null ? null : (___r2.isa.method_msgSend["window"] || _objj_forward)(___r2, "window"))), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
            break;
        case 2:
            (arrangedSubview == null ? null : (arrangedSubview.isa.method_msgSend["setContentHuggingPriority:forOrientation:"] || _objj_forward)(arrangedSubview, "setContentHuggingPriority:forOrientation:", value, 0));
            (arrangedSubview == null ? null : (arrangedSubview.isa.method_msgSend["setNeedsUpdateConstraints:"] || _objj_forward)(arrangedSubview, "setNeedsUpdateConstraints:", YES));
            ((___r1 = ((___r2 = self.splitView), ___r2 == null ? null : (___r2.isa.method_msgSend["window"] || _objj_forward)(___r2, "window"))), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
            break;
        case 3:
            var idx = ((___r1 = ((___r2 = self.splitView), ___r2 == null ? null : (___r2.isa.method_msgSend["arrangedSubviews"] || _objj_forward)(___r2, "arrangedSubviews"))), ___r1 == null ? null : (___r1.isa.method_msgSend["indexOfObjectIdenticalTo:"] || _objj_forward)(___r1, "indexOfObjectIdenticalTo:", arrangedSubview));
            ((___r1 = self.splitView), ___r1 == null ? null : (___r1.isa.method_msgSend["setHoldingPriority:forSubviewAtIndex:"] || _objj_forward)(___r1, "setHoldingPriority:forSubviewAtIndex:", value, idx));
            break;
default:
    }
    ((___r1 = (aPopover == null ? null : (aPopover.isa.method_msgSend["contentViewController"] || _objj_forward)(aPopover, "contentViewController"))), ___r1 == null ? null : (___r1.isa.method_msgSend["setSender:"] || _objj_forward)(___r1, "setSender:", nil));
    CPLog.info("popover " + aPopover + " did close tag:" + (sender == null ? null : (sender.isa.method_msgSend["tag"] || _objj_forward)(sender, "tag")));
    var ___r1, ___r2;
}

,["void","CPPopover"])]);
}

{var the_class = objj_allocateClassPair(CPViewController, "PopoverController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("sender", "id"), new objj_ivar("valueField", "CPTextField"), new objj_ivar("summaryField", "CPTextField")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("sender"), function $PopoverController__sender(self, _cmd)
{
    return self.sender;
}

,["id"]), new objj_method(sel_getUid("setSender:"), function $PopoverController__setSender_(self, _cmd, newValue)
{
    self.sender = newValue;
}

,["void","id"]), new objj_method(sel_getUid("loadView"), function $PopoverController__loadView(self, _cmd)
{
    var view = ((___r1 = (CPView.isa.method_msgSend["alloc"] || _objj_forward)(CPView, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(0, 0, 200, 110)));
    (view == null ? null : (view.isa.method_msgSend["setBackgroundColor:"] || _objj_forward)(view, "setBackgroundColor:", (CPColor.isa.method_msgSend["colorWithWhite:alpha:"] || _objj_forward)(CPColor, "colorWithWhite:alpha:", 1, 0.2)));
    self.valueField = ((___r1 = (CPTextField.isa.method_msgSend["alloc"] || _objj_forward)(CPTextField, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(0, 4, 200, 28)));
    ((___r1 = self.valueField), ___r1 == null ? null : (___r1.isa.method_msgSend["setFont:"] || _objj_forward)(___r1, "setFont:", (CPFont.isa.method_msgSend["boldSystemFontOfSize:"] || _objj_forward)(CPFont, "boldSystemFontOfSize:", 16)));
    ((___r1 = self.valueField), ___r1 == null ? null : (___r1.isa.method_msgSend["setAlignment:"] || _objj_forward)(___r1, "setAlignment:", CPCenterTextAlignment));
    ((___r1 = self.valueField), ___r1 == null ? null : (___r1.isa.method_msgSend["setAutoresizingMask:"] || _objj_forward)(___r1, "setAutoresizingMask:", CPViewWidthSizable));
    (view == null ? null : (view.isa.method_msgSend["addSubview:"] || _objj_forward)(view, "addSubview:", self.valueField));
    self.summaryField = ((___r1 = (CPTextField.isa.method_msgSend["alloc"] || _objj_forward)(CPTextField, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(10, 32, 180, 80)));
    ((___r1 = self.summaryField), ___r1 == null ? null : (___r1.isa.method_msgSend["setFont:"] || _objj_forward)(___r1, "setFont:", (CPFont.isa.method_msgSend["systemFontOfSize:"] || _objj_forward)(CPFont, "systemFontOfSize:", 16)));
    ((___r1 = self.summaryField), ___r1 == null ? null : (___r1.isa.method_msgSend["setLineBreakMode:"] || _objj_forward)(___r1, "setLineBreakMode:", CPLineBreakByWordWrapping));
    ((___r1 = self.summaryField), ___r1 == null ? null : (___r1.isa.method_msgSend["setAlignment:"] || _objj_forward)(___r1, "setAlignment:", CPCenterTextAlignment));
    (view == null ? null : (view.isa.method_msgSend["addSubview:"] || _objj_forward)(view, "addSubview:", self.summaryField));
    (self.isa.method_msgSend["setView:"] || _objj_forward)(self, "setView:", view);
    var ___r1;
}

,["void"]), new objj_method(sel_getUid("_updateLayout"), function $PopoverController___updateLayout(self, _cmd)
{
    var priority = ((___r1 = self.sender), ___r1 == null ? null : (___r1.isa.method_msgSend["intValue"] || _objj_forward)(___r1, "intValue")),
        text = "";
    if (priority < CPLayoutPriorityDefaultLow)
        text = "Weaker than default weak priority at witch a control holds to its intrinsic content size.";
    else if (priority < CPLayoutPriorityDragThatCannotResizeWindow)
        text = "Weaker than the user resizing the window.";
    else if (priority < CPLayoutPriorityWindowSizeStayPut)
        text = "Weaker than the window staying same size.";
    else if (priority < CPLayoutPriorityDragThatCanResizeWindow)
        text = "Stronger than the window staying same size.";
    else if (priority < CPLayoutPriorityDefaultHigh)
        text = "Stronger than the user resizing the window.";
    else if (priority < CPLayoutPriorityRequired)
        text = "Not required but stronger than the priority at witch controls maintain their intrinsic content size.";
    else if (priority == CPLayoutPriorityRequired)
        text = "Required";
    ((___r1 = self.valueField), ___r1 == null ? null : (___r1.isa.method_msgSend["setStringValue:"] || _objj_forward)(___r1, "setStringValue:", ((___r2 = self.sender), ___r2 == null ? null : (___r2.isa.method_msgSend["identifier"] || _objj_forward)(___r2, "identifier")) + " :" + priority));
    ((___r1 = self.summaryField), ___r1 == null ? null : (___r1.isa.method_msgSend["setStringValue:"] || _objj_forward)(___r1, "setStringValue:", text));
    var ___r1, ___r2;
}

,["void"])]);
}
{
var the_class = objj_getClass("AppController")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"AppController\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("splitView:canCollapseSubview:"), function $AppController__splitView_canCollapseSubview_(self, _cmd, splitView, subview)
{
    return (subview == null ? null : (subview.isa.method_msgSend["identifier"] || _objj_forward)(subview, "identifier")) != "view2";
}

,["BOOL","CPSplitView","CPView"]), new objj_method(sel_getUid("splitView:shouldCollapseSubview:forDoubleClickOnDividerAtIndex:"), function $AppController__splitView_shouldCollapseSubview_forDoubleClickOnDividerAtIndex_(self, _cmd, splitView, subview, dividerIndex)
{
    return (subview == null ? null : (subview.isa.method_msgSend["identifier"] || _objj_forward)(subview, "identifier")) != "view2";
}

,["BOOL","CPSplitView","CPView","CPInteger"]), new objj_method(sel_getUid("splitViewDidResizeSubviews:"), function $AppController__splitViewDidResizeSubviews_(self, _cmd, aNotification)
{
}

,["void","CPNotification"]), new objj_method(sel_getUid("splitViewWillResizeSubviews:"), function $AppController__splitViewWillResizeSubviews_(self, _cmd, aNotification)
{
}

,["void","CPNotification"])]);
}

{var the_class = objj_allocateClassPair(CPView, "ColorView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("color", "CPColor"), new objj_ivar("intrinsicSize", "CGSize")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("color"), function $ColorView__color(self, _cmd)
{
    return self.color;
}

,["CPColor"]), new objj_method(sel_getUid("setColor:"), function $ColorView__setColor_(self, _cmd, newValue)
{
    self.color = newValue;
}

,["void","CPColor"]), new objj_method(sel_getUid("intrinsicSize"), function $ColorView__intrinsicSize(self, _cmd)
{
    return self.intrinsicSize;
}

,["CGSize"]), new objj_method(sel_getUid("setIntrinsicSize:"), function $ColorView__setIntrinsicSize_(self, _cmd, newValue)
{
    self.intrinsicSize = newValue;
}

,["void","CGSize"]), new objj_method(sel_getUid("init"), function $ColorView__init(self, _cmd)
{
    return (self.isa.method_msgSend["initWithFrame:"] || _objj_forward)(self, "initWithFrame:", CGRectMakeZero());
}

,["id"]), new objj_method(sel_getUid("initWithFrame:"), function $ColorView__initWithFrame_(self, _cmd, aRect)
{
    self = (objj_getClass("ColorView").super_class.method_dtable["initWithFrame:"] || _objj_forward)(self, "initWithFrame:", aRect);
    (self == null ? null : (self.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(self, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    self.intrinsicSize = CGSizeMake(-1, -1);
    (self == null ? null : (self.isa.method_msgSend["invalidateIntrinsicContentSize"] || _objj_forward)(self, "invalidateIntrinsicContentSize"));
    self.color = (CPColor.isa.method_msgSend["randomColor"] || _objj_forward)(CPColor, "randomColor");
    return self;
}

,["id","CGRect"]), new objj_method(sel_getUid("viewDidMoveToSuperview"), function $ColorView__viewDidMoveToSuperview(self, _cmd)
{
    (self.isa.method_msgSend["updateLayout"] || _objj_forward)(self, "updateLayout");
}

,["void"]), new objj_method(sel_getUid("updateLayout"), function $ColorView__updateLayout(self, _cmd)
{
    ((___r1 = (self.isa.method_msgSend["viewWithTag:"] || _objj_forward)(self, "viewWithTag:", 1)), ___r1 == null ? null : (___r1.isa.method_msgSend["setFloatValue:"] || _objj_forward)(___r1, "setFloatValue:", (self.isa.method_msgSend["contentCompressionResistancePriorityForOrientation:"] || _objj_forward)(self, "contentCompressionResistancePriorityForOrientation:", 0)));
    ((___r1 = (self.isa.method_msgSend["viewWithTag:"] || _objj_forward)(self, "viewWithTag:", 2)), ___r1 == null ? null : (___r1.isa.method_msgSend["setFloatValue:"] || _objj_forward)(___r1, "setFloatValue:", (self.isa.method_msgSend["contentHuggingPriorityForOrientation:"] || _objj_forward)(self, "contentHuggingPriorityForOrientation:", 0)));
    var sv = ((___r1 = (CPApp == null ? null : (CPApp.isa.method_msgSend["delegate"] || _objj_forward)(CPApp, "delegate"))), ___r1 == null ? null : (___r1.isa.method_msgSend["splitView"] || _objj_forward)(___r1, "splitView"));
    var idx = ((___r1 = (sv == null ? null : (sv.isa.method_msgSend["arrangedSubviews"] || _objj_forward)(sv, "arrangedSubviews"))), ___r1 == null ? null : (___r1.isa.method_msgSend["indexOfObjectIdenticalTo:"] || _objj_forward)(___r1, "indexOfObjectIdenticalTo:", self));
    ((___r1 = (self.isa.method_msgSend["viewWithTag:"] || _objj_forward)(self, "viewWithTag:", 3)), ___r1 == null ? null : (___r1.isa.method_msgSend["setFloatValue:"] || _objj_forward)(___r1, "setFloatValue:", (sv == null ? null : (sv.isa.method_msgSend["holdingPriorityForSubviewAtIndex:"] || _objj_forward)(sv, "holdingPriorityForSubviewAtIndex:", idx))));
    var ___r1;
}

,["void"]), new objj_method(sel_getUid("drawRect:"), function $ColorView__drawRect_(self, _cmd, aRect)
{
    var ctx = ((___r1 = (CPGraphicsContext.isa.method_msgSend["currentContext"] || _objj_forward)(CPGraphicsContext, "currentContext")), ___r1 == null ? null : (___r1.isa.method_msgSend["graphicsPort"] || _objj_forward)(___r1, "graphicsPort"));
    ((___r1 = self.color), ___r1 == null ? null : (___r1.isa.method_msgSend["setFill"] || _objj_forward)(___r1, "setFill"));
    ((___r1 = (CPColor.isa.method_msgSend["blackColor"] || _objj_forward)(CPColor, "blackColor")), ___r1 == null ? null : (___r1.isa.method_msgSend["setStroke"] || _objj_forward)(___r1, "setStroke"));
    CGContextFillRect(ctx, (self.isa.method_msgSend["bounds"] || _objj_forward)(self, "bounds"));
    ((___r1 = (CPColor.isa.method_msgSend["colorWithWhite:alpha:"] || _objj_forward)(CPColor, "colorWithWhite:alpha:", 0, 0.2)), ___r1 == null ? null : (___r1.isa.method_msgSend["setFill"] || _objj_forward)(___r1, "setFill"));
    var width = self.intrinsicSize.width !== -1 ? self.intrinsicSize.width : CGRectGetWidth((self.isa.method_msgSend["bounds"] || _objj_forward)(self, "bounds"));
    var height = self.intrinsicSize.height !== -1 ? self.intrinsicSize.height : CGRectGetHeight((self.isa.method_msgSend["bounds"] || _objj_forward)(self, "bounds"));
    CGContextFillRect(ctx, CGRectMake(0, 0, width, height));
    CGContextStrokeRect(ctx, CGRectInsetByInset((self.isa.method_msgSend["bounds"] || _objj_forward)(self, "bounds"), CGInsetMake(1, 1, 1, 1)));
    var ___r1;
}

,["void","CGRect"]), new objj_method(sel_getUid("intrinsicContentSize"), function $ColorView__intrinsicContentSize(self, _cmd)
{
    return self.intrinsicSize;
}

,["CGSize"])]);
}

{var the_class = objj_allocateClassPair(CPSplitView, "SplitView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("drawRect:"), function $SplitView__drawRect_(self, _cmd, aRect)
{
    (objj_getClass("SplitView").super_class.method_dtable["drawRect:"] || _objj_forward)(self, "drawRect:", aRect);
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