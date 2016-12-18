@STATIC;1.0;p;15;AppController.jt;52365;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;52297;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);CPLogRegister(CPLogConsole);

{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("stackView", "StackView"), new objj_ivar("theWindow", "CPWindow"), new objj_ivar("priorities", "CPArray")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
    self.theWindow = ((___r1 = (CPWindow.isa.method_msgSend["alloc"] || _objj_forward)(CPWindow, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithContentRect:styleMask:"] || _objj_forward)(___r1, "initWithContentRect:styleMask:", CGRectMake(50, 50, 1400, 400), CPResizableWindowMask | CPTitledWindowMask));
    var contentView = ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["contentView"] || _objj_forward)(___r1, "contentView"));
    (contentView == null ? null : (contentView.isa.method_msgSend["setIdentifier:"] || _objj_forward)(contentView, "setIdentifier:", "ContentView"));
    (contentView == null ? null : (contentView.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(contentView, "setTranslatesAutoresizingMaskIntoConstraints:", YES));
    self.priorities = (___r1 = (CPArray.isa.method_msgSend["alloc"] || _objj_forward)(CPArray, "alloc"), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithObjects:count:"] || _objj_forward)(___r1, "initWithObjects:count:", [(___r2 = (CPDictionary.isa.method_msgSend["alloc"] || _objj_forward)(CPDictionary, "alloc"), ___r2 == null ? null : (___r2.isa.method_msgSend["initWithObjects:forKeys:"] || _objj_forward)(___r2, "initWithObjects:forKeys:", ["Required", CPLayoutPriorityRequired], ["label", "value"])), (___r2 = (CPDictionary.isa.method_msgSend["alloc"] || _objj_forward)(CPDictionary, "alloc"), ___r2 == null ? null : (___r2.isa.method_msgSend["initWithObjects:forKeys:"] || _objj_forward)(___r2, "initWithObjects:forKeys:", ["High", CPLayoutPriorityDefaultHigh], ["label", "value"])), (___r2 = (CPDictionary.isa.method_msgSend["alloc"] || _objj_forward)(CPDictionary, "alloc"), ___r2 == null ? null : (___r2.isa.method_msgSend["initWithObjects:forKeys:"] || _objj_forward)(___r2, "initWithObjects:forKeys:", ["Low", CPLayoutPriorityDefaultLow], ["label", "value"]))], 3));
    var segmented = ((___r1 = (CPSegmentedControl.isa.method_msgSend["alloc"] || _objj_forward)(CPSegmentedControl, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(20, 10, 200, 32)));
    (segmented == null ? null : (segmented.isa.method_msgSend["setSegmentCount:"] || _objj_forward)(segmented, "setSegmentCount:", 6));
    (segmented == null ? null : (segmented.isa.method_msgSend["setLabel:forSegment:"] || _objj_forward)(segmented, "setLabel:forSegment:", "Gravity Areas", 0));
    (segmented == null ? null : (segmented.isa.method_msgSend["setLabel:forSegment:"] || _objj_forward)(segmented, "setLabel:forSegment:", "Fill", 1));
    (segmented == null ? null : (segmented.isa.method_msgSend["setLabel:forSegment:"] || _objj_forward)(segmented, "setLabel:forSegment:", "Fill Equally", 2));
    (segmented == null ? null : (segmented.isa.method_msgSend["setLabel:forSegment:"] || _objj_forward)(segmented, "setLabel:forSegment:", "Fill Proportionally", 3));
    (segmented == null ? null : (segmented.isa.method_msgSend["setLabel:forSegment:"] || _objj_forward)(segmented, "setLabel:forSegment:", "Equal Spacing", 4));
    (segmented == null ? null : (segmented.isa.method_msgSend["setLabel:forSegment:"] || _objj_forward)(segmented, "setLabel:forSegment:", "Equal Centering", 5));
    (segmented == null ? null : (segmented.isa.method_msgSend["setTarget:"] || _objj_forward)(segmented, "setTarget:", self));
    (segmented == null ? null : (segmented.isa.method_msgSend["setAction:"] || _objj_forward)(segmented, "setAction:", sel_getUid("distribute:")));
    (segmented == null ? null : (segmented.isa.method_msgSend["setSelectedSegment:"] || _objj_forward)(segmented, "setSelectedSegment:", 1));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", segmented));
    var segmentedOrientation = ((___r1 = (CPSegmentedControl.isa.method_msgSend["alloc"] || _objj_forward)(CPSegmentedControl, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(CGRectGetMaxX((segmented == null ? null : (segmented.isa.method_msgSend["frame"] || _objj_forward)(segmented, "frame"))) + 10, 10, 200, 32)));
    (segmentedOrientation == null ? null : (segmentedOrientation.isa.method_msgSend["setSegmentCount:"] || _objj_forward)(segmentedOrientation, "setSegmentCount:", 2));
    (segmentedOrientation == null ? null : (segmentedOrientation.isa.method_msgSend["setLabel:forSegment:"] || _objj_forward)(segmentedOrientation, "setLabel:forSegment:", "Horizontal", 0));
    (segmentedOrientation == null ? null : (segmentedOrientation.isa.method_msgSend["setLabel:forSegment:"] || _objj_forward)(segmentedOrientation, "setLabel:forSegment:", "Vertical", 1));
    (segmentedOrientation == null ? null : (segmentedOrientation.isa.method_msgSend["setTarget:"] || _objj_forward)(segmentedOrientation, "setTarget:", self));
    (segmentedOrientation == null ? null : (segmentedOrientation.isa.method_msgSend["setAction:"] || _objj_forward)(segmentedOrientation, "setAction:", sel_getUid("orientate:")));
    (segmentedOrientation == null ? null : (segmentedOrientation.isa.method_msgSend["setSelectedSegment:"] || _objj_forward)(segmentedOrientation, "setSelectedSegment:", 0));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", segmentedOrientation));
    var slider = ((___r1 = (CPSlider.isa.method_msgSend["alloc"] || _objj_forward)(CPSlider, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMake(CGRectGetMaxX((segmentedOrientation == null ? null : (segmentedOrientation.isa.method_msgSend["frame"] || _objj_forward)(segmentedOrientation, "frame"))) + 10, 10, 100, 32)));
    (slider == null ? null : (slider.isa.method_msgSend["setMinValue:"] || _objj_forward)(slider, "setMinValue:", 0));
    (slider == null ? null : (slider.isa.method_msgSend["setMaxValue:"] || _objj_forward)(slider, "setMaxValue:", 50));
    (slider == null ? null : (slider.isa.method_msgSend["setDoubleValue:"] || _objj_forward)(slider, "setDoubleValue:", ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["spacing"] || _objj_forward)(___r1, "spacing"))));
    (slider == null ? null : (slider.isa.method_msgSend["setContinuous:"] || _objj_forward)(slider, "setContinuous:", NO));
    (slider == null ? null : (slider.isa.method_msgSend["setTarget:"] || _objj_forward)(slider, "setTarget:", self));
    (slider == null ? null : (slider.isa.method_msgSend["setAction:"] || _objj_forward)(slider, "setAction:", sel_getUid("setSpacing:")));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", slider));
    var spaceLabel = (CPTextField.isa.method_msgSend["labelWithTitle:"] || _objj_forward)(CPTextField, "labelWithTitle:", "spacing");
    (spaceLabel == null ? null : (spaceLabel.isa.method_msgSend["setFont:"] || _objj_forward)(spaceLabel, "setFont:", (CPFont.isa.method_msgSend["systemFontOfSize:"] || _objj_forward)(CPFont, "systemFontOfSize:", 10)));
    var f = (slider == null ? null : (slider.isa.method_msgSend["frame"] || _objj_forward)(slider, "frame"));
    f.origin.y = f.origin.y - 5;
    (spaceLabel == null ? null : (spaceLabel.isa.method_msgSend["setFrame:"] || _objj_forward)(spaceLabel, "setFrame:", f));
    (spaceLabel == null ? null : (spaceLabel.isa.method_msgSend["sizeToFit"] || _objj_forward)(spaceLabel, "sizeToFit"));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", spaceLabel));
    var prioritiesController = (CPArrayController.isa.method_msgSend["new"] || _objj_forward)(CPArrayController, "new");
    (prioritiesController == null ? null : (prioritiesController.isa.method_msgSend["bind:toObject:withKeyPath:options:"] || _objj_forward)(prioritiesController, "bind:toObject:withKeyPath:options:", "contentArray", self, "priorities", nil));
    var huggingPopup = ((___r1 = (CPPopUpButton.isa.method_msgSend["alloc"] || _objj_forward)(CPPopUpButton, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMakeZero()));
    (huggingPopup == null ? null : (huggingPopup.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(huggingPopup, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    (huggingPopup == null ? null : (huggingPopup.isa.method_msgSend["addItemsWithTitles:"] || _objj_forward)(huggingPopup, "addItemsWithTitles:", ["Hugging Low", "Hugging 500", "Hugging High", "Hugging Required"]));
    (huggingPopup == null ? null : (huggingPopup.isa.method_msgSend["setTarget:"] || _objj_forward)(huggingPopup, "setTarget:", self));
    (huggingPopup == null ? null : (huggingPopup.isa.method_msgSend["setAction:"] || _objj_forward)(huggingPopup, "setAction:", sel_getUid("setHugging:")));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", huggingPopup));
    ((___r1 = ((___r2 = (huggingPopup == null ? null : (huggingPopup.isa.method_msgSend["topAnchor"] || _objj_forward)(huggingPopup, "topAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r2, "constraintEqualToAnchor:constant:", (segmented == null ? null : (segmented.isa.method_msgSend["bottomAnchor"] || _objj_forward)(segmented, "bottomAnchor")), 10))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    ((___r1 = ((___r2 = (huggingPopup == null ? null : (huggingPopup.isa.method_msgSend["leftAnchor"] || _objj_forward)(huggingPopup, "leftAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r2, "constraintEqualToAnchor:constant:", (segmented == null ? null : (segmented.isa.method_msgSend["leftAnchor"] || _objj_forward)(segmented, "leftAnchor")), 0))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    var huggingPopupV = ((___r1 = (CPPopUpButton.isa.method_msgSend["alloc"] || _objj_forward)(CPPopUpButton, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMakeZero()));
    (huggingPopupV == null ? null : (huggingPopupV.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(huggingPopupV, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    (huggingPopupV == null ? null : (huggingPopupV.isa.method_msgSend["addItemsWithTitles:"] || _objj_forward)(huggingPopupV, "addItemsWithTitles:", ["⤵︎ Hugging Low", "⤵︎ Hugging 500", "⤵︎ Hugging High", "⤵︎ Hugging Required"]));
    (huggingPopupV == null ? null : (huggingPopupV.isa.method_msgSend["setTarget:"] || _objj_forward)(huggingPopupV, "setTarget:", self));
    (huggingPopupV == null ? null : (huggingPopupV.isa.method_msgSend["setAction:"] || _objj_forward)(huggingPopupV, "setAction:", sel_getUid("setHuggingV:")));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", huggingPopupV));
    ((___r1 = ((___r2 = (huggingPopupV == null ? null : (huggingPopupV.isa.method_msgSend["topAnchor"] || _objj_forward)(huggingPopupV, "topAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r2, "constraintEqualToAnchor:constant:", (huggingPopup == null ? null : (huggingPopup.isa.method_msgSend["topAnchor"] || _objj_forward)(huggingPopup, "topAnchor")), 0))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    ((___r1 = ((___r2 = (huggingPopupV == null ? null : (huggingPopupV.isa.method_msgSend["leftAnchor"] || _objj_forward)(huggingPopupV, "leftAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r2, "constraintEqualToAnchor:constant:", (huggingPopup == null ? null : (huggingPopup.isa.method_msgSend["rightAnchor"] || _objj_forward)(huggingPopup, "rightAnchor")), 10))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    var clippingPopup = ((___r1 = (CPPopUpButton.isa.method_msgSend["alloc"] || _objj_forward)(CPPopUpButton, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMakeZero()));
    (clippingPopup == null ? null : (clippingPopup.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(clippingPopup, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    (clippingPopup == null ? null : (clippingPopup.isa.method_msgSend["addItemsWithTitles:"] || _objj_forward)(clippingPopup, "addItemsWithTitles:", ["Clipping Low", "Clipping 500", "Clipping High", "Clipping Required"]));
    (clippingPopup == null ? null : (clippingPopup.isa.method_msgSend["setTarget:"] || _objj_forward)(clippingPopup, "setTarget:", self));
    (clippingPopup == null ? null : (clippingPopup.isa.method_msgSend["setAction:"] || _objj_forward)(clippingPopup, "setAction:", sel_getUid("setClipping:")));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", clippingPopup));
    ((___r1 = ((___r2 = (clippingPopup == null ? null : (clippingPopup.isa.method_msgSend["topAnchor"] || _objj_forward)(clippingPopup, "topAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r2, "constraintEqualToAnchor:constant:", (huggingPopupV == null ? null : (huggingPopupV.isa.method_msgSend["topAnchor"] || _objj_forward)(huggingPopupV, "topAnchor")), 0))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    ((___r1 = ((___r2 = (clippingPopup == null ? null : (clippingPopup.isa.method_msgSend["leftAnchor"] || _objj_forward)(clippingPopup, "leftAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r2, "constraintEqualToAnchor:constant:", (huggingPopupV == null ? null : (huggingPopupV.isa.method_msgSend["rightAnchor"] || _objj_forward)(huggingPopupV, "rightAnchor")), 10))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    var clippingPopupV = ((___r1 = (CPPopUpButton.isa.method_msgSend["alloc"] || _objj_forward)(CPPopUpButton, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMakeZero()));
    (clippingPopupV == null ? null : (clippingPopupV.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(clippingPopupV, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    (clippingPopupV == null ? null : (clippingPopupV.isa.method_msgSend["addItemsWithTitles:"] || _objj_forward)(clippingPopupV, "addItemsWithTitles:", ["⤵︎ Clipping Low", "⤵︎ Clipping 500", "⤵︎ Clipping High", "⤵︎ Clipping Required"]));
    (clippingPopupV == null ? null : (clippingPopupV.isa.method_msgSend["setTarget:"] || _objj_forward)(clippingPopupV, "setTarget:", self));
    (clippingPopupV == null ? null : (clippingPopupV.isa.method_msgSend["setAction:"] || _objj_forward)(clippingPopupV, "setAction:", sel_getUid("setClippingV:")));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", clippingPopupV));
    ((___r1 = ((___r2 = (clippingPopupV == null ? null : (clippingPopupV.isa.method_msgSend["topAnchor"] || _objj_forward)(clippingPopupV, "topAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r2, "constraintEqualToAnchor:constant:", (clippingPopup == null ? null : (clippingPopup.isa.method_msgSend["topAnchor"] || _objj_forward)(clippingPopup, "topAnchor")), 0))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    ((___r1 = ((___r2 = (clippingPopupV == null ? null : (clippingPopupV.isa.method_msgSend["leftAnchor"] || _objj_forward)(clippingPopupV, "leftAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r2, "constraintEqualToAnchor:constant:", (clippingPopup == null ? null : (clippingPopup.isa.method_msgSend["rightAnchor"] || _objj_forward)(clippingPopup, "rightAnchor")), 10))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    var alignPopup = ((___r1 = (CPPopUpButton.isa.method_msgSend["alloc"] || _objj_forward)(CPPopUpButton, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMakeZero()));
    (alignPopup == null ? null : (alignPopup.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(alignPopup, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    (alignPopup == null ? null : (alignPopup.isa.method_msgSend["addItemsWithTitles:"] || _objj_forward)(alignPopup, "addItemsWithTitles:", ["top", "centerY", "bottom"]));
    (alignPopup == null ? null : (alignPopup.isa.method_msgSend["selectItemAtIndex:"] || _objj_forward)(alignPopup, "selectItemAtIndex:", 1));
    (alignPopup == null ? null : (alignPopup.isa.method_msgSend["setTarget:"] || _objj_forward)(alignPopup, "setTarget:", self));
    (alignPopup == null ? null : (alignPopup.isa.method_msgSend["setAction:"] || _objj_forward)(alignPopup, "setAction:", sel_getUid("setAlignment:")));
    (alignPopup == null ? null : (alignPopup.isa.method_msgSend["setTag:"] || _objj_forward)(alignPopup, "setTag:", 2));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", alignPopup));
    ((___r1 = ((___r2 = (alignPopup == null ? null : (alignPopup.isa.method_msgSend["topAnchor"] || _objj_forward)(alignPopup, "topAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r2, "constraintEqualToAnchor:constant:", (clippingPopupV == null ? null : (clippingPopupV.isa.method_msgSend["topAnchor"] || _objj_forward)(clippingPopupV, "topAnchor")), 0))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    ((___r1 = ((___r2 = (alignPopup == null ? null : (alignPopup.isa.method_msgSend["leftAnchor"] || _objj_forward)(alignPopup, "leftAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r2, "constraintEqualToAnchor:constant:", (clippingPopupV == null ? null : (clippingPopupV.isa.method_msgSend["rightAnchor"] || _objj_forward)(clippingPopupV, "rightAnchor")), 10))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    var testButton = ((___r1 = (CPButton.isa.method_msgSend["alloc"] || _objj_forward)(CPButton, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMakeZero()));
    (testButton == null ? null : (testButton.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(testButton, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    (testButton == null ? null : (testButton.isa.method_msgSend["setTitle:"] || _objj_forward)(testButton, "setTitle:", "Add View"));
    (testButton == null ? null : (testButton.isa.method_msgSend["setTarget:"] || _objj_forward)(testButton, "setTarget:", self));
    (testButton == null ? null : (testButton.isa.method_msgSend["setAction:"] || _objj_forward)(testButton, "setAction:", sel_getUid("test:")));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", testButton));
    ((___r1 = ((___r2 = (testButton == null ? null : (testButton.isa.method_msgSend["topAnchor"] || _objj_forward)(testButton, "topAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r2, "constraintEqualToAnchor:constant:", (huggingPopup == null ? null : (huggingPopup.isa.method_msgSend["bottomAnchor"] || _objj_forward)(huggingPopup, "bottomAnchor")), 10))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    ((___r1 = ((___r2 = (testButton == null ? null : (testButton.isa.method_msgSend["leftAnchor"] || _objj_forward)(testButton, "leftAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r2, "constraintEqualToAnchor:constant:", (segmented == null ? null : (segmented.isa.method_msgSend["leftAnchor"] || _objj_forward)(segmented, "leftAnchor")), 0))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    var testButton2 = ((___r1 = (CPButton.isa.method_msgSend["alloc"] || _objj_forward)(CPButton, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMakeZero()));
    (testButton2 == null ? null : (testButton2.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(testButton2, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    (testButton2 == null ? null : (testButton2.isa.method_msgSend["setTitle:"] || _objj_forward)(testButton2, "setTitle:", "Remove Last View"));
    (testButton2 == null ? null : (testButton2.isa.method_msgSend["setTarget:"] || _objj_forward)(testButton2, "setTarget:", self));
    (testButton2 == null ? null : (testButton2.isa.method_msgSend["setAction:"] || _objj_forward)(testButton2, "setAction:", sel_getUid("test2:")));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", testButton2));
    ((___r1 = ((___r2 = (testButton2 == null ? null : (testButton2.isa.method_msgSend["topAnchor"] || _objj_forward)(testButton2, "topAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r2, "constraintEqualToAnchor:constant:", (testButton == null ? null : (testButton.isa.method_msgSend["topAnchor"] || _objj_forward)(testButton, "topAnchor")), 0))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    ((___r1 = ((___r2 = (testButton2 == null ? null : (testButton2.isa.method_msgSend["leftAnchor"] || _objj_forward)(testButton2, "leftAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r2, "constraintEqualToAnchor:constant:", (testButton == null ? null : (testButton.isa.method_msgSend["rightAnchor"] || _objj_forward)(testButton, "rightAnchor")), 10))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    ((___r1 = ((___r2 = (testButton2 == null ? null : (testButton2.isa.method_msgSend["heightAnchor"] || _objj_forward)(testButton2, "heightAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintEqualToAnchor:"] || _objj_forward)(___r2, "constraintEqualToAnchor:", (testButton == null ? null : (testButton.isa.method_msgSend["heightAnchor"] || _objj_forward)(testButton, "heightAnchor"))))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    var gravityPopup = ((___r1 = (CPPopUpButton.isa.method_msgSend["alloc"] || _objj_forward)(CPPopUpButton, "alloc")), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithFrame:"] || _objj_forward)(___r1, "initWithFrame:", CGRectMakeZero()));
    (gravityPopup == null ? null : (gravityPopup.isa.method_msgSend["setTranslatesAutoresizingMaskIntoConstraints:"] || _objj_forward)(gravityPopup, "setTranslatesAutoresizingMaskIntoConstraints:", NO));
    (gravityPopup == null ? null : (gravityPopup.isa.method_msgSend["addItemsWithTitles:"] || _objj_forward)(gravityPopup, "addItemsWithTitles:", ["in gravity Leading", "in gravity Center", "in gravity Trailing"]));
    (gravityPopup == null ? null : (gravityPopup.isa.method_msgSend["selectItemAtIndex:"] || _objj_forward)(gravityPopup, "selectItemAtIndex:", 0));
    (gravityPopup == null ? null : (gravityPopup.isa.method_msgSend["setTag:"] || _objj_forward)(gravityPopup, "setTag:", 3));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", gravityPopup));
    ((___r1 = ((___r2 = (gravityPopup == null ? null : (gravityPopup.isa.method_msgSend["topAnchor"] || _objj_forward)(gravityPopup, "topAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r2, "constraintEqualToAnchor:constant:", (testButton2 == null ? null : (testButton2.isa.method_msgSend["topAnchor"] || _objj_forward)(testButton2, "topAnchor")), 0))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    ((___r1 = ((___r2 = (gravityPopup == null ? null : (gravityPopup.isa.method_msgSend["leftAnchor"] || _objj_forward)(gravityPopup, "leftAnchor"))), ___r2 == null ? null : (___r2.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r2, "constraintEqualToAnchor:constant:", (testButton2 == null ? null : (testButton2.isa.method_msgSend["rightAnchor"] || _objj_forward)(testButton2, "rightAnchor")), 10))), ___r1 == null ? null : (___r1.isa.method_msgSend["setActive:"] || _objj_forward)(___r1, "setActive:", YES));
    var views = (___r1 = (CPArray.isa.method_msgSend["alloc"] || _objj_forward)(CPArray, "alloc"), ___r1 == null ? null : (___r1.isa.method_msgSend["init"] || _objj_forward)(___r1, "init")),
        i = 0,
        p = 253;
    for (; i < 3; i++)
    {
        var view = ((___r1 = (ColorView == null ? null : (ColorView.isa.method_msgSend["alloc"] || _objj_forward)(ColorView, "alloc"))), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithInstrinsicSize:"] || _objj_forward)(___r1, "initWithInstrinsicSize:", CGSizeMake(50 * (i + 1), 200)));
        (view == null ? null : (view.isa.method_msgSend["setContentHuggingPriority:forOrientation:"] || _objj_forward)(view, "setContentHuggingPriority:forOrientation:", p - i, 0));
        (view == null ? null : (view.isa.method_msgSend["setContentHuggingPriority:forOrientation:"] || _objj_forward)(view, "setContentHuggingPriority:forOrientation:", p - i, 1));
        (view == null ? null : (view.isa.method_msgSend["setIdentifier:"] || _objj_forward)(view, "setIdentifier:", "View_" + CPStackViewGravityLeading + "_" + i));
        (views == null ? null : (views.isa.method_msgSend["addObject:"] || _objj_forward)(views, "addObject:", view));
    }
    self.stackView = (StackView == null ? null : (StackView.isa.method_msgSend["stackViewWithViews:"] || _objj_forward)(StackView, "stackViewWithViews:", views));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setAlignment:"] || _objj_forward)(___r1, "setAlignment:", CPLayoutAttributeCenterY));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setDistribution:"] || _objj_forward)(___r1, "setDistribution:", CPStackViewDistributionFill));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setEdgeInsets:"] || _objj_forward)(___r1, "setEdgeInsets:", CGInsetMake(10, 10, 10, 10)));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setHuggingPriority:forOrientation:"] || _objj_forward)(___r1, "setHuggingPriority:forOrientation:", 250, 0));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setHuggingPriority:forOrientation:"] || _objj_forward)(___r1, "setHuggingPriority:forOrientation:", 250, 1));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setClippingResistancePriority:forOrientation:"] || _objj_forward)(___r1, "setClippingResistancePriority:forOrientation:", 250, 0));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setClippingResistancePriority:forOrientation:"] || _objj_forward)(___r1, "setClippingResistancePriority:forOrientation:", 250, 1));
    (contentView == null ? null : (contentView.isa.method_msgSend["addSubview:"] || _objj_forward)(contentView, "addSubview:", self.stackView));
    var stack1 = ((___r1 = ((___r2 = self.stackView), ___r2 == null ? null : (___r2.isa.method_msgSend["leftAnchor"] || _objj_forward)(___r2, "leftAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (contentView == null ? null : (contentView.isa.method_msgSend["leftAnchor"] || _objj_forward)(contentView, "leftAnchor")), 100)),
        stack2 = ((___r1 = ((___r2 = self.stackView), ___r2 == null ? null : (___r2.isa.method_msgSend["topAnchor"] || _objj_forward)(___r2, "topAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (contentView == null ? null : (contentView.isa.method_msgSend["topAnchor"] || _objj_forward)(contentView, "topAnchor")), 150)),
        stack3 = ((___r1 = ((___r2 = self.stackView), ___r2 == null ? null : (___r2.isa.method_msgSend["rightAnchor"] || _objj_forward)(___r2, "rightAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (contentView == null ? null : (contentView.isa.method_msgSend["rightAnchor"] || _objj_forward)(contentView, "rightAnchor")), -100)),
        stack4 = ((___r1 = ((___r2 = self.stackView), ___r2 == null ? null : (___r2.isa.method_msgSend["bottomAnchor"] || _objj_forward)(___r2, "bottomAnchor"))), ___r1 == null ? null : (___r1.isa.method_msgSend["constraintEqualToAnchor:constant:"] || _objj_forward)(___r1, "constraintEqualToAnchor:constant:", (contentView == null ? null : (contentView.isa.method_msgSend["bottomAnchor"] || _objj_forward)(contentView, "bottomAnchor")), -100));
    (CPLayoutConstraint.isa.method_msgSend["activateConstraints:"] || _objj_forward)(CPLayoutConstraint, "activateConstraints:", [stack1, stack2, stack3, stack4]);
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["orderFront:"] || _objj_forward)(___r1, "orderFront:", self));
    var ___r1, ___r2;
}

,["void","CPNotification"]), new objj_method(sel_getUid("setAlignment:"), function $AppController__setAlignment_(self, _cmd, sender)
{
    var idx = (sender == null ? null : (sender.isa.method_msgSend["indexOfSelectedItem"] || _objj_forward)(sender, "indexOfSelectedItem")),
        orientation = ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["orientation"] || _objj_forward)(___r1, "orientation")),
        attr;
    switch(idx) {
        case 0:
            attr = orientation ? CPLayoutAttributeLeft : CPLayoutAttributeTop;
            break;
        case 1:
            attr = orientation ? CPLayoutAttributeCenterX : CPLayoutAttributeCenterY;
            break;
        case 2:
            attr = orientation ? CPLayoutAttributeRight : CPLayoutAttributeBottom;
            break;
default:
    }
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setAlignment:"] || _objj_forward)(___r1, "setAlignment:", attr));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(___r1, "setNeedsDisplay:", YES));
    var ___r1;
}

,["void","id"]), new objj_method(sel_getUid("test2:"), function $AppController__test2_(self, _cmd, sender)
{
    var gravity = ((___r1 = ((___r2 = ((___r3 = self.theWindow), ___r3 == null ? null : (___r3.isa.method_msgSend["contentView"] || _objj_forward)(___r3, "contentView"))), ___r2 == null ? null : (___r2.isa.method_msgSend["viewWithTag:"] || _objj_forward)(___r2, "viewWithTag:", 3))), ___r1 == null ? null : (___r1.isa.method_msgSend["indexOfSelectedItem"] || _objj_forward)(___r1, "indexOfSelectedItem")) + 1;
    var views = ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["viewsInGravity:"] || _objj_forward)(___r1, "viewsInGravity:", gravity));
    var lastView = (views == null ? null : (views.isa.method_msgSend["lastObject"] || _objj_forward)(views, "lastObject"));
    if (lastView !== nil)
    {
        ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["removeView:"] || _objj_forward)(___r1, "removeView:", lastView));
        ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
        ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(___r1, "setNeedsDisplay:", YES));
    }
    var ___r1, ___r2, ___r3;
}

,["void","id"]), new objj_method(sel_getUid("test:"), function $AppController__test_(self, _cmd, sender)
{
    var gravity = ((___r1 = ((___r2 = ((___r3 = self.theWindow), ___r3 == null ? null : (___r3.isa.method_msgSend["contentView"] || _objj_forward)(___r3, "contentView"))), ___r2 == null ? null : (___r2.isa.method_msgSend["viewWithTag:"] || _objj_forward)(___r2, "viewWithTag:", 3))), ___r1 == null ? null : (___r1.isa.method_msgSend["indexOfSelectedItem"] || _objj_forward)(___r1, "indexOfSelectedItem")) + 1;
    var n = ((___r1 = ((___r2 = self.stackView), ___r2 == null ? null : (___r2.isa.method_msgSend["viewsInGravity:"] || _objj_forward)(___r2, "viewsInGravity:", gravity))), ___r1 == null ? null : (___r1.isa.method_msgSend["count"] || _objj_forward)(___r1, "count"));
    var view = ((___r1 = (ColorView == null ? null : (ColorView.isa.method_msgSend["alloc"] || _objj_forward)(ColorView, "alloc"))), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithInstrinsicSize:"] || _objj_forward)(___r1, "initWithInstrinsicSize:", CGSizeMake(50 * (n + 1), 200)));
    (view == null ? null : (view.isa.method_msgSend["setOrientation:"] || _objj_forward)(view, "setOrientation:", ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["orientation"] || _objj_forward)(___r1, "orientation"))));
    (view == null ? null : (view.isa.method_msgSend["setContentHuggingPriority:forOrientation:"] || _objj_forward)(view, "setContentHuggingPriority:forOrientation:", 252 - n, 0));
    (view == null ? null : (view.isa.method_msgSend["setContentHuggingPriority:forOrientation:"] || _objj_forward)(view, "setContentHuggingPriority:forOrientation:", 252 - n, 1));
    (view == null ? null : (view.isa.method_msgSend["setIdentifier:"] || _objj_forward)(view, "setIdentifier:", "View_" + gravity + "_" + n));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["addView:inGravity:"] || _objj_forward)(___r1, "addView:inGravity:", view, gravity));
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(___r1, "setNeedsDisplay:", YES));
    var ___r1, ___r2, ___r3;
}

,["void","id"]), new objj_method(sel_getUid("setHugging:"), function $AppController__setHugging_(self, _cmd, sender)
{
    var p = ((sender == null ? null : (sender.isa.method_msgSend["indexOfSelectedItem"] || _objj_forward)(sender, "indexOfSelectedItem")) + 1) * 250;
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setHuggingPriority:forOrientation:"] || _objj_forward)(___r1, "setHuggingPriority:forOrientation:", p, ((___r2 = self.stackView), ___r2 == null ? null : (___r2.isa.method_msgSend["orientation"] || _objj_forward)(___r2, "orientation"))));
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(___r1, "setNeedsDisplay:", YES));
    var ___r1, ___r2;
}

,["void","id"]), new objj_method(sel_getUid("setHuggingV:"), function $AppController__setHuggingV_(self, _cmd, sender)
{
    var p = ((sender == null ? null : (sender.isa.method_msgSend["indexOfSelectedItem"] || _objj_forward)(sender, "indexOfSelectedItem")) + 1) * 250;
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setHuggingPriority:forOrientation:"] || _objj_forward)(___r1, "setHuggingPriority:forOrientation:", p, 1 - ((___r2 = self.stackView), ___r2 == null ? null : (___r2.isa.method_msgSend["orientation"] || _objj_forward)(___r2, "orientation"))));
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(___r1, "setNeedsDisplay:", YES));
    var ___r1, ___r2;
}

,["void","id"]), new objj_method(sel_getUid("setClipping:"), function $AppController__setClipping_(self, _cmd, sender)
{
    var p = ((sender == null ? null : (sender.isa.method_msgSend["indexOfSelectedItem"] || _objj_forward)(sender, "indexOfSelectedItem")) + 1) * 250;
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setClippingResistancePriority:forOrientation:"] || _objj_forward)(___r1, "setClippingResistancePriority:forOrientation:", p, ((___r2 = self.stackView), ___r2 == null ? null : (___r2.isa.method_msgSend["orientation"] || _objj_forward)(___r2, "orientation"))));
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(___r1, "setNeedsDisplay:", YES));
    var ___r1, ___r2;
}

,["void","id"]), new objj_method(sel_getUid("setClippingV:"), function $AppController__setClippingV_(self, _cmd, sender)
{
    var p = ((sender == null ? null : (sender.isa.method_msgSend["indexOfSelectedItem"] || _objj_forward)(sender, "indexOfSelectedItem")) + 1) * 250;
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setClippingResistancePriority:forOrientation:"] || _objj_forward)(___r1, "setClippingResistancePriority:forOrientation:", p, 1 - ((___r2 = self.stackView), ___r2 == null ? null : (___r2.isa.method_msgSend["orientation"] || _objj_forward)(___r2, "orientation"))));
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(___r1, "setNeedsDisplay:", YES));
    var ___r1, ___r2;
}

,["void","id"]), new objj_method(sel_getUid("distribute:"), function $AppController__distribute_(self, _cmd, sender)
{
    var d = (sender == null ? null : (sender.isa.method_msgSend["selectedSegment"] || _objj_forward)(sender, "selectedSegment")) - 1;
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setDistribution:"] || _objj_forward)(___r1, "setDistribution:", d));
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(___r1, "setNeedsDisplay:", YES));
    var ___r1;
}

,["void","id"]), new objj_method(sel_getUid("orientate:"), function $AppController__orientate_(self, _cmd, sender)
{
    var o = (sender == null ? null : (sender.isa.method_msgSend["selectedSegment"] || _objj_forward)(sender, "selectedSegment"));
    if (o == ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["orientation"] || _objj_forward)(___r1, "orientation")))
        return;
    var items = o ? (___r1 = (CPArray.isa.method_msgSend["alloc"] || _objj_forward)(CPArray, "alloc"), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithObjects:count:"] || _objj_forward)(___r1, "initWithObjects:count:", ["left", "centerX", "right"], 3)) : (___r1 = (CPArray.isa.method_msgSend["alloc"] || _objj_forward)(CPArray, "alloc"), ___r1 == null ? null : (___r1.isa.method_msgSend["initWithObjects:count:"] || _objj_forward)(___r1, "initWithObjects:count:", ["top", "centerY", "bottom"], 3));
    var alignPopup = ((___r1 = ((___r2 = self.theWindow), ___r2 == null ? null : (___r2.isa.method_msgSend["contentView"] || _objj_forward)(___r2, "contentView"))), ___r1 == null ? null : (___r1.isa.method_msgSend["viewWithTag:"] || _objj_forward)(___r1, "viewWithTag:", 2));
    (alignPopup == null ? null : (alignPopup.isa.method_msgSend["removeAllItems"] || _objj_forward)(alignPopup, "removeAllItems"));
    (alignPopup == null ? null : (alignPopup.isa.method_msgSend["addItemsWithTitles:"] || _objj_forward)(alignPopup, "addItemsWithTitles:", items));
    (alignPopup == null ? null : (alignPopup.isa.method_msgSend["selectItemAtIndex:"] || _objj_forward)(alignPopup, "selectItemAtIndex:", 1));
    (self.isa.method_msgSend["setAlignment:"] || _objj_forward)(self, "setAlignment:", alignPopup);
    ((___r1 = ((___r2 = self.stackView), ___r2 == null ? null : (___r2.isa.method_msgSend["views"] || _objj_forward)(___r2, "views"))), ___r1 == null ? null : (___r1.isa.method_msgSend["enumerateObjectsUsingBlock:"] || _objj_forward)(___r1, "enumerateObjectsUsingBlock:",     function(view, idx, stop)
    {
        (view == null ? null : (view.isa.method_msgSend["setOrientation:"] || _objj_forward)(view, "setOrientation:", o));
    }));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setOrientation:"] || _objj_forward)(___r1, "setOrientation:", o));
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(___r1, "setNeedsDisplay:", YES));
    var ___r1, ___r2;
}

,["void","id"]), new objj_method(sel_getUid("setSpacing:"), function $AppController__setSpacing_(self, _cmd, sender)
{
    var k = (sender == null ? null : (sender.isa.method_msgSend["intValue"] || _objj_forward)(sender, "intValue"));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setSpacing:"] || _objj_forward)(___r1, "setSpacing:", k));
    ((___r1 = self.theWindow), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsLayout"] || _objj_forward)(___r1, "setNeedsLayout"));
    ((___r1 = self.stackView), ___r1 == null ? null : (___r1.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(___r1, "setNeedsDisplay:", YES));
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
    self.color = (CPColor.isa.method_msgSend["randomLigthColor"] || _objj_forward)(CPColor, "randomLigthColor");
    self.intrinsicSize = aSize;
    self.orientation = 0;
    return self;
}

,["id","CGSize"]), new objj_method(sel_getUid("setOrientation:"), function $ColorView__setOrientation_(self, _cmd, ori)
{
    if (ori !== self.orientation)
    {
        self.orientation = ori;
        (self.isa.method_msgSend["invalidateIntrinsicContentSize"] || _objj_forward)(self, "invalidateIntrinsicContentSize");
        (self.isa.method_msgSend["setNeedsDisplay:"] || _objj_forward)(self, "setNeedsDisplay:", YES);
    }
}

,["void","CPInteger"]), new objj_method(sel_getUid("drawRect:"), function $ColorView__drawRect_(self, _cmd, aRect)
{
    var ctx = ((___r1 = (CPGraphicsContext.isa.method_msgSend["currentContext"] || _objj_forward)(CPGraphicsContext, "currentContext")), ___r1 == null ? null : (___r1.isa.method_msgSend["graphicsPort"] || _objj_forward)(___r1, "graphicsPort"));
    var intrinsicRect = (self.isa.method_msgSend["intrinsicRect"] || _objj_forward)(self, "intrinsicRect");
    ((___r1 = self.color), ___r1 == null ? null : (___r1.isa.method_msgSend["setFill"] || _objj_forward)(___r1, "setFill"));
    CGContextFillRect(ctx, (self.isa.method_msgSend["bounds"] || _objj_forward)(self, "bounds"));
    ((___r1 = (CPColor.isa.method_msgSend["colorWithWhite:alpha:"] || _objj_forward)(CPColor, "colorWithWhite:alpha:", 0.1, 0.15)), ___r1 == null ? null : (___r1.isa.method_msgSend["setFill"] || _objj_forward)(___r1, "setFill"));
    CGContextFillRect(ctx, intrinsicRect);
    var huggingPriority = (self.isa.method_msgSend["contentHuggingPriorityForOrientation:"] || _objj_forward)(self, "contentHuggingPriorityForOrientation:", self.orientation);
    var compressionPriority = (self.isa.method_msgSend["contentCompressionResistancePriorityForOrientation:"] || _objj_forward)(self, "contentCompressionResistancePriorityForOrientation:", self.orientation);
    (self.isa.method_msgSend["drawString:inBounds:"] || _objj_forward)(self, "drawString:inBounds:", "<" + compressionPriority + "> >" + huggingPriority + "<", intrinsicRect);
    var ___r1;
}

,["void","CGRect"]), new objj_method(sel_getUid("drawString:inBounds:"), function $ColorView__drawString_inBounds_(self, _cmd, aString, bounds)
{
    var ctx = ((___r1 = (CPGraphicsContext.isa.method_msgSend["currentContext"] || _objj_forward)(CPGraphicsContext, "currentContext")), ___r1 == null ? null : (___r1.isa.method_msgSend["graphicsPort"] || _objj_forward)(___r1, "graphicsPort"));
    ctx.font = ((___r1 = (CPFont.isa.method_msgSend["boldSystemFontOfSize:"] || _objj_forward)(CPFont, "boldSystemFontOfSize:", 12)), ___r1 == null ? null : (___r1.isa.method_msgSend["cssString"] || _objj_forward)(___r1, "cssString"));
    ((___r1 = (CPColor.isa.method_msgSend["whiteColor"] || _objj_forward)(CPColor, "whiteColor")), ___r1 == null ? null : (___r1.isa.method_msgSend["setFill"] || _objj_forward)(___r1, "setFill"));
    var metrics = ctx.measureText(aString);
    ctx.fillText(aString, (CGRectGetWidth(bounds) - metrics.width) / 2, CGRectGetHeight(bounds) / 2);
    var ___r1;
}

,["void","CPString","CGRect"]), new objj_method(sel_getUid("setIntrinsicSize:"), function $ColorView__setIntrinsicSize_(self, _cmd, aSize)
{
    self.intrinsicSize = aSize;
    (self.isa.method_msgSend["invalidateIntrinsicContentSize"] || _objj_forward)(self, "invalidateIntrinsicContentSize");
}

,["void","CGSize"]), new objj_method(sel_getUid("intrinsicRect"), function $ColorView__intrinsicRect(self, _cmd)
{
    var intrinsic = (self.isa.method_msgSend["intrinsicContentSize"] || _objj_forward)(self, "intrinsicContentSize");
    return CGRectMake(0, 0, intrinsic.width, intrinsic.height);
}

,["CGRect"]), new objj_method(sel_getUid("intrinsicContentSize"), function $ColorView__intrinsicContentSize(self, _cmd)
{
    return self.orientation ? CGSizeMake(self.intrinsicSize.height, self.intrinsicSize.width) : self.intrinsicSize;
}

,["CGSize"])]);
}

{var the_class = objj_allocateClassPair(CPStackView, "StackView"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("mouseDown:"), function $StackView__mouseDown_(self, _cmd, anEvent)
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
{
var the_class = objj_getClass("CPColor")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPColor\"");
var meta_class = the_class.isa;class_addMethods(meta_class, [new objj_method(sel_getUid("randomDarkColor"), function $CPColor__randomDarkColor(self, _cmd)
{
    return (CPColor.isa.method_msgSend["colorWithRed:green:blue:alpha:"] || _objj_forward)(CPColor, "colorWithRed:green:blue:alpha:", RAND() / 2, RAND() / 2, RAND() / 2, 1.0);
}

,["CPColor"]), new objj_method(sel_getUid("randomLigthColor"), function $CPColor__randomLigthColor(self, _cmd)
{
    return (CPColor.isa.method_msgSend["colorWithRed:green:blue:alpha:"] || _objj_forward)(CPColor, "colorWithRed:green:blue:alpha:", RAND() / 2 + 0.5, RAND() / 2 + 0.5, RAND() / 2 + 0.5, 1.0);
}

,["CPColor"])]);
}
p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
e;