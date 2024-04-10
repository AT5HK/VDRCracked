/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end
*/
#import <UIKit/UIKit.h>

@interface VDRLibraryContentViewController: UIViewController


@end


static void appLockSetup() {
//    %log(@"hello from voiceDreamCracked");
   NSLog(@"hello from voiceDreamCracked");
}


%hook VDRLibraryContentViewController

//does not work for now
-(void)viewDidLoad {
	%log(@"called from viewDidLoad");
	%log;
	((VDRLibraryContentViewController*)self).view.backgroundColor = [UIColor orangeColor];
	%orig;
}

%end

%hook ViewController

//does not work for now
-(void)viewDidLoad {
	%log(@"called from viewDidLoad");
	%log;
	((VDRLibraryContentViewController*)self).view.backgroundColor = [UIColor orangeColor];
	%orig;
}

%end





 %ctor {
   appLockSetup();
   %init(
		VDRLibraryContentViewController = NSClassFromString(@"VoiceDreamReader.VDRLibraryContentViewController")
		// NSLog(@"print from ctor setup");
   );
 }
