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




- (IBAction)enterPressed:(id)sender {
    NSLog((@"Enter Pressed"));
}

- (IBAction)viewPressed:(id)sender {
    NSLog((@"view Pressed"));
}

- (IBAction)storePressed:(id)sender {
    NSLog((@"store Pressed"));
    [self addNameEntry:sender];
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


- (IBAction)addNameEntry:(id)sender
{
    // Add Entry to Data base
    Record * newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Record"
                                                      inManagedObjectContext:self.managedObjectContext];
    
    newEntry.name = self.nameTextfield.text;
    //newEntry.age =  [NSNumber numberWithInteger: [self.ageTextfield.text integerValue]];
    newEntry.age =  self.ageTextfield.text;
    NSInteger row = [self.foodPicker selectedRowInComponent:0];
    newEntry.favoritefood = self.foodChoices[row];
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Error, couldn't save: %@", [error localizedDescription]);
    }
    
    //self.foodTextfield.text = @"";
    //self.ageTextfield = @"";
    //self.foodChoices = @"";
    
    [self.view endEditing:YES];
    NSLog(@"New entry added to Core Data");
    
}



@end
