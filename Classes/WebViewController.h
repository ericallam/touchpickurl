//
//  WebViewController.h
//  PickURL
//
//  Created by eric on 8/29/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebViewController : UIViewController {
	IBOutlet UITextField *searchField;
	IBOutlet UILabel *urlLabel;
	IBOutlet UIView *bottomBarView;
	IBOutlet UIWebView *webView;
	IBOutlet UIButton *addButton;
	IBOutlet UIButton *forwardButton;
	IBOutlet UIButton *backButton;
	IBOutlet UIBarButtonItem *stopButton;
	IBOutlet UIActivityIndicatorView *loadingSpinny;
}

- (void)animateToolbarDown;
-(IBAction)dismass:(id)sender;
-(IBAction)close:(id)sender;

@end
