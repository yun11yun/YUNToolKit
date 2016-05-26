//
//  YUNLabel.m
//  YUNToolsKit
//
//  Created by Orange on 4/29/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "YUNLabel.h"

@interface YUNLabel ()

- (void)_initialize;

@end

@implementation YUNLabel

#pragma mark - Accessors

@synthesize verticalTextAlignment = _verticalTextAlignment;

- (void)setVerticalTextAlignment:(YUNLabelVerticalTextAlignment)verticalTextAlignment
{
    _verticalTextAlignment = verticalTextAlignment;
    
    [self setNeedsLayout];
}

@synthesize textEdgeInsets = _textEdgeInsets;

- (void)setTextEdgeInsets:(UIEdgeInsets)textEdgeInsets
{
    _textEdgeInsets = textEdgeInsets;
    
    [self setNeedsLayout];
}

#pragma mark - UIView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        [self _initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        [self _initialize];
    }
    return self;
}

#pragma mark - UILabel

- (void)drawTextInRect:(CGRect)rect
{
    rect = UIEdgeInsetsInsetRect(rect, _textEdgeInsets);
    
    if (self.verticalTextAlignment == YUNLabelVerticalTextAlignmentTop) {
        CGSize sizeThatFits = [self sizeThatFits:rect.size];
        rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, sizeThatFits.height);
    } else if (self.verticalTextAlignment == YUNLabelVerticalTextAlignmentBottom) {
        CGSize sizeThatFits = [self sizeThatFits:rect.size];
        rect = CGRectMake(rect.origin.x, rect.origin.y + (rect.size.height - sizeThatFits.height), rect.size.width, sizeThatFits.height);
    }
    [super drawTextInRect:rect];
}

#pragma mark - Private

- (void)_initialize
{
    self.verticalTextAlignment = YUNLabelVerticalTextAlignmentMiddle;
    self.textEdgeInsets = UIEdgeInsetsZero;
}

@end
