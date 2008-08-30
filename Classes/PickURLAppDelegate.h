//
//  PickURLAppDelegate.h
//  PickURL
//
//  Created by eric on 8/29/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PickURLViewController;

@interface PickURLAppDelegate : NSObject <UIApplicationDelegate> {
	IBOutlet UIWindow *window;
	IBOutlet PickURLViewController *viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) PickURLViewController *viewController;

@end

