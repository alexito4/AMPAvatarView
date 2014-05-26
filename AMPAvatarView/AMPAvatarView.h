//
//  AMPAvatarView.h
//  AMPAvatarView
//
//  Created by Alejandro Martinez on 29/06/13.
//  Copyright (c) 2013 Alejandro Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMPAvatarView : UIView

@property (nonatomic, strong) UIImage *image;

// Inner background color
@property (nonatomic, strong) UIColor *innerBackgroundColor;

// Border
@property (nonatomic) CGFloat borderWidth;
@property (nonatomic, strong) UIColor *borderColor;

// Shadow
@property (nonatomic) CGFloat shadowRadius;
@property (nonatomic, strong) UIColor *shadowColor;

@end
