//
//  ViewController.h
//  MobApp_a2
//
//  Created by Craig Hagerman on 1/27/14.
//  Copyright (c) 2014 ece1778. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic,strong)NSArray* fetchedRecordsArray;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property int initialRecordLength;

- (IBAction)enterPressed:(id)sender;
- (IBAction)viewPressed:(id)sender;
- (IBAction)storePressed:(id)sender;
- (IBAction)loadPressed:(id)sender;
- (IBAction)exitPressed:(id)sender;


@end
