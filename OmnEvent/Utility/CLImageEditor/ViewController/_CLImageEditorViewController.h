//
//  _CLImageEditorViewController.h
//
//  Created by sho yakushiji on 2013/11/05.
//  Copyright (c) 2013年 CALACULU. All rights reserved.
//

#import "CLImageEditor.h"
#import "PhotoTweaksViewController.h"
#import "OMPostEventViewController.h"

@interface _CLImageEditorViewController : CLImageEditor
<UIScrollViewDelegate, UIBarPositioningDelegate, UINavigationBarDelegate, PhotoTweaksViewControllerDelegate>
{
    IBOutlet __weak UINavigationBar *_navigationBar;
    IBOutlet __weak UIScrollView *_scrollView;
}
@property (nonatomic, strong) UIImageView  *imageView;
@property (nonatomic, weak) IBOutlet UIScrollView *menuView;
@property (nonatomic, readonly) UIScrollView *scrollView;


- (IBAction)pushedCloseBtn:(id)sender;
- (IBAction)pushedFinishBtn:(id)sender;




- (id)initWithImage:(UIImage*)image;


- (void)fixZoomScaleWithAnimated:(BOOL)animated;
- (void)resetZoomScaleWithAnimated:(BOOL)animated;

@end