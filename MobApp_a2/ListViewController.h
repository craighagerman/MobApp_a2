//
//  ListViewController.h
//  MobApp_a2
//
//  Created by Craig Hagerman on 1/27/14.
//  Copyright (c) 2014 ece1778. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Record.h"


@interface ListViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic)NSArray *theFetchedRecordsArray;

@end
