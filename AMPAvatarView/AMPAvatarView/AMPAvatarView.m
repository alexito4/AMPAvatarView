//
//  AMPAvatarView.m
//  AMPAvatarView
//
//  Created by Alejandro Martinez on 29/06/13.
//  Copyright (c) 2013 Alejandro Martinez. All rights reserved.
//

#import "AMPAvatarView.h"
#import <QuartzCore/QuartzCore.h>

@implementation AMPAvatarView

#pragma mark - Init

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (void)baseInit {
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.borderWith = 4.0;
    self.borderColor = [UIColor whiteColor];
    
    self.shadowRadius = 5.0;
    self.shadowColor = [UIColor blackColor];
    
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowOpacity = 0.9f;
}

#pragma mark -

- (void)setBorderWith:(CGFloat)borderWith {
    _borderWith = borderWith;
    [self setNeedsDisplay];
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    [self setNeedsDisplay];
}

- (void)setShadowRadius:(CGFloat)shadowRadius {
    _shadowRadius = shadowRadius;
    self.layer.shadowRadius = _shadowRadius;
}

- (void)setShadowColor:(UIColor *)shadowColor {
    _shadowColor = shadowColor;
    self.layer.shadowColor = _shadowColor.CGColor;
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(ctx);
    
    CGPathRef circle = CGPathCreateWithEllipseInRect(bounds, NULL);
    CGPathRef littleCircle = CGPathCreateWithEllipseInRect(CGRectInset(bounds, _borderWith, _borderWith), NULL);

    // Draw the border
    CGContextSaveGState(ctx); {
        
        CGContextBeginPath(ctx);
        CGContextAddPath(ctx, circle);
        [_borderColor setFill];
        CGContextFillPath(ctx);
    } CGContextRestoreGState(ctx);
    
    // Draw the circle image
    CGContextSaveGState(ctx); {
        CGContextBeginPath(ctx);
        CGContextAddPath(ctx, littleCircle);
        CGContextClip(ctx);
        [_image drawInRect:bounds];
    } CGContextRestoreGState(ctx);
    
    CGPathRelease(circle);
    CGPathRelease(littleCircle);
    
    CGContextRestoreGState(ctx);
}

@end
