//
//  YUNBorderedView.m
//  YUNToolsKit
//
//  Created by Orange on 5/31/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "YUNBorderedView.h"
#import "YUNDrawingUtilities.h"

@implementation YUNBorderedView

#pragma mark - Accessors

- (void)setTopBorderColor:(UIColor *)topBorderColor
{
    _topBorderColor = topBorderColor;
    [self setNeedsDisplay];
}

- (void)setTopInsetColor:(UIColor *)topInsetColor
{
    _topInsetColor = topInsetColor;
    [self setNeedsDisplay];
}

- (void)setBottomInsetColor:(UIColor *)bottomInsetColor
{
    _bottomInsetColor = bottomInsetColor;
    [self setNeedsDisplay];
}

- (void)setBottomBorderColor:(UIColor *)bottomBorderColor
{
    _bottomBorderColor = bottomBorderColor;
    [self setNeedsDisplay];
}

#pragma mark - UIView

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClipToRect(context, rect);
    
    CGSize size = rect.size;
    
    if (_topBorderColor) {
        // Top inset
        if (_topInsetColor) {
            CGContextSetFillColorWithColor(context, _topInsetColor.CGColor);
            CGContextFillRect(context, CGRectMake(0.0f, 1.0f, size.width, 1.0f));
        }
        
        // Top border
        CGContextSetFillColorWithColor(context, _topBorderColor.CGColor);
        CGContextFillRect(context, CGRectMake(0.0f, 0.0f, size.width, 1.0f));
    }
    
    if (_bottomBorderColor) {
        // Bottom inset
        if (_bottomInsetColor) {
            CGContextSetFillColorWithColor(context, _bottomInsetColor.CGColor);
            CGContextFillRect(context, CGRectMake(0.0f, rect.size.height - 2.0f, size.width, 1.0f));
        }
        
        // Bottom border
        CGContextSetFillColorWithColor(context, _bottomBorderColor.CGColor);
        CGContextFillRect(context, CGRectMake(0.0f, rect.size.height - 1.0f, size.width, 1.0f));
    }
}

@end
