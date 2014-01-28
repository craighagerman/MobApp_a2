//
//  ListViewController.m
//  MobApp_a2
//
//  Created by Craig Hagerman on 1/27/14.
//  Copyright (c) 2014 ece1778. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

//@property(copy, nonatomic) NSArray *dwarves;
@property (nonatomic,strong)NSArray* fetchedRecordsArray;

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

    self.fetchedRecordsArray = self.theFetchedRecordsArray;
    
    
    //AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    // Fetching Records and saving it in "fetchedRecordsArray" object
    //self.fetchedRecordsArray = [appDelegate getAllRecords];
    
    /*
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(eventListenerDidReceiveNotification:)
                                                 name:@"MyNotification"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(printMsg:) name:@"storeNotification" object:nil];
    */
    
    
    
    
    [self.tableView reloadData];
    
    
    
    
    //self.dwarves = @[@"Sleepy", @"Grumpy", @"Bashful", @"Happy"];
    
    //UITableView *tableView = (id)[self.view viewWithTag:1];
    //UIEdgeInsets contentsInset = tableView.contentInset;
    //contentsInset.top = 20;
    //[tableView setContentInset:contentsInset];
    
}


-(void)printMsg:(NSNotificationCenter *)notif
{
    NSLog(@"**  Got notification from storeNotification");
}


// When the notification occurs, a message will be sent to the following method
- (void)eventListenerDidReceiveNotification:(NSNotification *)notif
{
    NSLog(@"MESSAGE:");
    if ([[notif name] isEqualToString:@"MyNotification"])
    {
        NSLog(@"Successfully received the notification!");
        
        NSDictionary *userInfo = notif.userInfo;
        self.fetchedRecordsArray = [userInfo objectForKey:@"additionalData"];
        
        // Your response to the notification should be placed here
        NSLog(@"  Got it!");
        
        [self.tableView reloadData];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.fetchedRecordsArray count];
    
    
    //return [self.dwarves count];                    // hard-coded - delete
    /*
    if(self.fetchedRecordsArray) {
        return [self.fetchedRecordsArray count];        // coredata records
    }
    else {
        return 0;
    }
     */
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"TableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:tableIdentifier];
    }
    
    // if 'load' has been pressed, NSNotificationCenter send the fetchedRecordsArray. Otherwise nothing.
    //if(self.fetchedRecordsArray) {
        Record *record = [self.fetchedRecordsArray objectAtIndex:indexPath.row];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@", record.name];
        
        //cell.textLabel.text = self.dwarves[indexPath.row];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@,  %@", record.age, record.favoritefood];
    //}
    
    return cell;
}










@end
