//
//  PickURLAppDelegate.m
//  PickURL
//
//  Created by eric on 8/29/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "PickURLViewController.h"
#import "WebViewController.h"

@implementation PickURLViewController

@synthesize webController;

/*
 Implement loadView if you want to create a view hierarchy programmatically
- (void)loadView {
}
 */

/*
 Implement viewDidLoad if you need to do additional setup after loading the view.
- (void)viewDidLoad {
	[super viewDidLoad];
}
 */

-(void)setUrl:(NSString *)url
{
	// need to tiny url this bitch
	NSURL *isgdURL = [NSURL URLWithString:
					[NSString stringWithFormat:@"http://is.gd/api.php?longurl=%@", 
					[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
	
	NSLog(@"IS GD URL: %@", isgdURL);
	
	NSURLRequest *tinyRequest = [NSURLRequest requestWithURL:isgdURL];
	
	NSURLConnection *connection = [NSURLConnection connectionWithRequest:tinyRequest delegate:self];
}

-(IBAction)pickURL:(id)sender
{
	NSLog(@"PickURL:");
	// load the web view
	if(!self.webController){
		// does this need to be autoreleased?
		self.webController = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil];
	}
	
	[self presentModalViewController:self.webController animated:YES];
}

#pragma mark NSURLConnectionDelegate methods

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSLog(@"connectionDidFinishLoading: %@", connection);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	NSLog(@"connection: %@, didFailWithError: %@", connection, error);
}


-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	NSLog(@"didReceiveResponse: %@", response);
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)someData
{

   	NSString *reply = [[[NSString alloc] initWithData:someData encoding:NSUTF8StringEncoding] autorelease];
	urlLabel.text = reply;
	NSLog(@"GOT THE RESPONSE BISHES: %@", reply);
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
	[webController release];
	[super dealloc];
}

@end
