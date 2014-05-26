//
//  AMPAvatarView.m
//  AMPAvatarView
//
//  Created by Alejandro Martinez on 29/06/13.
//  Copyright (c) 2013 Alejandro Martinez. All rights reserved.
//

#import "AMPAvatarView.h"
#import <QuartzCore/QuartzCore.h>

CGRect AMPDrawingRectForContentMode(CGSize imageSize, CGRect bounds, UIViewContentMode contentMode) {
    CGRect rect = CGRectZero;
    switch (contentMode) {
        case UIViewContentModeBottom:
            rect = CGRectMake((CGRectGetWidth(bounds)-imageSize.width)/2.0,
                              CGRectGetHeight(bounds)-imageSize.height,
                              imageSize.width,
                              imageSize.height);
            break;
        case UIViewContentModeBottomLeft:
            rect = CGRectMake(CGRectGetWidth(bounds)-imageSize.width,
                              CGRectGetHeight(bounds)-imageSize.height,
                              imageSize.width,
                              imageSize.height);
            break;
        case UIViewContentModeBottomRight:
            rect = CGRectMake(0,
                              CGRectGetHeight(bounds)-imageSize.height,
                              imageSize.width,
                              imageSize.height);
            break;
        case UIViewContentModeCenter:
            rect = CGRectMake((CGRectGetWidth(bounds)-imageSize.width)/2.0,
                              (CGRectGetHeight(bounds)-imageSize.height)/2.0,
                              imageSize.width,
                              imageSize.height);
            break;
        case UIViewContentModeLeft:
            rect = CGRectMake(0,
                              (CGRectGetHeight(bounds)-imageSize.height)/2.0,
                              imageSize.width,
                              imageSize.height);
            break;
        case UIViewContentModeRight:
            rect = CGRectMake(CGRectGetWidth(bounds)-imageSize.width,
                              (CGRectGetHeight(bounds)-imageSize.height)/2.0,
                              imageSize.width,
                              imageSize.height);
            break;
        case UIViewContentModeScaleAspectFill: {
            CGFloat ratio = 0.0;
            if (imageSize.width > imageSize.height) {
                ratio = CGRectGetHeight(bounds)/imageSize.height;
                rect.origin.x = (CGRectGetWidth(bounds)-(imageSize.width*ratio))/2.0;
            } else {
                ratio = CGRectGetWidth(bounds)/imageSize.width;
                rect.origin.y = (CGRectGetHeight(bounds)-(imageSize.height*ratio))/2.0;
            }
            rect.size = CGSizeMake(imageSize.width*ratio, imageSize.height*ratio);
        }
            break;
        case UIViewContentModeScaleAspectFit: {
            CGFloat ratio = 0.0;
            if (imageSize.width > imageSize.height) {
                ratio = CGRectGetWidth(bounds)/imageSize.width;
                rect.origin.y = (CGRectGetHeight(bounds)-(imageSize.height*ratio))/2.0;
            } else {
                ratio = CGRectGetHeight(bounds)/imageSize.height;
                rect.origin.y = (CGRectGetWidth(bounds)-(imageSize.width*ratio))/2.0;
            }
            rect.size = CGSizeMake(imageSize.width*ratio, imageSize.height*ratio);
        }
            break;
        case UIViewContentModeScaleToFill:
        case UIViewContentModeRedraw:
            rect = bounds;
            break;
        case UIViewContentModeTop:
            rect = CGRectMake((CGRectGetWidth(bounds)-imageSize.width)/2.0,
                              0,
                              imageSize.width,
                              imageSize.height);
            break;
        case UIViewContentModeTopLeft:
            rect = CGRectMake(0,
                              0,
                              imageSize.width,
                              imageSize.height);
            break;
        case UIViewContentModeTopRight:
            rect = CGRectMake(CGRectGetWidth(bounds)-imageSize.width,
                              0,
                              imageSize.width,
                              imageSize.height);
            break;
    }
    return rect;
}

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
    
    self.innerBackgroundColor = [UIColor whiteColor];

    self.borderWidth = 4.0;
    self.borderColor = [UIColor whiteColor];
    
    self.shadowRadius = 5.0;
    self.shadowColor = [UIColor blackColor];
    
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowOpacity = 0.9f;
}

#pragma mark -

- (void)setInnerBackgroundColor:(UIColor *)innerBackgroundColor {
    _innerBackgroundColor = innerBackgroundColor;
    [self setNeedsDisplay];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
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

- (void)setImage:(UIImage *)image {
    _image = image;
    [self setNeedsDisplay];
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(ctx);
    
    CGPathRef circle = CGPathCreateWithEllipseInRect(bounds, NULL);
    CGPathRef littleCircle = CGPathCreateWithEllipseInRect(CGRectInset(bounds, _borderWidth, _borderWidth), NULL);

    // Draw the border
    CGContextSaveGState(ctx); {
        
        CGContextBeginPath(ctx);
        CGContextAddPath(ctx, circle);
        [_borderColor setFill];
        CGContextFillPath(ctx);
    } CGContextRestoreGState(ctx);

    // Draw the inner background color
    CGContextSaveGState(ctx); {
        
        CGContextBeginPath(ctx);
        CGContextAddPath(ctx, littleCircle);
        [_innerBackgroundColor setFill];
        CGContextFillPath(ctx);
    } CGContextRestoreGState(ctx);
    
    // Draw the circle image
    CGContextSaveGState(ctx); {
        CGContextBeginPath(ctx);
        CGContextAddPath(ctx, littleCircle);
        CGContextClip(ctx);
        [_image drawInRect:AMPDrawingRectForContentMode(_image.size, rect, self.contentMode)];
    } CGContextRestoreGState(ctx);
    
    CGPathRelease(circle);
    CGPathRelease(littleCircle);
    
    CGContextRestoreGState(ctx);
}

@end
