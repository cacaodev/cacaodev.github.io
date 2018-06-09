@STATIC;1.0;p;15;AppController.jt;9320;@STATIC;1.0;I;15;AppKit/AppKit.jI;23;Foundation/Foundation.ji;9;CPTrace.jt;9240;objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("CPTrace.j", YES);CPLogRegister(CPLogConsole);

{var the_class = objj_allocateClassPair(CPView, "ColorView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("color", "CPColor")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("viewDidMoveToSuperview"), function $ColorView__viewDidMoveToSuperview(self, _cmd)
{
    self.isa.objj_msgSend1(self, "setColor:", CPColor.isa.objj_msgSend0(CPColor, "randomColor"));
}

,["void"]), new objj_method(sel_getUid("setColor:"), function $ColorView__setColor_(self, _cmd, aColor)
{
    self.color = aColor;
    self.isa.objj_msgSend1(self, "setNeedsDisplay:", YES);
}

,["void","CPColor"]), new objj_method(sel_getUid("drawRect:"), function $ColorView__drawRect_(self, _cmd, aRect)
{
    var ctx = ((___r1 = CPGraphicsContext.isa.objj_msgSend0(CPGraphicsContext, "currentContext")), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "graphicsPort"));
    ((___r1 = self.color), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "set"));
    CGContextFillRect(ctx, self.isa.objj_msgSend0(self, "bounds"));
    var ___r1;
}

,["void","CGRect"]), new objj_method(sel_getUid("mouseDown:"), function $ColorView__mouseDown_(self, _cmd, anEvent)
{
    if ((anEvent == null ? null : anEvent.isa.objj_msgSend0(anEvent, "type")) !== CPLeftMouseDown)
        return;
    CPLog.debug(((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "window")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "_layoutEngine"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "description")));
    var ___r1, ___r2;
}

,["void","CPEvent"])]);
}

{var the_class = objj_allocateClassPair(CPWindow, "AutosizeWindow"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_setFrame:display:animate:constrainWidth:constrainHeight:"), function $AutosizeWindow___setFrame_display_animate_constrainWidth_constrainHeight_(self, _cmd, aRect, display, animate, width, height)
{
    self.isa.objj_msgSend(self, "__setFrame:display:animate:constrainWidth:constrainHeight:", aRect, display, animate, width, height);
}

,["void","CGRect","BOOL","BOOL","BOOL","BOOL"]), new objj_method(sel_getUid("__setFrame:display:animate:constrainWidth:constrainHeight:"), function $AutosizeWindow____setFrame_display_animate_constrainWidth_constrainHeight_(self, _cmd, aRect, display, animate, width, height)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("AutosizeWindow").super_class }, "_setFrame:display:animate:constrainWidth:constrainHeight:", aRect, display, animate, width, height);
}

,["void","CGRect","BOOL","BOOL","BOOL","BOOL"])]);
}

{var the_class = objj_allocateClassPair(CPWindow, "AutolayoutWindow"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("_setFrame:display:animate:constrainWidth:constrainHeight:"), function $AutolayoutWindow___setFrame_display_animate_constrainWidth_constrainHeight_(self, _cmd, aRect, display, animate, width, height)
{
    self.isa.objj_msgSend(self, "__setFrame:display:animate:constrainWidth:constrainHeight:", aRect, display, animate, width, height);
}

,["void","CGRect","BOOL","BOOL","BOOL","BOOL"]), new objj_method(sel_getUid("__setFrame:display:animate:constrainWidth:constrainHeight:"), function $AutolayoutWindow____setFrame_display_animate_constrainWidth_constrainHeight_(self, _cmd, aRect, display, animate, width, height)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("AutolayoutWindow").super_class }, "_setFrame:display:animate:constrainWidth:constrainHeight:", aRect, display, animate, width, height);
}

,["void","CGRect","BOOL","BOOL","BOOL","BOOL"])]);
}

