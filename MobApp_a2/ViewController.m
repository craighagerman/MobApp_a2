//
//  ViewController.m
//  MobApp_a2
//
//  Created by Craig Hagerman on 1/27/14.
//  Copyright (c) 2014 ece1778. All rights reserved.
//

#import "ViewController.h"
#import "ListViewController.h"
#import "Record.h"
#import "AppDelegate.h"

@interface UIApplication(MyExtras)
- (void)terminateWithSuccess;
@end

@interface ViewController ()

@property (nonatomic,strong)NSArray* recordsArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    // Fetching Records and saving it in "fetchedRecordsArray" object
    self.fetchedRecordsArray = [appDelegate getAllRecords];
    self.recordsArray = nil;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ListViewController"]) {
        ListViewController *lvc = segue.destinationViewController;
        
        lvc.theFetchedRecordsArray = self.recordsArray;
    }
}





- (IBAction)enterPressed:(id)sender {
    NSLog((@"Enter Pressed"));
}

- (IBAction)viewPressed:(id)sender {
    NSLog((@"view Pressed"));
}

- (IBAction)storePressed:(id)sender {
    NSLog((@"store Pressed"));
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"storeNotification" object:nil];
    
    
    //[self addNameEntry:sender];
}

- (IBAction)loadPressed:(id)sender {
    NSLog((@"load Pressed"));
    
    self.recordsArray = self.fetchedRecordsArray;
    
    /*
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    // Fetching Records and saving it in "fetchedRecordsArray" object
    self.fetchedRecordsArray = [appDelegate getAllRecords];
    */
    
    
    // -----------------------
    NSLog(@"Core Data holds %lu entries", (unsigned long)[self.fetchedRecordsArray count]  );
    
    Record *record = [self.fetchedRecordsArray objectAtIndex:1];
    
    NSLog(@"Name: %@", [NSString stringWithFormat:@"%@", record.name] );
    NSLog(@"Age: %@", [NSString stringWithFormat:@"%@", record.age] );
    NSLog(@"Food: %@", [NSString stringWithFormat:@"%@", record.favoritefood] );
    NSLog(@" ------------------------ \n");
    
    
    int noOfEntries = (unsigned int)[self.fetchedRecordsArray count] - 1;
    for (int row = 0; row <= noOfEntries; row++) {    
        Record *record = [self.fetchedRecordsArray objectAtIndex:row];
        
        NSLog(@"Name: %@", [NSString stringWithFormat:@"%@", record.name] );
        NSLog(@"Age: %@", [NSString stringWithFormat:@"%@", record.age] );
        NSLog(@"Food: %@", [NSString stringWithFormat:@"%@", record.favoritefood] );
        NSLog(@" ------------------------ ");
    }
    // -----------------------
    

    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:self.fetchedRecordsArray
                                                         forKey:@"additionalData"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MyNotification"
                                                        object:nil
                                                      userInfo:userInfo];
    
    
}

- (IBAction)exitPressed:(id)sender {
    NSLog((@"Exit Pressed"));
    //exit(0);
    //
    [[UIApplication sharedApplication] terminateWithSuccess];
    
}


/*
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
 */





/*
 
 // TO DELETE A ROW
 
 -(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 NSManagedObject *managedObject = [self.fetchedResultsController objectAtIndexPath:indexPath];
 [self.managedObjectContext deleteObject:managedObject];
 [self.managedObjectContext save:nil];
 }
 }
 */


@end
