//
//  YUNGradientView.m
//  YUNToolsKit
//
//  Created by Orange on 5/31/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "YUNGradientView.h"
#import "YUNDrawingUtilities.h"

@implementation YUNGradientView
{
    CGGradientRef _gradient;
}

#pragma mark - Setters

- (void)setColors:(NSArray *)colors
{
    _colors = colors;
    [self p_refreshGradient];
}

- (void)setLocations:(NSArray *)locations
{
    _locations = locations;
    [self p_refreshGradient];
}

- (void)setDirection:(YUNGradientViewDirection)direction
{
    _direction = direction;
    [self setNeedsDisplay];
}

#pragma mark - UIView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self p_initializeGradientView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_initializeGradientView];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClipToRect(context, rect);
    
    // Gradient
    if (_gradient) {
        CGPoint start = CGPointMake(0.0f, 0.0f);
        CGPoint end = (_direction == YUNGradientViewDirectionVertical ? CGPointMake(0.0f, rect.size.height) : CGPointMake(rect.size.width, 0.0f));
        CGContextDrawLinearGradient(context, _gradient, start, end, 0);
    }
    
    [super drawRect:rect];
}

#pragma mark - Private methods

- (void)p_initializeGradientView
{
    _direction = YUNGradientViewDirectionVertical;
}

- (void)p_refreshGradient {
    CGGradientRelease(_gradient);
    _gradient = YUNCreateGradientWithColorsAndLocations(_colors, _locations);
    
    // Redraw
    [self setNeedsDisplay];
}

@end
