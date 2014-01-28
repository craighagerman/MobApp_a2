//
//  ViewController.m
//  MobApp_a2
//
//  Created by Craig Hagerman on 1/27/14.
//  Copyright (c) 2014 ece1778. All rights reserved.
//

#import "ViewController.h"
#import "EnterNameViewController.h"
#import "ListViewController.h"
#import "Record.h"
#import "AppDelegate.h"

@interface UIApplication(MyExtras)
- (void)terminateWithSuccess;
@end

@class EnterNameViewController;

@interface ViewController ()

@property (nonatomic,strong)NSArray* recordsArray;
@property BOOL saveNewEntries;
@property BOOL loadRecords;
@property int recordLength;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.saveNewEntries = NO;
    self.loadRecords = NO;
    
	// Do any additional setup after loading the view, typically from a nib.
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    // Fetching Records and saving it in "fetchedRecordsArray" object
    self.fetchedRecordsArray = [appDelegate getAllRecords];
    self.recordsArray = nil;
    self.recordLength = [self.fetchedRecordsArray count];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ListViewController"] && self.loadRecords) {
        ListViewController *lvc = segue.destinationViewController;
        
        AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
        lvc.theFetchedRecordsArray = [appDelegate getAllRecords];
    }
}





- (IBAction)enterPressed:(id)sender {
    self.saveNewEntries = NO;
}

- (IBAction)viewPressed:(id)sender {
    NSLog((@"view Pressed"));
}

- (IBAction)storePressed:(id)sender {
    self.saveNewEntries = YES;
    
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    NSArray *ra = [appDelegate getAllRecords];
    //NSArray *recordsNow = [appDelegate getAllRecords];
    self.recordLength = [ra count];

}


- (IBAction)loadPressed:(id)sender
{
    self.loadRecords = YES;
    self.recordsArray = self.fetchedRecordsArray;
}


- (IBAction)exitPressed:(id)sender {
    NSLog((@"Exit Pressed"));
    
    [self deleteRecentEntries];
    
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




-(void)deleteRecentEntries
{
    if (! self.saveNewEntries) {
        NSLog(@"Deleting recent entries");
        AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
        NSArray *ra = [appDelegate getAllRecords];
        NSArray *recordsNow = [appDelegate getAllRecords];
        
        for (int row = (int)[recordsNow count]-1; row > self.recordLength-1; row-- ) {
            Record *record = [ra objectAtIndex:row];
            [self.managedObjectContext deleteObject:record];
            [self.managedObjectContext save:nil];
        
        }
        /*
        // TO DELETE A ROW
     
        for (int row = _initialRecordLength; row>= _recordLength; row--) {
            
            
            
            NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
            // Configure the request's entity, and optionally its predicate.
            
            NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"id" ascending:YES];
            NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
            [fetchRequest setSortDescriptors:sortDescriptors];
            
            
            NSFetchedResultsController *controller = [[NSFetchedResultsController alloc]
                                                      initWithFetchRequest:fetchRequest
                                                      managedObjectContext:self.managedObjectContext
                                                      sectionNameKeyPath:nil
                                                      cacheName:@"fResults"];
            
     
            //[aContext deleteObject:aManagedObject];
            
            //NSManagedObject *managedObject = [controller objectAtIndex:indexPath.row];
            
            
            [self.managedObjectContext deleteObject:record];
            [self.managedObjectContext save:nil];
        }
        */
    
    }
 
}

@end
