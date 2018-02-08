//
//  OMAllEventsNotificationsViewController.h
//  Intellispex
//
//  Created by Zahid  Hussain on 08/02/2018.
//  Copyright © 2018 ellisa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OMAllEventsNotificationsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView            *allEventsNotificationsTableView;
@property (nonatomic, strong) NSMutableArray                *allEventsNotificationsDatasource;

@end
