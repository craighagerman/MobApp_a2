//
//  ListViewController.m
//  MobApp_a2
//
//  Created by Craig Hagerman on 1/27/14.
//  Copyright (c) 2014 ece1778. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@property(copy, nonatomic) NSArray *dwarves;

@end

@implementation ListViewController

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
    
    // Fetching Records and saving it in "fetchedRecordsArray" object
    self.fetchedRecordsArray = [appDelegate getAllRecords];
    [self.tableView reloadData];
    
    
    
    
    //self.dwarves = @[@"Sleepy", @"Grumpy", @"Bashful", @"Happy"];
    
    //UITableView *tableView = (id)[self.view viewWithTag:1];
    //UIEdgeInsets contentsInset = tableView.contentInset;
    //contentsInset.top = 20;
    //[tableView setContentInset:contentsInset];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [self.dwarves count];                    // hard-coded - delete
    return [self.fetchedRecordsArray count];        // coredata records
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"TableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:tableIdentifier];
    }
    
    Record * record = [self.fetchedRecordsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", record.name];
    
    //cell.textLabel.text = self.dwarves[indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@,  %@", record.age, record.favoritefood];
    return cell;
}





/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TableIdentifier";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Record * record = [self.fetchedRecordsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", record.name];
    
    //cell.textLabel.text = self.dwarves[indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@,  %@", record.age, record.favoritefood];
    return cell;
}
*/



/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    staticNSString *CellIdentifier = @"PhoneBookCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    
    
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    if(cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    Record * record = [self.fetchedRecordsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", record.name];
    
    //cell.textLabel.text = self.dwarves[indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@,  %@", record.age, record.favoritefood];
    return cell;
    
    
    
    
}
*/


@end
