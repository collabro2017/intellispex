//
//  OMAllEventsNotificationsViewController.m
//  Intellispex
//
//  Created by Zahid  Hussain on 08/02/2018.
//  Copyright © 2018 ellisa. All rights reserved.
//

#import "OMAllEventsNotificationsViewController.h"
#import "OMAllEventsNotificationsTableViewCell.h"
#import "OMDetailEventViewController.h"

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
    
    [self.allEventsNotificationsTableView reloadData];
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
    OMDetailEventViewController *detailEventVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailEventVC"];
    OMSocialEvent *event = [self.allEventsNotificationsDatasource objectAtIndex:indexPath.item];
    
    if (event != nil) {
        
        NSString *lastLoadTime_Key = [NSString stringWithFormat:@"%@-lastLoadTime", event.objectId];
        NSDate* lastLoadTime = [NSDate date];
        
        [[NSUserDefaults standardUserDefaults] setObject:lastLoadTime forKey:lastLoadTime_Key];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        event.loadTimeAt = lastLoadTime;
        if(event.badgeNewEvent >= 1) event.badgeNewEvent = 0;
        if(event.badgeNotifier >= 1) event.badgeNotifier = 0;
        
        PFUser *currentUser = [PFUser currentUser];
        
        // Event Badge processing...
        if([event[@"eventBadgeFlag"] containsObject:currentUser.objectId])
        {
            [event removeObject:currentUser.objectId forKey:@"eventBadgeFlag"];
            [event saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                if(error == nil) NSLog(@"DetailEventVC: Event Badge remove when open Detail view...");
            }];
        }
        
        [self.allEventsNotificationsDatasource replaceObjectAtIndex:indexPath.item withObject:event];
        [self.allEventsNotificationsTableView reloadData];
        
        
        [detailEventVC setCurrentObject:event];
        [self.navigationController pushViewController:detailEventVC animated:YES];
        
    }
    
}


@end
