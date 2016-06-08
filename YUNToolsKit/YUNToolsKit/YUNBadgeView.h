//
//  YUNBadgeView.h
//  YUNToolsKit
//
//  Created by Orange on 5/31/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Options for aligning the badge horizontally.
 */
typedef NS_ENUM(NSInteger, YUNBadgeViewAlignment)
{
    // Align badge along the left edge.
    YUNBadgeViewAlignmentLeft = NSTextAlignmentLeft,
    
    // Align badge equally along both sides of the center line.
    YUNBadgeViewAlignmentCenter = NSTextAlignmentCenter,
    
    // Align badge along the right edge.
    YUNBadgeViewAlignmentRight = NSTextAlignmentRight,
};

@class YUNLabel;

/**
 Badge view.
 
 Provides the accesory view for a YUNBadgeTableViewCell, available throught the 'badgeView' property.
 
 Acts very much like the badges in Mail.app, with the key difference being that Apple uses images and 'YUNBadgeView' is 
 rendered with Core Graphics for improved scrolling performance (although images are supported). This also allows for 
 more flexible resizing.
 */
@interface YUNBadgeView : UIView

/**
 The badge text label.
 */
@property (nonatomic, strong, readonly) YUNLabel *textLabel;

/**
 The badge's background color.
 
 The default value of this property is grayish blue (that matches Mail.app).
 
 @see defaultBadgeColor
 */
@property (nonatomic, strong) UIColor *badgeColor;

/**
 The badge's backgound color while its cell is highlighted.
 
 The default value of this property is white.
 */
@property (nonatomic, strong) UIColor *highlightedBadgeColor;

/**
 The corner radius used when rendering the badge's outline.
 
 The default value of this property is 10.
 */
@property (nonatomic, assign) CGFloat cornerRadius;

/**
 The badge's horizontal alignment within the accesoryView frame.
 
 This will position the badge in the view's bounds accordinly.
 
 The default value of this property is 'YUNBadgeViewAlignmentCenter'.
 */
@property (nonatomic, assign) YUNBadgeViewAlignment badgeAlignment;

/**
 A Boolean value indicating whether the receiver should be drawn with a highlight.
 
 Setting this property causes the receiver to redraw with the appropriate highlight state.
 
 The default value of this property is 'NO'.
 */
@property (nonatomic, assign, getter=isHighlighted) BOOL highlighted;

/**
 The badge's background image
 
 The default value of this perperty is 'nil'. If the value is non-nil, it will be draw instead of the color.
 
 Setting a strechable image for this property is recommended.
 */
@property (nonatomic, strong) UIImage *badgeImage;

/**
 The badge's background image while its cell is highlighted.
 
 The default value of this property is 'nil'. If the value is non-nil, it will be draw instead of the color.
 
 Setting a strechable image for this property is recommended.
 */
@property (nonatomic, strong) UIImage *highlightedBadgeImage;

/**
 The default badge color.
 
 @return A color with its value set to the default badge color.
 */
+ (UIColor *)defaultBadgeColor;

@end