{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
    var theWindow = ((___r1 = CPWindow.isa.objj_msgSend0(CPWindow, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentRect:styleMask:", CGRectMakeZero(), CPBorderlessBridgeWindowMask)),
        contentView = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "contentView"));
    (theWindow == null ? null : theWindow.isa.objj_msgSend1(theWindow, "orderFront:", self));
    var autoSizeWindow = ((___r1 = AutosizeWindow.isa.objj_msgSend0(AutosizeWindow, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentRect:styleMask:", CGRectMake(0, 20, 600, 600), CPResizableWindowMask)),
        autosizeContentView = (autoSizeWindow == null ? null : autoSizeWindow.isa.objj_msgSend0(autoSizeWindow, "contentView"));
    (autoSizeWindow == null ? null : autoSizeWindow.isa.objj_msgSend1(autoSizeWindow, "setTitle:", "Autosize"));
    var constraintsWindow = ((___r1 = AutolayoutWindow.isa.objj_msgSend0(AutolayoutWindow, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithContentRect:styleMask:", CGRectMake(610, 20, 600, 600), CPResizableWindowMask)),
        constraintContentView = (constraintsWindow == null ? null : constraintsWindow.isa.objj_msgSend0(constraintsWindow, "contentView"));
    (constraintsWindow == null ? null : constraintsWindow.isa.objj_msgSend1(constraintsWindow, "setTitle:", "Autolayout"));
    (constraintContentView == null ? null : constraintContentView.isa.objj_msgSend1(constraintContentView, "setTranslatesAutoresizingMaskIntoConstraints:", YES));
    (constraintContentView == null ? null : constraintContentView.isa.objj_msgSend1(constraintContentView, "setIdentifier:", "ContentView"));
    var xmasks = [CPViewMaxXMargin, CPViewMinXMargin | CPViewMaxXMargin, CPViewMinXMargin],
        ymasks = [CPViewMaxYMargin, CPViewMinYMargin | CPViewMaxYMargin, CPViewMinYMargin],
        maxDepth = 2,
        num = 3;
    var autoSizeBlock =     function(num, rect, level, idx)
    {
        var xmask = xmasks[idx % num],
            ymask = ymasks[FLOOR(idx / num)];
        var mask = xmask | ymask | CPViewWidthSizable | CPViewHeightSizable;
        var view = ((___r1 = ColorView.isa.objj_msgSend0(ColorView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", rect));
        (view == null ? null : view.isa.objj_msgSend1(view, "setAutoresizingMask:", mask));
        (view == null ? null : view.isa.objj_msgSend1(view, "setIdentifier:", CPString.isa.objj_msgSend3(CPString, "stringWithFormat:", "view_%d_%d", maxDepth - level, idx)));
        return view;
        var ___r1;
    };
    var autoSizeSubviews = self.isa.objj_msgSend(self, "recursivelyAddNumViews:toSuperview:maxDepth:withBlock:", num, autosizeContentView, maxDepth, autoSizeBlock);
    var constraintSubviews = self.isa.objj_msgSend(self, "recursivelyAddNumViews:toSuperview:maxDepth:withBlock:", num, constraintContentView, maxDepth,     function(num, rect, level, idx)
    {
        var view = autoSizeBlock(num, rect, level, idx);
        return view;
    });
    (autoSizeWindow == null ? null : autoSizeWindow.isa.objj_msgSend1(autoSizeWindow, "orderFront:", self));
    (constraintsWindow == null ? null : constraintsWindow.isa.objj_msgSend1(constraintsWindow, "orderFront:", self));
    CPLog.debug("Autolayout is " + (constraintsWindow == null ? null : constraintsWindow.isa.objj_msgSend0(constraintsWindow, "isAutolayoutEnabled")));
    var avg = moving_averager(10),
        avg2 = moving_averager(10);
    CPTrace("AutolayoutWindow", "_setFrame:display:animate:constrainWidth:constrainHeight:",     function(receiver, selector, args, duration)
    {
        console.log("%c Autolayout: setFrame: = " + duration + "(ms), average(20) =" + avg(duration) + "(ms)", 'color:green; font-weight:bold');
    });
    CPTrace("AutosizeWindow", "_setFrame:display:animate:constrainWidth:constrainHeight:",     function(receiver, selector, args, duration)
    {
        console.log("%c Autosize: setFrame: = " + duration + " average(20) =" + avg2(duration) + "(ms)", 'color:gray; font-weight:bold');
    });
    var ___r1;
}

,["void","CPNotification"]), new objj_method(sel_getUid("recursivelyAddNumViews:toSuperview:maxDepth:withBlock:"), function $AppController__recursivelyAddNumViews_toSuperview_maxDepth_withBlock_(self, _cmd, num, aSuperview, maxDepth, aBlock)
{
    if (maxDepth == 0)
        return;
    var size = CGRectGetWidth((aSuperview == null ? null : aSuperview.isa.objj_msgSend0(aSuperview, "frame"))) / num;
    for (var i = 0; i < num * num; i++)
    {
        var x = i % num * size,
            y = FLOOR(i / num) * size,
            rect = CGRectMake(x, y, size, size);
        var subview = aBlock(num, rect, maxDepth, i);
        (aSuperview == null ? null : aSuperview.isa.objj_msgSend1(aSuperview, "addSubview:", subview));
        self.isa.objj_msgSend(self, "recursivelyAddNumViews:toSuperview:maxDepth:withBlock:", num, subview, maxDepth - 1, aBlock);
    }
}

,["void","CPInteger","CPView","int","Function"])]);
}
p;9;CPTrace.jt;7677;@STATIC;1.0;t;7658;var patchedClassesAndSelectors = [],
    globalStack = [],
    globalLevel = 0;
var Tracer = function()
{
    this.td = 0;
    this.tc = 0;
    this.displayFunction = nil;
};
Tracer.prototype.log = function()
{
    var c = globalStack.length;
    for (var i = 0; i < c; i++)
    {
        var trace = globalStack.shift();
        this.displayFunction(trace.receiver, trace.selector, trace.args, trace.duration, this.td, this.tc, trace.level);
    }};
var defaultDisplay = function(receiver, selector, args, duration, total_duration, total_count, level)
{
    var message = objj_message(receiver, selector, args),
        avg_message = level == 0 ? " , avg = " + ROUND(100 * total_duration / total_count) / 100 + " ms" : "";
    console.log(indent(level) + message + " in " + duration + " ms" + avg_message);
};
var indent = function(n)
{
    var str = "";
    while (n--)
        str += "  ";
    return str;
};
var objj_message = function(receiver, selector, args)
{
    var c = args.length,
        sel = selector.split(":"),
        rdesc = receiver ? (receiver == null ? null : receiver.isa.objj_msgSend0(receiver, "description")) : "<null>";
    while (c--)
        sel.splice(c + 1, 0, ":" + Description(args[c], c) + " ");
    var joined = sel.join("");
    if (args.length)
        joined = joined.substring(0, joined.length - 1);
    return "[" + rdesc + " " + joined + "]";
};
Description = function(object, argn)
{
    if (object.isa)
        return (object == null ? null : object.isa.objj_msgSend0(object, "description"));
    var type = typeof object;
    if (type === "function")
        return "Function";
    else if (type !== "object")
        return "Arg" + argn;
    var desc = [];
    for (var p in object)
        desc.push(p + ":" + object[p]);
    return "{" + desc.join(",") + "}";
}
CPTrace = function(aClassName, aSelector, displayFunction)
{
    var aclass = CPClassFromString(aClassName);
    if (aclass)
        _CPTraceClass(aclass, aSelector, displayFunction);
    else if (typeof objj_getClassList != 'undefined')
    {
        var classes = [],
            patchednum = 0,
            numclasses = objj_getClassList(classes, 400),
            regex = new RegExp(aClassName);
        while (numclasses--)
        {
            var cls = classes[numclasses];
            if (regex.test(cls))
            {
                console.log("Patching " + cls + " -" + aSelector);
                _CPTraceClass(cls, aSelector, displayFunction);
                patchednum++;
            }
        }
        if (patchednum == 0)
            console.log("Could not find any class matching '" + aClassName + "'");
        else
            console.log("Patched " + patchednum + " classes matching " + aClassName);
    }
    else
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, "Unknown class name '" + aClassName + "'");
}
var _CPTraceClass = function(aClass, aSelector, displayFunction)
{
    if (!(aClass == null ? null : aClass.isa.objj_msgSend1(aClass, "instancesRespondToSelector:", aSelector)))
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", CPInvalidArgumentException, aClass + " does not respond to '" + aSelector + "'");
    var superclass = aClass;
    while (!(superclass == null ? null : superclass.isa.objj_msgSend1(superclass, "instancesImplementsSelector:", aSelector)) && superclass != CPObject.isa.objj_msgSend0(CPObject, "class"))
        superclass = (superclass == null ? null : superclass.isa.objj_msgSend0(superclass, "superclass"));
    var patchUniqueString = superclass + "_" + aSelector;
    if ((patchedClassesAndSelectors == null ? null : patchedClassesAndSelectors.isa.objj_msgSend1(patchedClassesAndSelectors, "containsObject:", patchUniqueString)))
    {
        if (superclass == aClass)
            console.log(superclass + " -" + aSelector + " is already patched. Ignoring.");
        else
            console.log("-" + aSelector + " is implemented in a superclass of " + aClass + " (" + superclass + ") where it's already patched. Ignoring.");
        return;
    }    var patched_sel = CPSelectorFromString("patched_" + CPStringFromSelector(aSelector)),
        tracer = new Tracer();
    tracer.displayFunction = displayFunction ? displayFunction : defaultDisplay;
    class_addMethod(aClass, patched_sel,     function()
    {
        var orig_arguments = arguments,
            receiver = orig_arguments[0],
            selector = orig_arguments[1],
            args = [];
        for (var i = 2; i < orig_arguments.length; i++)
            args.push(orig_arguments[i]);
        orig_arguments[1] = patched_sel;
        var trace = {receiver: receiver, selector: selector, args: args, start: new Date(), level: globalLevel};
        globalStack.push(trace);
        globalLevel++;
        objj_msgSend.apply(objj_msgSend, orig_arguments);
        var duration = trace.duration = new Date() - trace.start;
        globalLevel--;
        if (globalLevel == 0)
        {
            if (duration > 0)
                tracer.tc++;
            tracer.td += trace.duration;
            tracer.log();
        }    }, "");
    Swizzle(aClass, aSelector, patched_sel);
    (patchedClassesAndSelectors == null ? null : patchedClassesAndSelectors.isa.objj_msgSend1(patchedClassesAndSelectors, "addObject:", patchUniqueString));
};
CPTraceStop = function(aClass, aSelector)
{
    var patchUniqueString = aClass + "_" + aSelector;
    if (!(patchedClassesAndSelectors == null ? null : patchedClassesAndSelectors.isa.objj_msgSend1(patchedClassesAndSelectors, "containsObject:", patchUniqueString)))
        return;
    var patched_sel = CPSelectorFromString("patched_" + CPStringFromSelector(aSelector));
    Swizzle(CPClassFromString(aClass), patched_sel, aSelector);
    (patchedClassesAndSelectors == null ? null : patchedClassesAndSelectors.isa.objj_msgSend1(patchedClassesAndSelectors, "removeObject:", patchUniqueString));
}
var Swizzle = function(aClass, orig_sel, new_sel)
{
    var origMethod = class_getInstanceMethod(aClass, orig_sel),
        newMethod = class_getInstanceMethod(aClass, new_sel);
    if (getMethodNoSuper(aClass, orig_sel) == NULL)
    {
        class_addMethod(aClass, orig_sel, method_getImplementation(newMethod), "");
        class_replaceMethod(aClass, new_sel, method_getImplementation(origMethod), "");
    }    else
        method_exchangeImplementations(origMethod, newMethod);
};
var getMethodNoSuper = function(cls, sel)
{
    var method_list = cls.method_list,
        count = method_list.length;
    while (count--)
    {
        var mthd = method_list[count];
        if (mthd.name == sel)
            return mthd;
    }    return NULL;
};
moving_averager = function(period)
{
    var nums = [];
    return     function(num)
    {
        nums.push(num);
        if (nums.length > period)
            nums.splice(0, 1);
        var sum = 0,
            count = nums.length;
        for (var i = 0; i < count; i++)
            sum += nums[i];
        var n = period;
        if (count < period)
            n = count;
        return sum / n;
    };
}
{
var the_class = objj_getClass("CPObject")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("instancesImplementsSelector:"), function $CPObject__instancesImplementsSelector_(self, _cmd, aSelector)
{
    var methods = class_copyMethodList(self),
        count = methods.length;
    while (count--)
        if (method_getName(methods[count]) === aSelector)
            return YES;
    return NO;
}

,["BOOL","SEL"])]);
}
p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
e;