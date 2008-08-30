//
//  PickURLViewController.h
//  PickURL
//
//  Created by eric on 8/29/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebViewController;

@interface PickURLViewController : UIViewController {
	IBOutlet UILabel *urlLabel;
	WebViewController *webController;
}

@property (nonatomic, retain) WebViewController *webController;

-(IBAction)pickURL:(id)sender;
-(void)setUrl:(NSString *)url;

@end

