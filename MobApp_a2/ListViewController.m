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

    self.dwarves = @[@"Sleepy", @"Grumpy", @"Bashful", @"Happy"];
    
    UITableView *tableView = (id)[self.view viewWithTag:1];
    UIEdgeInsets contentsInset = tableView.contentInset;
    contentsInset.top = 20;
    [tableView setContentInset:contentsInset];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dwarves count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
    }
    
    cell.textLabel.text = self.dwarves[indexPath.row];
    return cell;
}


@end
