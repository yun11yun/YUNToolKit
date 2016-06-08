//
//  YUNBadgeView.m
//  YUNToolsKit
//
//  Created by Orange on 5/31/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "YUNBadgeView.h"
#import "YUNLabel.h"
#import "YUNDrawingUtilities.h"

@implementation YUNBadgeView

#pragma mark - Setters

- (void)setBadgeColor:(UIColor *)badgeColor
{
    _badgeColor = badgeColor;
    [self setNeedsDisplay];
}

- (void)setHighlightedBadgeColor:(UIColor *)highlightedBadgeColor
{
    _highlightedBadgeColor = highlightedBadgeColor;
    [self setNeedsDisplay];
}

- (void)setBadgeImage:(UIImage *)badgeImage
{
    _badgeImage = badgeImage;
    [self setNeedsDisplay];
}

- (void)setHighlightedBadgeImage:(UIImage *)highlightedBadgeImage
{
    _highlightedBadgeImage = highlightedBadgeImage;
    [self setNeedsDisplay];
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    [self setNeedsDisplay];
}

- (void)setBadgeAlignment:(YUNBadgeViewAlignment)badgeAlignment
{
    _badgeAlignment = badgeAlignment;
    [self setNeedsDisplay];
}

- (void)setHighlighted:(BOOL)highlighted
{
    _highlighted = highlighted;
    _textLabel.highlighted = highlighted;
    [self setNeedsDisplay];
}

#pragma mark - Class methods

+ (UIColor *)defaultBadgeColor
{
    return [UIColor colorWithRed:0.541f green:0.596f blue:0.694f alpha:1.0f];
}

#pragma mark - UIView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self p_initializeBadgeView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_initializeBadgeView];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    UIColor *currentBadgeColor = nil;
    UIImage *currentBadgeImage = nil;
    
    if (_highlighted) {
        currentBadgeColor = _highlightedBadgeColor ? _highlightedBadgeColor : _badgeColor;
        currentBadgeImage = _highlightedBadgeImage ? _highlightedBadgeImage : _badgeImage;
    } else {
        currentBadgeColor = _badgeColor;
        currentBadgeImage = _badgeImage;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //Badge
    CGSize size = self.frame.size;
    CGSize badgeSize = [self sizeThatFits:size];
    badgeSize.height = fminf(badgeSize.height, size.height);
    
    CGFloat x = 0.0f;
    if (_badgeAlignment == YUNBadgeViewAlignmentCenter) {
        x = roundf((size.width - badgeSize.width) / 2.0f);
    } else if (_badgeAlignment == YUNBadgeViewAlignmentRight) {
        x = size.width - badgeSize.width;
    }
    
    CGRect badgeRect = CGRectMake(x, roundf((size.height - badgeSize.height) / 2.0f), badgeSize.width, badgeSize.height);
    
    // Draw image
    if (currentBadgeImage) {
        [currentBadgeImage drawInRect:badgeRect];
    }
    
    // Draw rectangle
    else if (currentBadgeColor) {
        [currentBadgeColor set];
        YUNDrawRoundedRect(context, badgeRect, _cornerRadius);
    }
    
    // Text
    [_textLabel drawTextInRect:badgeRect];
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize textSize = [_textLabel sizeThatFits:self.bounds.size];
    return CGSizeMake(fmaxf(textSize.width + 12.0f, 30.0f), textSize.height + 8.0f);
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    if (newSuperview) {
        [_textLabel addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
        self.hidden = ([_textLabel.text length] == 0);
    } else {
        [_textLabel removeObserver:self forKeyPath:@"text"];
    }
}

#pragma mark - Private methods

- (void)p_initializeBadgeView
{
    self.backgroundColor = [UIColor whiteColor];
    self.opaque = YES;
    
    _textLabel = [[YUNLabel alloc] initWithFrame:CGRectZero];
    _textLabel.text = @"0";
    _textLabel.textColor = [UIColor whiteColor];
    _textLabel.highlightedTextColor = [UIColor colorWithRed:0.125f green:0.369f blue:0.871f alpha:1.0f];
    _textLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    _textLabel.textAlignment = NSTextAlignmentCenter;
    
    self.badgeColor = [[self class] defaultBadgeColor];
    self.highlightedBadgeColor = [UIColor whiteColor];
    self.cornerRadius = 10.0f;
    self.badgeAlignment = YUNBadgeViewAlignmentCenter;
    self.highlighted = NO;
}

#pragma mark - NSKeyValueObserving

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (object == _textLabel && [keyPath isEqualToString:@"text"]) {
        NSString *text = [change objectForKey:NSKeyValueChangeNewKey];
        if ([text isEqual:[NSNull null]]) {
            text = nil;
        }
        self.hidden = ([text length] == 0);
        
        if (!self.hidden) {
            [self setNeedsDisplay];
        }
        return;
    }
    
    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

@end
