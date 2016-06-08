//
//  YUNDrawingUtilities.h
//  YUNToolsKit
//
//  Created by Orange on 5/31/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#ifndef YUNDRAWINGUTILITIES
#define YUNDRAWINGUTILITIES

///-----------------------------------
/// @name Degree and Radian Conversion
///-----------------------------------

/**
 A macro that converts a number from degress to radians.
 
 @param d number in degrees
 
 @return The number converted to radians.
 */
#define DEGREES_TO_RADIANS(d) ((d) * 0.0174532925199432958f)

/**
 A macro that converts a number from radians to degrees.
 
 @param r number in radians
 
 @return The number converted to degrees.
 */
#define RADIANS_TO_DEGREES(r) ((r) * 57.29577951308232f)

#endif

/**
 Limits a float to the `min` or `max` value. The float is between `min` and `max` it will be returned unchanged.
 
 @param f The float to limit.
 
 @param min The minumum value for the float.
 
 @param max The minumum value for the float.
 
 @return A float limited to the `min` or `max` value.
 */
extern CGFloat YUNFLimit(CGFloat f, CGFloat min, CGFloat max);

///-----------------------------
/// @name Rectangle Manipulation
///-----------------------------

extern CGRect CGRectSetX(CGRect rect, CGFloat x);
extern CGRect CGRectSetY(CGRect rect, CGFloat y);
extern CGRect CGRectSetWidth(CGRect rect, CGFloat width);
extern CGRect CGRectSetHeight(CGRect rect, CGFloat height);
extern CGRect CGRectSetOrigin(CGRect rect, CGPoint origin);
extern CGRect CGRectSetSize(CGRect rect, CGSize size);
extern CGRect CGRectSetZeroOrigin(CGRect rect);
extern CGRect CGRectSetZeroSize(CGRect rect);
extern CGSize CGSizeAspectScaleToSize(CGSize size, CGSize toSize);
extern CGRect CGRectAddPoint(CGRect rect, CGPoint point);


///---------------------------------
/// @name Drawing Rounded Rectangles
///---------------------------------

extern void YUNDrawRoundedRect(CGContextRef context, CGRect rect, CGFloat cornerRadius);


///-------------------------
/// @name Creating Gradients
///-------------------------

extern CGGradientRef YUNCreateGradientWithColors(NSArray *colors);
extern CGGradientRef YUNCreateGradientWithColorsAndLocations(NSArray *colors, NSArray *locations);


///------------------------
/// @name Drawing Gradients
///------------------------

extern void YUNDrawGradientInRect(CGContextRef context, CGGradientRef gradient, CGRect rect);

