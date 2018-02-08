//
//  OMAllEventsNotificationsTableViewCell.m
//  Intellispex
//
//  Created by Zahid  Hussain on 08/02/2018.
//  Copyright © 2018 ellisa. All rights reserved.
//

#import "OMAllEventsNotificationsTableViewCell.h"
#import "OMGlobal.h"
#import "OMUtilities.h"
#import "OMSocialEvent.h"

@implementation OMAllEventsNotificationsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Public Methods

- (void) configureViewWith:(PFObject *) event
{
    NSString *strEventName = event[@"eventname"];
    
    CGSize estimatedSize = [OMGlobal getBoundingOfString:strEventName width:[[UIScreen mainScreen] bounds].size.width - 135 font:[self.lblTitle font]];
    
    if (estimatedSize.height > 80) {
        self.lblTitleHeightConstraint.constant = 70;
        self.lblTitle.numberOfLines = 3;
    }
    else{
        
        if(estimatedSize.height < 20) {
            self.lblTitleHeightConstraint.constant = 25;
            self.lblTitle.numberOfLines = 2;
        }
        else{

            self.lblTitleHeightConstraint.constant = estimatedSize.height;
            self.lblTitle.numberOfLines = ceil(estimatedSize.height/20);
        }
    }
    
    self.lblTitle.text = strEventName;
    self.lblCreator.text = [NSString stringWithFormat:@"Created by: %@", event[@"username"]];
    
    PFFile *postImgFile = (PFFile *)event[@"thumbImage"];
    if (postImgFile) {
        [self.thumbnailImageView setImageWithURL:[NSURL URLWithString:postImgFile.url]];
    }
    
    OMSocialEvent *currentObj = (OMSocialEvent *) event;
    
    [OMGlobal setCircleView:self.lblBadge borderColor:nil];
    if (currentObj.badgeCount == 0) {
        
        [self.lblBadge setHidden:YES];
        
        if(currentObj.badgeNotifier > 0)
        {
            [self.lblBadge setHidden:NO];
            [self.lblBadge setText:[NSString stringWithFormat:@"%lu",(long)currentObj.badgeNotifier]];
        }
        
    } else {
        [self.lblBadge setHidden:NO];
        [self.lblBadge setText:[NSString stringWithFormat:@"%lu",(long)currentObj.badgeCount]];
    }
}

@end
