//
//  WebViewController.m
//  PickURL
//
//  Created by eric on 8/29/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "WebViewController.h"


@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		// Initialization code
	}
	return self;
}

-(IBAction)dismass:(id)sender
{
	NSLog(@"dismiss this controller");
	NSString *url = [[webView.request URL] absoluteString];
	[self.parentViewController setUrl:url];
	[self.parentViewController dismissModalViewControllerAnimated:YES];
}

-(IBAction)close:(id)sender
{
	[self.parentViewController dismissModalViewControllerAnimated:YES];
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
 	NSString *methodName = NSStringFromSelector(aSelector);
 	NSLog(@"WebViewController respondsToSelector:%@", methodName);
 	return [super respondsToSelector:aSelector];
}

#pragma mark UITextFieldDelegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)aTextField
{
	NSLog(@"textFieldShouldReturn: %@", [aTextField text]);	
	stopButton.enabled = YES;
	// create a request and load the webview
	NSURL *url = [NSURL URLWithString:
				  [NSString stringWithFormat:@"http://www.google.com/search?hl=en&q=%@&btnG=Google+Search&aq=f&oq=", 
				   [aTextField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
	
	NSLog(@"URL THATS GOING TO LOAD: %@", url);
	
	NSURLRequest *searchRequest = [NSURLRequest requestWithURL:url];
	[webView loadRequest:searchRequest];
	
	[aTextField resignFirstResponder];
	return YES;
	
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)aTextField
{
	//need to animate the toolbar up
	CGPoint newPoint = CGPointMake(160.0, 222.0);
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
	bottomBarView.center = newPoint;
	[UIView commitAnimations];
	return YES;
}

- (void)animateToolbarDown
{
	CGPoint newPoint = CGPointMake(160.0, 438.0);
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.20];
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
	bottomBarView.center = newPoint;
	[UIView commitAnimations];
}

- (BOOL) textFieldDidResignFirstResponder:(UITextField *)textField
{
	NSLog(@"textFieldDidResignFirstResponder:");
	
	[self animateToolbarDown];
	
	return YES;
}

#pragma mark UIWebViewDelegate methods

- (void)webViewDidStartLoad:(UIWebView *)aWebView
{
	addButton.enabled = YES;
	stopButton.enabled = YES;
	loadingSpinny.hidden = NO;
	[loadingSpinny startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)aWebView
{
	if(aWebView.canGoBack){
		backButton.enabled = YES;
	}
	
	if(aWebView.canGoForward){
		forwardButton.enabled = YES;
	}
	
	if(!aWebView.loading){
		stopButton.enabled = NO;
		[loadingSpinny stopAnimating];
		// update the label
		NSURLRequest *theRequest = aWebView.request;
		NSURL *theURL = theRequest.URL;
		urlLabel.text = [theURL absoluteString];
	}
}

- (void)webView:(UIWebView *)aWebView didFailLoadWithError:(NSError *)error
{
	[loadingSpinny stopAnimating];
	
	NSLog(@"there was an error loading the request: %@", error);
	
	UIAlertView *alert;
	if(error.code == -1009){
		alert = [[[UIAlertView alloc] initWithTitle:@"Connection error"
		 								message:@"Twitfire could not load the page because you do not have a connection"
		 								delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];	
		[alert show];
	}
	
	
}

/*
 Implement loadView if you want to create a view hierarchy programmatically
- (void)loadView {
}
 */

/*
 If you need to do additional setup after loading the view, override viewDidLoad.*/
- (void)viewDidLoad {
	stopButton.enabled = NO;
	addButton.enabled = NO;
	forwardButton.enabled = NO;
	backButton.enabled = NO;
	searchField.clearButtonMode = UITextFieldViewModeWhileEditing;
	[searchField becomeFirstResponder];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[super dealloc];
}


@end
