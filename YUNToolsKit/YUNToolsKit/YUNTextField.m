//
//  YUNTextField.m
//  YUNToolsKit
//
//  Created by Orange on 5/25/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "YUNTextField.h"
#import "YUNDrawingUtilities.h"

@interface YUNTextField ()
- (void)_initialize;
@end

@implementation YUNTextField

#pragma mark - Accessors

@synthesize textEdgeInsets = _textEdgeInsets;
@synthesize clearButtonEdgeInsets = _clearButtonEdgeInsets;
@synthesize placeholderTextColor = _placeholderTextColor;

- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor {
    _placeholderTextColor = placeholderTextColor;
    
    if (!self.text && self.placeholder) {
        [self setNeedsLayout];
    }
}

#pragma mark - UIView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self _initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self _initialize];
    }
    return self;
}

#pragma mark - UITextField 

- (CGRect)textRectForBounds:(CGRect)bounds {
    return UIEdgeInsetsInsetRect([super textRectForBounds:bounds], _textEdgeInsets);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}

- (CGRect)clearButtonRectForBounds:(CGRect)bounds {
    CGRect rect = [super clearButtonRectForBounds:bounds];
    rect = CGRectSetY(rect, rect.origin.y + _clearButtonEdgeInsets.top);
    return CGRectSetX(rect, rect.origin.x + _clearButtonEdgeInsets.right);
}

- (void)drawPlaceholderInRect:(CGRect)rect {
    if (!_placeholderTextColor) {
        [super drawPlaceholderInRect:rect];
        return;
    }
    
    [_placeholderTextColor setFill];
    [self.placeholder drawInRect:rect withFont:self.font lineBreakMode:NSLineBreakByTruncatingTail alignment:self.textAlignment];
}

#pragma mark - Private

- (void)_initialize {
    _textEdgeInsets = UIEdgeInsetsZero;
    _clearButtonEdgeInsets = UIEdgeInsetsZero;
}

@end
