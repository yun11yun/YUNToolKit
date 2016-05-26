//
//  YUNTextView.m
//  YUNToolsKit
//
//  Created by Orange on 5/25/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "YUNTextView.h"

@interface YUNTextView ()
- (void)_initialize;
- (void)_updateShouldDrawPlaceholder;
- (void)_textChanged:(NSNotification *)notification;
@end

@implementation YUNTextView {
    BOOL _shouldDrawPlaceholder;
}

#pragma mark - Accessors

- (void)setText:(NSString *)string
{
    [super setText:string];
    [self _updateShouldDrawPlaceholder];
}

- (void)setPlaceholder:(NSString *)string
{
    if ([string isEqual:_placeholder]) {
        return;
    }
    
    _placeholder = string;
    [self _updateShouldDrawPlaceholder];
}

#pragma mark - NSObject

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self];
}

#pragma mark - UIView;

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initialize];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if (_shouldDrawPlaceholder) {
        [_placeholderTextColor set];
        [_placeholder drawInRect:CGRectMake(8.0f, 8.0f, self.frame.size.width - 16.0f, self.frame.size.height - 16.0f) withAttributes:@{NSFontAttributeName : self.font}];
    }
}

#pragma mark - Private

- (void)_initialize
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_textChanged:) name:UITextViewTextDidChangeNotification object:self];
    
    self.placeholderTextColor = [UIColor colorWithWhite:0.702f alpha:1.0f];
    _shouldDrawPlaceholder = NO;
}

- (void)_updateShouldDrawPlaceholder {
    BOOL prev = _shouldDrawPlaceholder;
    _shouldDrawPlaceholder = self.placeholder && self.placeholderTextColor && self.text.length == 0;
    
    if (prev != _shouldDrawPlaceholder) {
        [self setNeedsDisplay];
    }
}

- (void)_textChanged:(NSNotification *)notification
{
    [self _updateShouldDrawPlaceholder];
}

@end
