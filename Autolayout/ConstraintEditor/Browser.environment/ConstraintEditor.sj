@STATIC;1.0;p;15;AppController.jt;44053;@STATIC;1.0;I;21;Foundation/CPObject.jI;31;Foundation/CPValueTransformer.jI;17;AppKit/CPWindow.jI;15;AppKit/CPView.jI;26;AppKit/CPArrayController.jI;21;AppKit/CPBezierPath.jI;22;AppKit/CPApplication.jt;43845;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPValueTransformer.j", NO);objj_executeFile("AppKit/CPWindow.j", NO);objj_executeFile("AppKit/CPView.j", NO);objj_executeFile("AppKit/CPArrayController.j", NO);objj_executeFile("AppKit/CPBezierPath.j", NO);objj_executeFile("AppKit/CPApplication.j", NO);CPLogRegister(CPLogConsole);

{var the_class = objj_allocateClassPair(CPValueTransformer, "CPStringToFloatTransformer"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("transformedValue:"), function $CPStringToFloatTransformer__transformedValue_(self, _cmd, aValue)
{
    return (aValue == null ? null : aValue.isa.objj_msgSend0(aValue, "stringValue"));
}

,["id","id"]), new objj_method(sel_getUid("reverseTransformedValue:"), function $CPStringToFloatTransformer__reverseTransformedValue_(self, _cmd, aValue)
{
    return (aValue == null ? null : aValue.isa.objj_msgSend0(aValue, "floatValue"));
}

,["id","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("allowsReverseTransformation"), function $CPStringToFloatTransformer__allowsReverseTransformation(self, _cmd)
{
    return YES;
}

,["BOOL"])]);
}

{var the_class = objj_allocateClassPair(CPValueTransformer, "CPFloatToIntegerTransformer"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("transformedValue:"), function $CPFloatToIntegerTransformer__transformedValue_(self, _cmd, aValue)
{
    return aValue;
}

,["id","id"]), new objj_method(sel_getUid("reverseTransformedValue:"), function $CPFloatToIntegerTransformer__reverseTransformedValue_(self, _cmd, aValue)
{
    return ROUND(aValue);
}

,["id","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("allowsReverseTransformation"), function $CPFloatToIntegerTransformer__allowsReverseTransformation(self, _cmd)
{
    return YES;
}

,["BOOL"])]);
}

{var the_class = objj_allocateClassPair(CPValueTransformer, "CPBoolToColorTransformer"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("transformedValue:"), function $CPBoolToColorTransformer__transformedValue_(self, _cmd, aValue)
{
    return aValue ? CPColor.isa.objj_msgSend0(CPColor, "redColor") : CPColor.isa.objj_msgSend0(CPColor, "greenColor");
}

,["id","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("allowsReverseTransformation"), function $CPBoolToColorTransformer__allowsReverseTransformation(self, _cmd)
{
    return NO;
}

,["BOOL"])]);
}

{var the_class = objj_allocateClassPair(CPArrayController, "ConstraintsController"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
}

{var the_class = objj_allocateClassPair(CPWindow, "CPNonKeyWindow"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("canBecomeKeyWindow"), function $CPNonKeyWindow__canBecomeKeyWindow(self, _cmd)
{
    return NO;
}

,["BOOL"])]);
}

{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("theWindow", "CPWindow"), new objj_ivar("priorityPopover", "CPPopover"), new objj_ivar("addPopover", "CPPopover"), new objj_ivar("tableView", "CPTableView"), new objj_ivar("constraintWindow", "CPWindow"), new objj_ivar("windowLoaded", "BOOL"), new objj_ivar("_selectedViews", "CPArray")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $AppController__init(self, _cmd)
{
    self = objj_msgSendSuper0({ receiver:self, super_class:objj_getClass("AppController").super_class }, "init");
    self._selectedViews = (___r1 = CPArray.isa.objj_msgSend0(CPArray, "alloc"), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "init"));
    self.windowLoaded = NO;
    return self;
    var ___r1;
}

