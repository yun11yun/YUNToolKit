//
//  YUNLoadingView.m
//  YUNToolsKit
//
//  Created by Orange on 6/1/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "YUNLoadingView.h"

static CGFloat interiorPadding = 20.0f;
static CGFloat indicatorSize = 20.0f;
static CGFloat indicatorRightMargin = 8.0f;

@implementation YUNLoadingView

#pragma mark - UIView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self p_initializeLoadingView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_initializeLoadingView];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGRect frame = self.frame;
    
    // Calculate sizes
    CGSize maxSize = CGSizeMake(frame.size.width - (interiorPadding * 2.0f) - indicatorSize - indicatorRightMargin,
                                indicatorSize);
    
    CGSize textSize = [_textLabel.text sizeWithFont:_textLabel.font constrainedToSize:maxSize
                                      lineBreakMode:NSLineBreakByWordWrapping];
    
    // Calculate position
    CGFloat totalWidth = textSize.width + indicatorSize + indicatorRightMargin;
    NSInteger y = (NSInteger)((frame.size.height / 2.0f) - (indicatorSize / 2.0f));
    
    // Position the indicator
    _activityIndicatorView.frame = CGRectMake((NSInteger)((frame.size.width - totalWidth) / 2.0f), y, indicatorSize,
                                              indicatorSize);
    
    // Calculate text position
    CGRect textRect = CGRectMake(_activityIndicatorView.frame.origin.x + indicatorSize + indicatorRightMargin, y,
                                 textSize.width, textSize.height);
    
    // Draw text
    [_textLabel drawTextInRect:textRect];
}

#pragma mark - Private methods

- (void)p_initializeLoadingView
{
    //View defaults
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.backgroundColor = [UIColor whiteColor];
    self.opaque = YES;
    self.contentMode = UIViewContentModeRedraw;
    
    // Setup
    _textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    
    // Setup the indicator
    _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activityIndicatorView.hidesWhenStopped = NO;
    [_activityIndicatorView startAnimating];
    [self addSubview:_activityIndicatorView];
    
    // Defaults
    _textLabel.text = @"Loading...";
    _textLabel.font = [UIFont systemFontOfSize:16.0f];
    _textLabel.textColor = [UIColor darkGrayColor];
    _textLabel.shadowColor = [UIColor whiteColor];
    _textLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
}

@end
