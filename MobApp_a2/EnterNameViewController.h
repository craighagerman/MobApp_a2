//
//  EnterNameViewController.h
//  MobApp_a2
//
//  Created by Craig Hagerman on 1/27/14.
//  Copyright (c) 2014 ece1778. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Record.h"
#import "ViewController.h"

@interface EnterNameViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UITextField *nameTextfield;
@property (strong, nonatomic) IBOutlet UITextField *ageTextfield;
@property (strong, nonatomic) NSString *foodTextfield;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property int currentID;

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
- (IBAction)clickedBackground;
- (IBAction)donePressed:(id)sender;


@end
