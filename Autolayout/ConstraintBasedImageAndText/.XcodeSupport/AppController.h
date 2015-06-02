#import <Cocoa/Cocoa.h>
#import "xcc_general_include.h"

@interface CustomView : NSView
@end

@interface AppController : NSObject

@property (assign) IBOutlet NSWindow* theWindow;
@property (assign) IBOutlet StackView* stackView;

- (IBAction)setPosition:(id)sender;

@end
