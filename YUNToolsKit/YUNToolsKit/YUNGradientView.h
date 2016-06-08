//
//  YUNGradientView.h
//  YUNToolsKit
//
//  Created by Orange on 5/31/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "YUNBorderedView.h"

/**
 The direction the gradient.
 */
typedef NS_ENUM(NSInteger, YUNGradientViewDirection)
{
    // The gradient is horizontal.
    YUNGradientViewDirectionHorizontal,
    
    // The gradient is verticle.
    YUNGradientViewDirectionVertical,
};

/**
 Simple 'UIView' wrapper for 'CGGradient'.
 */
@interface YUNGradientView : YUNBorderedView

/**
 An array of 'UIColor' objects used to draw the gradient. If the value is 'nil', the 'backgroundColor' will be drawn 
 instead of a gradient.
 
 The default is 'nil'.
 */
@property (nonatomic, copy) NSArray *colors;

/**
 An optional array of 'NSNumber' objects defining the location of each gradient stop.
 
 The gradient stops are specified as values between '0' and '1'. The values must be monotinically
 inscreasing. If 'nil', the stops are spread uniformly across the range. Defaults to 'nil'.
 */
@property (nonatomic, copy) NSArray *locations;

/**
 The direction of the gradient.
 
 The default is 'YUNGradientViewDirectionVertical'.
 */
@property (nonatomic, assign) YUNGradientViewDirection direction;

@end
