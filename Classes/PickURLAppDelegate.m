//
//  PickURLAppDelegate.m
//  PickURL
//
//  Created by eric on 8/29/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "PickURLAppDelegate.h"
#import "PickURLViewController.h"

@implementation PickURLAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {	
	
	// Override point for customization after app launch	
    [window addSubview:viewController.view];
	[window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
	[window release];
	[super dealloc];
}


@end
