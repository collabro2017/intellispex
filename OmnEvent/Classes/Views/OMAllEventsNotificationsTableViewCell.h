//
//  OMAllEventsNotificationsTableViewCell.h
//  Intellispex
//
//  Created by Zahid  Hussain on 08/02/2018.
//  Copyright © 2018 ellisa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OMAllEventsNotificationsTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView            *thumbnailImageView;
@property (nonatomic, weak) IBOutlet UILabel                *lblBadge;
@property (nonatomic, weak) IBOutlet UILabel                *lblTitle;
@property (nonatomic, weak) IBOutlet UILabel                *lblCreator;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lblTitleHeightConstraint;

- (void) configureViewWith:(PFObject *) event;

@end
