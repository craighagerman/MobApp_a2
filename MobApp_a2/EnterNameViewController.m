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

@property (nonatomic,strong)NSArray* fetchedRecordsArray;
@property (strong, nonatomic) IBOutlet UIPickerView *foodPicker;
@property (strong, nonatomic) NSArray *foodChoices;
@property NSInteger recordCount;

@end


@implementation EnterNameViewController

@synthesize nameTextfield, ageTextfield;
@synthesize currentID;


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
    
    self.recordCount = [self.fetchedRecordsArray count];
    
    // get a managedObjectContext to work with CoreData
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    self.foodChoices = @[@"Avacado", @"Broccoli", @"Donuts", @"Flounder", @"Haggis", @"Kumquat", @"McFlurry",  @"Pizza", @"Tortilla", @"Yakisoba", @"Zucchini"];
    
    // Specification/requirements didn't mention back buttons on this scene, so they are disabled
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
    // dismiss the keyboard when the user taps on any other area of the screen
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma non-generated code


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
    [self.view endEditing:YES];

}

- (IBAction)donePressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    if (([self.nameTextfield.text isEqualToString:@""]) || ([self.ageTextfield.text isEqualToString:@""])) {
        [self.view endEditing:YES];
    }
    else {
        [self addNameEntry:sender];
        [self.view endEditing:YES];
    }
}


- (IBAction)addNamePressed:(id)sender {
    [self addNameEntry:sender];
}



- (IBAction)addNameEntry:(id)sender
{
    /*  Add Entry to Data base
        Add all entries to Core Data, and then delete the new entries if 'Store' is not tapped on the initial scene.
        In this case, this is easier than passing messages or objects (say with NSNotification) or creating temp files.
    */
    Record * newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Record"
                                                      inManagedObjectContext:self.managedObjectContext];
    
    // Don't add an entry if the user has not entered a name and age
    if (!(([self.nameTextfield.text isEqualToString:@""]) || ([self.ageTextfield.text isEqualToString:@""]))) {
        newEntry.name = self.nameTextfield.text;
        newEntry.age =  self.ageTextfield.text;
        NSInteger row = [self.foodPicker selectedRowInComponent:0];
        newEntry.favoritefood = self.foodChoices[row];
 
        NSError *error;
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"Error, couldn't save: %@", [error localizedDescription]);
        }
        
        // Reset the textarea fields and pickerView to their initial state
        self.nameTextfield.text = @"";
        self.ageTextfield.text = @"";
        [self.foodPicker selectRow:0 inComponent:0 animated:YES];
    }
}



// Helper function since NSIntegers can't use operator increment.
- (NSInteger) increment: (NSInteger) nsInt
{
    int integer = (int)nsInt;
    integer += 1;
    NSInteger result = integer;
    
    return result;
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