,["id"]), new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
    CPBundle.isa.objj_msgSend2(CPBundle, "loadCibNamed:owner:", "Autolayout", self);
    ((___r1 = ((___r2 = self.constraintWindow), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend(___r1, "addObserver:forKeyPath:options:context:", self, "constraints", CPKeyValueObservingOptionNew, nil));
    ((___r1 = self.constraintWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "orderFront:", nil));
    var ___r1, ___r2;
}

,["void","CPNotification"]), new objj_method(sel_getUid("awakeFromCib"), function $AppController__awakeFromCib(self, _cmd)
{
    ((___r1 = self.theWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFullPlatformWindow:", YES));
    var ___r1;
}

,["void"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $AppController__observeValueForKeyPath_ofObject_change_context_(self, _cmd, keyPath, object, change, context)
{
    if (keyPath == "constraints")
    {
        ((___r1 = ((___r2 = self.constraintWindow), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNeedsDisplay:", YES));
    }
    var ___r1, ___r2;
}

,["void","CPString","id","CPDictionary","void"]), new objj_method(sel_getUid("constantAction:"), function $AppController__constantAction_(self, _cmd, sender)
{
    ((___r1 = self.constraintWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsLayout"));
    ((___r1 = self.isa.objj_msgSend0(self, "selectedView")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNeedsDisplay:", YES));
    var ___r1;
}

,["void","id"]), new objj_method(sel_getUid("priorityAction:"), function $AppController__priorityAction_(self, _cmd, sender)
{
    var text = "",
        priority = (sender == null ? null : sender.isa.objj_msgSend0(sender, "intValue"));
    if (!((___r1 = self.priorityPopover), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isShown")))
        ((___r1 = self.priorityPopover), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "showRelativeToRect:ofView:preferredEdge:", nil, sender, CPMaxYEdge));
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
    var view = ((___r1 = ((___r2 = self.priorityPopover), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentViewController"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "view")),
        valueField = (view == null ? null : view.isa.objj_msgSend1(view, "viewWithTag:", 1001)),
        summaryField = (view == null ? null : view.isa.objj_msgSend1(view, "viewWithTag:", 1000));
    (valueField == null ? null : valueField.isa.objj_msgSend1(valueField, "setStringValue:", priority));
    (summaryField == null ? null : summaryField.isa.objj_msgSend1(summaryField, "setStringValue:", text));
    if (!(sender == null ? null : sender.isa.objj_msgSend0(sender, "isHighlighted")))
    {
        var selectedView = self.isa.objj_msgSend0(self, "selectedView");
        var row = ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "rowForView:", sender));
        var constraint = ((___r1 = (selectedView == null ? null : selectedView.isa.objj_msgSend0(selectedView, "constraints"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", row));
        (constraint == null ? null : constraint.isa.objj_msgSend1(constraint, "setPriority:", priority));
        ((___r1 = self.constraintWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsLayout"));
        (selectedView == null ? null : selectedView.isa.objj_msgSend1(selectedView, "setNeedsDisplay:", YES));
        ((___r1 = self.priorityPopover), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "performClose:", sender));
    }
    var ___r1, ___r2;
}

,["void","id"]), new objj_method(sel_getUid("popoverShouldClose:"), function $AppController__popoverShouldClose_(self, _cmd, aPopover)
{
    return YES;
}

,["void","CPPopover"]), new objj_method(sel_getUid("showConstraintsPopover:"), function $AppController__showConstraintsPopover_(self, _cmd, sender)
{
    if (!((___r1 = self.addPopover), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isShown")))
        ((___r1 = self.addPopover), ___r1 == null ? null : ___r1.isa.objj_msgSend3(___r1, "showRelativeToRect:ofView:preferredEdge:", nil, sender, CPMaxYEdge));
    var selectedView = self.isa.objj_msgSend0(self, "selectedView");
    if (selectedView == nil)
        return;
    var rect = (selectedView == null ? null : selectedView.isa.objj_msgSend0(selectedView, "frame")),
        srect = ((___r1 = (selectedView == null ? null : selectedView.isa.objj_msgSend0(selectedView, "superview"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")),
        popView = ((___r1 = ((___r2 = self.addPopover), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentViewController"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "view"));
    ((___r1 = (popView == null ? null : popView.isa.objj_msgSend1(popView, "viewWithTag:", 1000))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", CGRectGetWidth(rect)));
    ((___r1 = (popView == null ? null : popView.isa.objj_msgSend1(popView, "viewWithTag:", 1001))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", CGRectGetHeight(rect)));
    ((___r1 = (popView == null ? null : popView.isa.objj_msgSend1(popView, "viewWithTag:", 1203))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", CGRectGetMinY(rect)));
    ((___r1 = (popView == null ? null : popView.isa.objj_msgSend1(popView, "viewWithTag:", 1201))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", CGRectGetMinX(rect)));
    ((___r1 = (popView == null ? null : popView.isa.objj_msgSend1(popView, "viewWithTag:", 1204))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", CGRectGetHeight(srect) - CGRectGetMaxY(rect)));
    ((___r1 = (popView == null ? null : popView.isa.objj_msgSend1(popView, "viewWithTag:", 1202))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setStringValue:", CGRectGetWidth(srect) - CGRectGetMaxX(rect)));
    var ___r1, ___r2;
}

,["void","id"]), new objj_method(sel_getUid("addConstraints:"), function $AppController__addConstraints_(self, _cmd, sender)
{
    var selectedView = self.isa.objj_msgSend0(self, "selectedView"),
        selectedSuperview = (selectedView == null ? null : selectedView.isa.objj_msgSend0(selectedView, "superview"));
    var popView = ((___r1 = ((___r2 = self.addPopover), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "contentViewController"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "view")),
        widthCheck = (popView == null ? null : popView.isa.objj_msgSend1(popView, "viewWithTag:", 100)),
        heightCheck = (popView == null ? null : popView.isa.objj_msgSend1(popView, "viewWithTag:", 101)),
        equalWidthsCheck = (popView == null ? null : popView.isa.objj_msgSend1(popView, "viewWithTag:", 102)),
        equalHeightsCheck = (popView == null ? null : popView.isa.objj_msgSend1(popView, "viewWithTag:", 103)),
        ratioCheck = (popView == null ? null : popView.isa.objj_msgSend1(popView, "viewWithTag:", 104)),
        alignCheck = (popView == null ? null : popView.isa.objj_msgSend1(popView, "viewWithTag:", 105)),
        priority = CPLayoutPriorityWindowSizeStayPut;
    if ((widthCheck == null ? null : widthCheck.isa.objj_msgSend0(widthCheck, "state")))
    {
        var width = ((___r1 = (popView == null ? null : popView.isa.objj_msgSend1(popView, "viewWithTag:", 1000))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "floatValue"));
        var constraint = LayoutConstraint(selectedView, CPLayoutAttributeWidth, CPLayoutRelationEqual, nil, CPLayoutAttributeNotAnAttribute, 1, width, priority);
        (widthCheck == null ? null : widthCheck.isa.objj_msgSend1(widthCheck, "setState:", CPOffState));
        (constraint == null ? null : constraint.isa.objj_msgSend1(constraint, "setActive:", YES));
    }
    if ((heightCheck == null ? null : heightCheck.isa.objj_msgSend0(heightCheck, "state")))
    {
        var height = ((___r1 = (popView == null ? null : popView.isa.objj_msgSend1(popView, "viewWithTag:", 1001))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "floatValue"));
        var constraint = LayoutConstraint(selectedView, CPLayoutAttributeHeight, CPLayoutRelationEqual, nil, CPLayoutAttributeNotAnAttribute, 1, height, priority);
        (heightCheck == null ? null : heightCheck.isa.objj_msgSend1(heightCheck, "setState:", CPOffState));
        (constraint == null ? null : constraint.isa.objj_msgSend1(constraint, "setActive:", YES));
    }
    if ((equalWidthsCheck == null ? null : equalWidthsCheck.isa.objj_msgSend0(equalWidthsCheck, "state")))
    {
        var view1 = ((___r1 = self._selectedViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 0)),
            view2 = ((___r1 = self._selectedViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 1));
        var constraint = LayoutConstraint(view1, CPLayoutAttributeWidth, CPLayoutRelationEqual, view2, CPLayoutAttributeWidth, 1, 0, priority);
        (equalWidthsCheck == null ? null : equalWidthsCheck.isa.objj_msgSend1(equalWidthsCheck, "setState:", CPOffState));
        (constraint == null ? null : constraint.isa.objj_msgSend1(constraint, "setActive:", YES));
    }
    if ((equalHeightsCheck == null ? null : equalHeightsCheck.isa.objj_msgSend0(equalHeightsCheck, "state")))
    {
        var view1 = ((___r1 = self._selectedViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 0)),
            view2 = ((___r1 = self._selectedViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 1));
        var constraint = LayoutConstraint(view1, CPLayoutAttributeHeight, CPLayoutRelationEqual, view2, CPLayoutAttributeHeight, 1, 0, priority);
        (equalHeightsCheck == null ? null : equalHeightsCheck.isa.objj_msgSend1(equalHeightsCheck, "setState:", CPOffState));
        (constraint == null ? null : constraint.isa.objj_msgSend1(constraint, "setActive:", YES));
    }
    if ((ratioCheck == null ? null : ratioCheck.isa.objj_msgSend0(ratioCheck, "state")))
    {
        var rect = (selectedView == null ? null : selectedView.isa.objj_msgSend0(selectedView, "frame")),
            ratio = CGRectGetWidth(rect) / CGRectGetHeight(rect);
        var constraint = LayoutConstraint(selectedView, CPLayoutAttributeWidth, CPLayoutRelationEqual, selectedView, CPLayoutAttributeHeight, ratio, 0, priority);
        (ratioCheck == null ? null : ratioCheck.isa.objj_msgSend1(ratioCheck, "setState:", CPOffState));
        (constraint == null ? null : constraint.isa.objj_msgSend1(constraint, "setActive:", YES));
    }
    if ((alignCheck == null ? null : alignCheck.isa.objj_msgSend0(alignCheck, "state")))
    {
        var view1 = ((___r1 = self._selectedViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 0)),
            view2 = ((___r1 = self._selectedViews), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", 1)),
            attr = ((___r1 = ((___r2 = (popView == null ? null : popView.isa.objj_msgSend1(popView, "viewWithTag:", 106))), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "selectedItem"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "tag"));
        var constraint = LayoutConstraint(view1, attr, CPLayoutRelationEqual, view2, attr, 1, 0, priority);
        (alignCheck == null ? null : alignCheck.isa.objj_msgSend1(alignCheck, "setState:", CPOffState));
        (constraint == null ? null : constraint.isa.objj_msgSend1(constraint, "setActive:", YES));
    }
    for (var attribute = 1; attribute <= 4; attribute++)
    {
        var check = (popView == null ? null : popView.isa.objj_msgSend1(popView, "viewWithTag:", 200 + attribute));
        if ((check == null ? null : check.isa.objj_msgSend0(check, "state")))
        {
            var constant = ((___r1 = (popView == null ? null : popView.isa.objj_msgSend1(popView, "viewWithTag:", 1200 + attribute))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "floatValue"));
            if (attribute == CPLayoutAttributeBottom || attribute == CPLayoutAttributeRight)
                constant = -constant;
            var constraint = LayoutConstraint(selectedView, attribute, CPLayoutRelationEqual, selectedSuperview, attribute, 1, constant, priority);
            (check == null ? null : check.isa.objj_msgSend1(check, "setState:", CPOffState));
            (constraint == null ? null : constraint.isa.objj_msgSend1(constraint, "setActive:", YES));
        }
    }
    ((___r1 = self.addPopover), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "performClose:", sender));
    ((___r1 = self.constraintWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsLayout"));
    self.isa.objj_msgSend0(self, "updatePrioritySlider");
    var ___r1, ___r2;
}

,["void","id"]), new objj_method(sel_getUid("tableViewSelectionDidChange:"), function $AppController__tableViewSelectionDidChange_(self, _cmd, aNotification)
{
    ((___r1 = self.isa.objj_msgSend0(self, "selectedView")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setNeedsDisplay:", YES));
    var ___r1;
}

,["void","CPNotification"]), new objj_method(sel_getUid("updatePrioritySlider"), function $AppController__updatePrioritySlider(self, _cmd)
{
    var constraints = ((___r1 = self.isa.objj_msgSend0(self, "selectedView")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "constraints"));
    ((___r1 = self.tableView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "enumerateAvailableViewsUsingBlock:",     function(aCellView, row, column, stop)
    {
        if ((aCellView == null ? null : aCellView.isa.objj_msgSend0(aCellView, "identifier")) == "Constraint")
        {
            var priority = ((___r1 = (constraints == null ? null : constraints.isa.objj_msgSend1(constraints, "objectAtIndex:", row))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "priority"));
            ((___r1 = (aCellView == null ? null : aCellView.isa.objj_msgSend1(aCellView, "viewWithTag:", 1000))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFloatValue:", priority));
        }        var ___r1;
    }));
    var ___r1;
}

,["void"]), new objj_method(sel_getUid("tableView:viewForTableColumn:row:"), function $AppController__tableView_viewForTableColumn_row_(self, _cmd, aTableView, tableColumn, row)
{
    var constraintsView = self.isa.objj_msgSend0(self, "selectedView"),
        cellView = nil;
    if (constraintsView)
    {
        var constraint = ((___r1 = (constraintsView == null ? null : constraintsView.isa.objj_msgSend0(constraintsView, "constraints"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", row));
        cellView = (aTableView == null ? null : aTableView.isa.objj_msgSend2(aTableView, "makeViewWithIdentifier:owner:", (constraint == null ? null : constraint.isa.objj_msgSend0(constraint, "_constraintType")), self));
    }
    return cellView;
    var ___r1;
}

,["CPView","CPTableView","CPTableColumn","CPInteger"]), new objj_method(sel_getUid("tableViewDeleteKeyPressed:"), function $AppController__tableViewDeleteKeyPressed_(self, _cmd, aTableView)
{
    var row = (aTableView == null ? null : aTableView.isa.objj_msgSend0(aTableView, "selectedRow"));
    if (row !== CPNotFound)
    {
        var view = self.isa.objj_msgSend0(self, "selectedView");
        if (view)
        {
            var constraint = ((___r1 = (view == null ? null : view.isa.objj_msgSend0(view, "constraints"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", row));
            (constraint == null ? null : constraint.isa.objj_msgSend1(constraint, "setActive:", NO));
            ((___r1 = self.constraintWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setNeedsLayout"));
        }
    }
    var ___r1;
}

,["void","CPTableView"]), new objj_method(sel_getUid("layout:"), function $AppController__layout_(self, _cmd, sender)
{
    ((___r1 = self.constraintWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "layoutIfNeeded"));
    var ___r1;
}

,["void","id"]), new objj_method(sel_getUid("visualizeConstraints:"), function $AppController__visualizeConstraints_(self, _cmd, sender)
{
}

,["void","id"]), new objj_method(sel_getUid("_selectView:byExtendingSelection:"), function $AppController___selectView_byExtendingSelection_(self, _cmd, aView, extend)
{
    var current_selection = CPArray.isa.objj_msgSend1(CPArray, "arrayWithArray:", self._selectedViews);
    if (extend)
    {
        if ((current_selection == null ? null : current_selection.isa.objj_msgSend1(current_selection, "containsObjectIdenticalTo:", aView)))
            (current_selection == null ? null : current_selection.isa.objj_msgSend1(current_selection, "removeObject:", aView));
        else
            (current_selection == null ? null : current_selection.isa.objj_msgSend1(current_selection, "addObject:", aView));
    }
    else
    {
        current_selection = (___r1 = CPArray.isa.objj_msgSend0(CPArray, "alloc"), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithObjects:count:", [aView], 1));
    }
    self.isa.objj_msgSend1(self, "setSelectedViews:", current_selection);
    self.isa.objj_msgSend0(self, "updatePrioritySlider");
    var ___r1;
}

,["void","id","BOOL"]), new objj_method(sel_getUid("selectedView"), function $AppController__selectedView(self, _cmd)
{
    return ((___r1 = self._selectedViews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "lastObject"));
    var ___r1;
}

,["CPView"]), new objj_method(sel_getUid("setSelectedViews:"), function $AppController__setSelectedViews_(self, _cmd, theSelectedViews)
{
    if (!(theSelectedViews == null ? null : theSelectedViews.isa.objj_msgSend1(theSelectedViews, "isEqual:", self._selectedViews)))
    {
        ((___r1 = self._selectedViews), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setSelected:"), NO));
        self._selectedViews = theSelectedViews;
        ((___r1 = self._selectedViews), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "makeObjectsPerformSelector:withObject:", sel_getUid("setSelected:"), YES));
    }
    var ___r1;
}

,["void","CPArray"]), new objj_method(sel_getUid("isMultiSelection"), function $AppController__isMultiSelection(self, _cmd)
{
    return ((___r1 = self._selectedViews), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) > 1;
    var ___r1;
}

,["BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("keyPathsForValuesAffectingIsMultiSelection"), function $AppController__keyPathsForValuesAffectingIsMultiSelection(self, _cmd)
{
    return CPSet.isa.objj_msgSend1(CPSet, "setWithObjects:", "selectedViews");
}

,["CPSet"]), new objj_method(sel_getUid("keyPathsForValuesAffectingSelectedView"), function $AppController__keyPathsForValuesAffectingSelectedView(self, _cmd)
{
    return CPSet.isa.objj_msgSend1(CPSet, "setWithObjects:", "selectedViews");
}

,["CPSet"])]);
}

{var the_class = objj_allocateClassPair(CPView, "ConstraintView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_selected", "BOOL"), new objj_ivar("_showConstraints", "BOOL"), new objj_ivar("selectedConstraintIndexes", "CPIndexSet"), new objj_ivar("m_intrinsicContentSize", "CGSize")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("selected"), function $ConstraintView__selected(self, _cmd)
{
    return self._selected;
}

,["BOOL"]), new objj_method(sel_getUid("_setSelected:"), function $ConstraintView___setSelected_(self, _cmd, newValue)
{
    self._selected = newValue;
}

,["void","BOOL"]), new objj_method(sel_getUid("showConstraints"), function $ConstraintView__showConstraints(self, _cmd)
{
    return self._showConstraints;
}

,["BOOL"]), new objj_method(sel_getUid("setShowConstraints:"), function $ConstraintView__setShowConstraints_(self, _cmd, newValue)
{
    self._showConstraints = newValue;
}

,["void","BOOL"]), new objj_method(sel_getUid("selectedConstraintIndexes"), function $ConstraintView__selectedConstraintIndexes(self, _cmd)
{
    return self.selectedConstraintIndexes;
}

,["CPIndexSet"]), new objj_method(sel_getUid("setSelectedConstraintIndexes:"), function $ConstraintView__setSelectedConstraintIndexes_(self, _cmd, newValue)
{
    self.selectedConstraintIndexes = newValue;
}

,["void","CPIndexSet"]), new objj_method(sel_getUid("acceptsFirstMouse:"), function $ConstraintView__acceptsFirstMouse_(self, _cmd, anEvent)
{
    return YES;
}

,["BOOL","CPEvent"]), new objj_method(sel_getUid("initWithFrame:"), function $ConstraintView__initWithFrame_(self, _cmd, aFrame)
{
    CPLog.debug(self.isa.objj_msgSend0(self, "class") + _cmd);
    self = objj_msgSendSuper1({ receiver:self, super_class:objj_getClass("ConstraintView").super_class }, "initWithFrame:", aFrame);
    self._selected = NO;
    self._showConstraints = YES;
    self.m_intrinsicContentSize = CGSizeMake(-1, -1);
    self.selectedConstraintIndexes = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    return self;
}

,["id","CGRect"]), new objj_method(sel_getUid("initWithCoder:"), function $ConstraintView__initWithCoder_(self, _cmd, aCoder)
{
    CPLog.debug(self.isa.objj_msgSend0(self, "class") + _cmd);
    self = objj_msgSendSuper1({ receiver:self, super_class:objj_getClass("ConstraintView").super_class }, "initWithCoder:", aCoder);
    self._selected = NO;
    self._showConstraints = YES;
    self.m_intrinsicContentSize = CGSizeMake(-1, -1);
    self.selectedConstraintIndexes = CPIndexSet.isa.objj_msgSend0(CPIndexSet, "indexSet");
    return self;
}

,["id","CPCoder"]), new objj_method(sel_getUid("mouseDown:"), function $ConstraintView__mouseDown_(self, _cmd, anEvent)
{
    if ((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "type")) !== CPLeftMouseDown)
        return;
    if ((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags")) & CPShiftKeyMask)
        CPLog.debug(((___r1 = self.isa.objj_msgSend0(self, "_layoutEngine")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")));
    else if ((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags")) & CPAlternateKeyMask)
        ((___r1 = self.isa.objj_msgSend0(self, "window")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "layout"));
    else
    {
        var extend = (anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "modifierFlags")) & CPCommandKeyMask;
        ((___r1 = (CPApp == null ? null : CPApp.isa.objj_msgSend0(CPApp, "delegate"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "_selectView:byExtendingSelection:", self, extend));
    }
    var ___r1;
}

,["void","CPEvent"]), new objj_method(sel_getUid("setSelected:"), function $ConstraintView__setSelected_(self, _cmd, flag)
{
    if (self._selected !== flag)
    {
        self._selected = flag;
        self._showConstraints = YES;
        self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
    }
}

,["void","BOOL"]), new objj_method(sel_getUid("pathForContentSizeConstraint:"), function $ConstraintView__pathForContentSizeConstraint_(self, _cmd, aConstraint)
{
    var size = self.isa.objj_msgSend0(self, "frameSize"),
        orientation = (aConstraint == null ? null : aConstraint.isa.objj_msgSend0(aConstraint, "orientation"));
    var startx = orientation ? 20 : 0,
        starty = orientation ? 0 : size.height - 20,
        endx = orientation ? 20 : size.width,
        endy = orientation ? size.height : size.height - 20;
    var path = CPBezierPath.isa.objj_msgSend0(CPBezierPath, "bezierPath");
    (path == null ? null : path.isa.objj_msgSend1(path, "moveToPoint:", CGPointMake(startx, starty)));
    (path == null ? null : path.isa.objj_msgSend1(path, "lineToPoint:", CGPointMake(endx, endy)));
    (path == null ? null : path.isa.objj_msgSend1(path, "setLineWidth:", 3));
    return path;
}

,["CPBezierPath","CPLayoutConstraint"]), new objj_method(sel_getUid("pathForConstraint:"), function $ConstraintView__pathForConstraint_(self, _cmd, aConstraint)
{
    var container = (aConstraint == null ? null : aConstraint.isa.objj_msgSend0(aConstraint, "container"));
    if (container == nil)
        return;
    var firstItem = (aConstraint == null ? null : aConstraint.isa.objj_msgSend0(aConstraint, "firstItem")) || container,
        secondItem = (aConstraint == null ? null : aConstraint.isa.objj_msgSend0(aConstraint, "secondItem")) || container,
        firstAttribute = (aConstraint == null ? null : aConstraint.isa.objj_msgSend0(aConstraint, "firstAttribute")),
        secondAttribute = (aConstraint == null ? null : aConstraint.isa.objj_msgSend0(aConstraint, "secondAttribute")),
        relation = (aConstraint == null ? null : aConstraint.isa.objj_msgSend0(aConstraint, "relation")),
        multiplier = (aConstraint == null ? null : aConstraint.isa.objj_msgSend0(aConstraint, "multiplier")),
        constant = (aConstraint == null ? null : aConstraint.isa.objj_msgSend0(aConstraint, "constant")),
        priority = (aConstraint == null ? null : aConstraint.isa.objj_msgSend0(aConstraint, "priority")),
        flags = (aConstraint == null ? null : aConstraint.isa.objj_msgSend0(aConstraint, "constraintFlags"));
    if (secondAttribute === CPLayoutAttributeNotAnAttribute && firstAttribute !== CPLayoutAttributeWidth && firstAttribute !== CPLayoutAttributeHeight)
        secondAttribute = firstAttribute;
    var startPoint = CGPointMakeZero(),
        endPoint = CGPointMakeZero();
    if (firstAttribute == CPLayoutAttributeLeft || firstAttribute == CPLayoutAttributeLeading)
    {
        startPoint.x = flags & 8 ? CGRectGetMinX((firstItem == null ? null : firstItem.isa.objj_msgSend0(firstItem, "frame"))) : 0;
        startPoint.y = flags & 8 ? CGRectGetMidY((firstItem == null ? null : firstItem.isa.objj_msgSend0(firstItem, "frame"))) : CGRectGetMidY((secondItem == null ? null : secondItem.isa.objj_msgSend0(secondItem, "frame")));
    }
    else if (firstAttribute == CPLayoutAttributeRight || firstAttribute == CPLayoutAttributeTrailing)
    {
        startPoint.x = flags & 8 ? CGRectGetMaxX((firstItem == null ? null : firstItem.isa.objj_msgSend0(firstItem, "frame"))) : CGRectGetWidth((container == null ? null : container.isa.objj_msgSend0(container, "frame")));
        startPoint.y = flags & 8 ? CGRectGetMidY((firstItem == null ? null : firstItem.isa.objj_msgSend0(firstItem, "frame"))) : CGRectGetMidY((secondItem == null ? null : secondItem.isa.objj_msgSend0(secondItem, "frame")));
    }
    else if (firstAttribute == CPLayoutAttributeTop)
    {
        startPoint.y = flags & 8 ? CGRectGetMinY((firstItem == null ? null : firstItem.isa.objj_msgSend0(firstItem, "frame"))) : 0;
        startPoint.x = flags & 8 ? CGRectGetMidX((firstItem == null ? null : firstItem.isa.objj_msgSend0(firstItem, "frame"))) : CGRectGetMidX((secondItem == null ? null : secondItem.isa.objj_msgSend0(secondItem, "frame")));
    }
    else if (firstAttribute == CPLayoutAttributeBottom)
    {
        startPoint.y = flags & 8 ? CGRectGetMaxY((firstItem == null ? null : firstItem.isa.objj_msgSend0(firstItem, "frame"))) : CGRectGetHeight((container == null ? null : container.isa.objj_msgSend0(container, "frame")));
        startPoint.x = flags & 8 ? CGRectGetMidX((firstItem == null ? null : firstItem.isa.objj_msgSend0(firstItem, "frame"))) : CGRectGetMidX((secondItem == null ? null : secondItem.isa.objj_msgSend0(secondItem, "frame")));
    }
    else if (firstAttribute == CPLayoutAttributeWidth && secondAttribute == 0)
    {
        startPoint.x = 0;
        startPoint.y = CGRectGetHeight((firstItem == null ? null : firstItem.isa.objj_msgSend0(firstItem, "frame"))) - 10;
        endPoint.x = CGRectGetWidth((firstItem == null ? null : firstItem.isa.objj_msgSend0(firstItem, "frame")));
        endPoint.y = CGRectGetHeight((firstItem == null ? null : firstItem.isa.objj_msgSend0(firstItem, "frame"))) - 10;
    }
    else if (firstAttribute == CPLayoutAttributeHeight && secondAttribute == 0)
    {
        startPoint.x = 10;
        startPoint.y = 0;
        endPoint.x = 10;
        endPoint.y = CGRectGetHeight((firstItem == null ? null : firstItem.isa.objj_msgSend0(firstItem, "frame")));
    }
    if (secondAttribute == CPLayoutAttributeLeft || secondAttribute == CPLayoutAttributeLeading)
    {
        endPoint.x = flags & 64 ? CGRectGetMinX((secondItem == null ? null : secondItem.isa.objj_msgSend0(secondItem, "frame"))) : 0;
        endPoint.y = startPoint.y;
    }
    else if (secondAttribute == CPLayoutAttributeRight || secondAttribute == CPLayoutAttributeTrailing)
    {
        endPoint.x = flags & 64 ? CGRectGetMaxX((secondItem == null ? null : secondItem.isa.objj_msgSend0(secondItem, "frame"))) : CGRectGetWidth((container == null ? null : container.isa.objj_msgSend0(container, "frame")));
        endPoint.y = startPoint.y;
    }
    else if (secondAttribute == CPLayoutAttributeTop)
    {
        endPoint.y = flags & 64 ? CGRectGetMinY((secondItem == null ? null : secondItem.isa.objj_msgSend0(secondItem, "frame"))) : 0;
        endPoint.x = flags & 64 ? CGRectGetMidX((secondItem == null ? null : secondItem.isa.objj_msgSend0(secondItem, "frame"))) : startPoint.x;
    }
    else if (secondAttribute == CPLayoutAttributeBottom)
    {
        endPoint.y = flags & 64 ? CGRectGetMaxY((secondItem == null ? null : secondItem.isa.objj_msgSend0(secondItem, "frame"))) : CGRectGetHeight((container == null ? null : container.isa.objj_msgSend0(container, "frame")));
        endPoint.x = flags & 64 ? CGRectGetMidX((secondItem == null ? null : secondItem.isa.objj_msgSend0(secondItem, "frame"))) : startPoint.x;
    }
    var path = CPBezierPath.isa.objj_msgSend0(CPBezierPath, "bezierPath");
    (path == null ? null : path.isa.objj_msgSend1(path, "moveToPoint:", startPoint));
    (path == null ? null : path.isa.objj_msgSend1(path, "lineToPoint:", endPoint));
    (path == null ? null : path.isa.objj_msgSend2(path, "setLineDash:phase:", priority < 1000 ? [5, 5] : [], 1));
    (path == null ? null : path.isa.objj_msgSend1(path, "setLineWidth:", 2));
    return path;
}

,["CPBezierPath","CPLayoutConstraint"]), new objj_method(sel_getUid("drawRect:"), function $ConstraintView__drawRect_(self, _cmd, aRect)
{
    self.isa.objj_msgSend1(self, "drawBackgroundInRect:", aRect);
    self.isa.objj_msgSend1(self, "drawConstraintsInRect:", aRect);
}

,["void","CGRect"]), new objj_method(sel_getUid("drawBackgroundInRect:"), function $ConstraintView__drawBackgroundInRect_(self, _cmd, aRect)
{
    var identifier = self.isa.objj_msgSend0(self, "identifier");
    if (identifier !== "contentView")
    {
        var fillColor = CPColor.isa.objj_msgSend(CPColor, "colorWithRed:green:blue:alpha:", 159 / 255, 180 / 255, 210 / 255, 1),
            bounds = self.isa.objj_msgSend0(self, "bounds");
        (fillColor == null ? null : fillColor.isa.objj_msgSend0(fillColor, "setFill"));
        CPBezierPath.isa.objj_msgSend1(CPBezierPath, "fillRect:", bounds);
        self.isa.objj_msgSend2(self, "drawString:inBounds:", identifier, bounds);
    }
    if (self._selected)
    {
        CPBezierPath.isa.objj_msgSend1(CPBezierPath, "setDefaultLineWidth:", 3);
        ((___r1 = CPColor.isa.objj_msgSend0(CPColor, "orangeColor")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setStroke"));
        CPBezierPath.isa.objj_msgSend1(CPBezierPath, "strokeRect:", self.isa.objj_msgSend0(self, "bounds"));
    }
    var ___r1;
}

,["void","CGRect"]), new objj_method(sel_getUid("drawString:inBounds:"), function $ConstraintView__drawString_inBounds_(self, _cmd, aString, bounds)
{
    var ctx = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    CGContextSelectFont(ctx, CPFont.isa.objj_msgSend1(CPFont, "boldSystemFontOfSize:", 20));
    ((___r1 = CPColor.isa.objj_msgSend0(CPColor, "whiteColor")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "setFill"));
    var metrics = ctx.measureText(aString);
    CGContextShowTextAtPoint(ctx, (CGRectGetWidth(bounds) - metrics.width) / 2, CGRectGetHeight(bounds) / 2, aString);
    var ___r1;
}

,["void","CPString","CGRect"]), new objj_method(sel_getUid("drawConstraintsInRect:"), function $ConstraintView__drawConstraintsInRect_(self, _cmd, aRect)
{
    if (!self._showConstraints)
        return;
    ((___r1 = self.isa.objj_msgSend0(self, "constraints")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "enumerateObjectsUsingBlock:",     function(aConstraint, idx, stop)
    {
        var type = (aConstraint == null ? null : aConstraint.isa.objj_msgSend0(aConstraint, "_constraintType")),
            path,
            color;
        if (type == "Constraint" || type == "AutoresizingConstraint")
        {
            path = self.isa.objj_msgSend1(self, "pathForConstraint:", aConstraint);
            color = CPColor.isa.objj_msgSend0(CPColor, "blueColor");
        }        else if (type == "SizeConstraint")
        {
            path = self.isa.objj_msgSend1(self, "pathForContentSizeConstraint:", aConstraint);
            color = CPColor.isa.objj_msgSend0(CPColor, "purpleColor");
        }        if (self._selected && ((___r1 = self.selectedConstraintIndexes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "containsIndex:", idx)))
            color = CPColor.isa.objj_msgSend0(CPColor, "greenColor");
        (color == null ? null : color.isa.objj_msgSend0(color, "setStroke"));
        (path == null ? null : path.isa.objj_msgSend0(path, "stroke"));
        var ___r1;
    }));
    var ___r1;
}

,["void","CGRect"]), new objj_method(sel_getUid("intrinsicContentSize"), function $ConstraintView__intrinsicContentSize(self, _cmd)
{
    if (self.m_intrinsicContentSize)
        return self.m_intrinsicContentSize;
    return CGSizeMake(-1, -1);
}

,["CGSize"]), new objj_method(sel_getUid("horizontalContentHuggingPriority"), function $ConstraintView__horizontalContentHuggingPriority(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "contentHuggingPriorityForOrientation:", CPLayoutConstraintOrientationHorizontal);
}

,["float"]), new objj_method(sel_getUid("setHorizontalContentHuggingPriority:"), function $ConstraintView__setHorizontalContentHuggingPriority_(self, _cmd, aPriority)
{
    self.isa.objj_msgSend2(self, "setContentHuggingPriority:forOrientation:", aPriority, CPLayoutConstraintOrientationHorizontal);
    self.isa.objj_msgSend0(self, "invalidateIntrinsicContentSize");
}

,["void","float"]), new objj_method(sel_getUid("verticalContentHuggingPriority"), function $ConstraintView__verticalContentHuggingPriority(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "contentHuggingPriorityForOrientation:", CPLayoutConstraintOrientationVertical);
}

,["float"]), new objj_method(sel_getUid("setVerticalContentHuggingPriority:"), function $ConstraintView__setVerticalContentHuggingPriority_(self, _cmd, aPriority)
{
    self.isa.objj_msgSend2(self, "setContentHuggingPriority:forOrientation:", aPriority, CPLayoutConstraintOrientationVertical);
    self.isa.objj_msgSend0(self, "invalidateIntrinsicContentSize");
}

,["void","float"]), new objj_method(sel_getUid("horizontalContentCompressionResistancePriority"), function $ConstraintView__horizontalContentCompressionResistancePriority(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "contentCompressionResistancePriorityForOrientation:", CPLayoutConstraintOrientationHorizontal);
}

,["float"]), new objj_method(sel_getUid("setHorizontalContentCompressionResistancePriority:"), function $ConstraintView__setHorizontalContentCompressionResistancePriority_(self, _cmd, aPriority)
{
    self.isa.objj_msgSend2(self, "setContentCompressionResistancePriority:forOrientation:", aPriority, CPLayoutConstraintOrientationHorizontal);
    self.isa.objj_msgSend0(self, "invalidateIntrinsicContentSize");
}

,["void","float"]), new objj_method(sel_getUid("verticalContentCompressionResistancePriority"), function $ConstraintView__verticalContentCompressionResistancePriority(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "contentCompressionResistancePriorityForOrientation:", CPLayoutConstraintOrientationVertical);
}

,["float"]), new objj_method(sel_getUid("setVerticalContentCompressionResistancePriority:"), function $ConstraintView__setVerticalContentCompressionResistancePriority_(self, _cmd, aPriority)
{
    self.isa.objj_msgSend2(self, "setContentCompressionResistancePriority:forOrientation:", aPriority, CPLayoutConstraintOrientationVertical);
    self.isa.objj_msgSend0(self, "invalidateIntrinsicContentSize");
}

,["void","float"]), new objj_method(sel_getUid("intrinsicContentWidth"), function $ConstraintView__intrinsicContentWidth(self, _cmd)
{
    return self.m_intrinsicContentSize.width;
}

,["float"]), new objj_method(sel_getUid("setIntrinsicContentWidth:"), function $ConstraintView__setIntrinsicContentWidth_(self, _cmd, aWidth)
{
    self.m_intrinsicContentSize.width = aWidth;
    self.isa.objj_msgSend0(self, "invalidateIntrinsicContentSize");
}

,["void","float"]), new objj_method(sel_getUid("intrinsicContentHeight"), function $ConstraintView__intrinsicContentHeight(self, _cmd)
{
    return self.m_intrinsicContentSize.height;
}

,["float"]), new objj_method(sel_getUid("setIntrinsicContentHeight:"), function $ConstraintView__setIntrinsicContentHeight_(self, _cmd, aHeight)
{
    self.m_intrinsicContentSize.height = aHeight;
    self.isa.objj_msgSend0(self, "invalidateIntrinsicContentSize");
}

,["void","float"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("keyPathsForValuesAffectingConstraints"), function $ConstraintView__keyPathsForValuesAffectingConstraints(self, _cmd)
{
    return CPSet.isa.objj_msgSend(CPSet, "setWithObjects:", "intrinsicContentWidth", "intrinsicContentHeight", "horizontalContentHuggingPriority", "verticalContentHuggingPriority", "horizontalContentCompressionResistancePriority", "verticalContentCompressionResistancePriority");
}

,["CPSet"])]);
}
var LayoutConstraint = function(firstItem, firstAttr, relation, secondItem, secondAttr, multiplier, constant, priority)
{
    var constraint = CPLayoutConstraint.isa.objj_msgSend(CPLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", firstItem, firstAttr, relation, secondItem, secondAttr, multiplier, constant);
    (constraint == null ? null : constraint.isa.objj_msgSend1(constraint, "setPriority:", priority));
    return constraint;
};
p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
e;