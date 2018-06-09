@STATIC;1.0;p;15;AppController.jt;2191;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jt;2124;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);CPLogRegister(CPLogConsole);

{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("theWindow", "CPWindow"), new objj_ivar("urls", "CPArray")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("urls"), function $AppController__urls(self, _cmd)
{
    return self.urls;
}

,["CPArray"]), new objj_method(sel_getUid("setUrls:"), function $AppController__setUrls_(self, _cmd, newValue)
{
    self.urls = newValue;
}

,["void","CPArray"]), new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{
    self.isa.objj_msgSend1(self, "setUrls:", (___r1 = CPArray.isa.objj_msgSend0(CPArray, "alloc"), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithObjects:count:", [(___r2 = CPDictionary.isa.objj_msgSend0(CPDictionary, "alloc"), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "initWithObjects:forKeys:", ["Regular", "Resources/cappuccino.png"], ["name", "url"])), (___r2 = CPDictionary.isa.objj_msgSend0(CPDictionary, "alloc"), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "initWithObjects:forKeys:", ["Regular (same size)", "Resources/cappuccino2.png"], ["name", "url"])), (___r2 = CPDictionary.isa.objj_msgSend0(CPDictionary, "alloc"), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "initWithObjects:forKeys:", ["Small", "Resources/cappuccino-small.png"], ["name", "url"])), (___r2 = CPDictionary.isa.objj_msgSend0(CPDictionary, "alloc"), ___r2 == null ? null : ___r2.isa.objj_msgSend2(___r2, "initWithObjects:forKeys:", ["Big", "Resources/cappuccino-big.png"], ["name", "url"]))], 4)));
    var ___r1, ___r2;
}

,["void","CPNotification"]), new objj_method(sel_getUid("awakeFromCib"), function $AppController__awakeFromCib(self, _cmd)
{
    ((___r1 = self.theWindow), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFullPlatformWindow:", NO));
    var ___r1;
}

,["void"])]);
}
p;6;main.jt;292;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;206;objj_executeFile("Foundation/Foundation.j", NO);objj_executeFile("AppKit/AppKit.j", NO);objj_executeFile("AppController.j", YES);main = function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}
e;