//
//  ViewController.m
//  MobApp_a2
//
//  Created by Craig Hagerman on 1/27/14.
//  Copyright (c) 2014 ece1778. All rights reserved.
//

#import "ViewController.h"

@interface UIApplication(MyExtras)
- (void)terminateWithSuccess;
@end

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)enterPressed:(id)sender {
    NSLog((@"Enter Pressed"));
}

- (IBAction)viewPressed:(id)sender {
    NSLog((@"view Pressed"));
}

- (IBAction)storePressed:(id)sender {
    NSLog((@"store Pressed"));
}

- (IBAction)loadPressed:(id)sender {
    NSLog((@"load Pressed"));
}

- (IBAction)exitPressed:(id)sender {
    NSLog((@"Exit Pressed"));
    //exit(0);
    //
    [[UIApplication sharedApplication] terminateWithSuccess];
    
}





- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
