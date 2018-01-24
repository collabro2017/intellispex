//
//  OMDetailHeaderCell.h
//  Collabro
//
//  Created by XXX on 4/4/15.
//  Copyright (c) 2015 ellisa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OMDetailHeaderCell : UITableViewCell
{
    
    IBOutlet UIImageView *imageViewForPost;
    
    IBOutlet UIView *viewForLike;
    
    
    IBOutlet UIButton *btnForLike;
    
    IBOutlet UIButton *btnForLikeCount;    
    
    
    IBOutlet UIView *viewForComment;
    
    IBOutlet UIButton *btnForComment;
    
    IBOutlet UIButton *btnForCommentCount;
    
    IBOutlet UIImageView *imageViewForAvatar;
    
    IBOutlet UILabel *lblForUsername;
    
    IBOutlet UIButton *btnForMore;
    
    IBOutlet UIImageView    *companyLogo;
    IBOutlet UIView         *ccHeaderView;
    IBOutlet UILabel        *lblEventTitle;
    IBOutlet UILabel        *lblCompany;
    IBOutlet UILabel        *lblTime;
    IBOutlet UILabel        *lblAddress;
    
    
    
    NSMutableArray *likeUserArray;
    NSMutableArray *likerArr;

    NSInteger likeCount;
    NSInteger commentCount;
    BOOL liked;
    
}

@property (strong, nonatomic) id delegate;
@property (strong, nonatomic) PFObject *currentObj;
@property (strong, nonatomic) PFUser   *user;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lblAddressHeightConstraint;

- (IBAction)likeAction:(id)sender;

- (IBAction)showLikersAction:(id)sender;

- (IBAction)commentAction:(id)sender;
- (IBAction)showCommentersAction:(id)sender;
- (IBAction)moreAction:(id)sender;

- (UIImage *) getHeaderSnapshot;

@end
