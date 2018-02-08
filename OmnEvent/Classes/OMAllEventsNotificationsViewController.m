//
//  OMAllEventsNotificationsViewController.m
//  Intellispex
//
//  Created by Zahid  Hussain on 08/02/2018.
//  Copyright © 2018 ellisa. All rights reserved.
//

#import "OMAllEventsNotificationsViewController.h"
#import "OMAllEventsNotificationsTableViewCell.h"

@interface OMAllEventsNotificationsViewController ()

@end

@implementation OMAllEventsNotificationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = @"All Events Notifications";
}

#pragma mark  UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allEventsNotificationsDatasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OMAllEventsNotificationsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OMAllEventsNotificationsTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    PFObject *obj = [self.allEventsNotificationsDatasource objectAtIndex:indexPath.row];
    [cell configureViewWith:obj];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 120.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
