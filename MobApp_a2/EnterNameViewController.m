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
@property (strong, nonatomic) NSArray *foodNames;

@end


@implementation EnterNameViewController

@synthesize name, age;


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
    
    self.foodNames = @[@"Avacado", @"Broccoli", @"Donuts", @"Flounder", @"Haggis", @"Kumquat", @"McFlurry",  @"Pizza", @"Tortilla", @"Yakisoba", @"Zucchini"];
    
    
    
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
    [name resignFirstResponder];
    [age resignFirstResponder];
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
    NSLog(@"Done Pressed");
    NSInteger row = [self.foodPicker selectedRowInComponent:0];
    NSString *selected = self.foodNames[row];

}



/*
- (IBAction)addPhoneBookEntry:(id)sender
{
    // Add Entry to PhoneBook Data base and reset all fields
    
    //  1
    Record * newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Record"
                                                      inManagedObjectContext:self.managedObjectContext];
    //  2
    newEntry.firstName = self.firstNameTextfield.text;
    newEntry.lastName = self.lastNameTextfield.text;
    newEntry.city = self.cityTextfield.text;
    //  3
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    //  4
    self.firstNameTextfield.text = @"";
    self.lastNameTextfield.text = @"";
    self.cityTextfield.text = @"";
    self.phoneNumber1.text = @"";
    self.phoneNumber2.text = @"";
    //  5
    [self.view endEditing:YES];
}
*/


#pragma mark - 
#pragma mark picker data source methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.foodNames count];
}

#pragma mark Picker delegate methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.foodNames[row];
}


@end
