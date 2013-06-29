//
//  AMPViewController.h
//  AMPAvatarView
//
//  Created by Alejandro Martinez on 29/06/13.
//  Copyright (c) 2013 Alejandro Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AMPAvatarView;

@interface AMPViewController : UIViewController

@property (weak, nonatomic) IBOutlet AMPAvatarView *avatar;

- (IBAction)sliderWithChanged:(id)sender;
- (IBAction)changeBorderColor:(id)sender;
- (IBAction)sliderShadowChangeed:(id)sender;
- (IBAction)changeShadowColor:(id)sender;
@end
