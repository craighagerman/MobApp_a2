//
//  EnterNameViewController.m
//  MobApp_a2
//
//  Created by Craig Hagerman on 1/27/14.
//  Copyright (c) 2014 ece1778. All rights reserved.
//

#import "EnterNameViewController.h"
#import "Record.h"
#import "AppDelegate.h"

@interface EnterNameViewController ()

@property (strong, nonatomic) IBOutlet UIPickerView *foodPicker;
@property (strong, nonatomic) NSArray *foodChoices;

@end


@implementation EnterNameViewController

@synthesize nameTextfield, ageTextfield;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    
    self.foodChoices = @[@"Avacado", @"Broccoli", @"Donuts", @"Flounder", @"Haggis", @"Kumquat", @"McFlurry",  @"Pizza", @"Tortilla", @"Yakisoba", @"Zucchini"];
    
    
    
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// ------------------------------------------------------------------


-(void)dismissKeyboard {
    [nameTextfield resignFirstResponder];
    [ageTextfield resignFirstResponder];
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction) clickedBackground
{
    [self.view endEditing:YES]; //make the view end editing!

}

- (IBAction)donePressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];

    [self addNameEntry:sender];
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



#pragma mark - 
#pragma mark picker data source methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.foodChoices count];
}

#pragma mark Picker delegate methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.foodChoices[row];
}


@end
