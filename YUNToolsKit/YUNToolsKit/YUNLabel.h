//
//  YUNLabel.h
//  YUNToolsKit
//
//  Created by Orange on 4/29/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  The vertical alignment of text within a label.
 */
typedef NS_ENUM(NSInteger) {
    /**
     *  Aligns the text vertically at the top in the label (the default).
     */
    YUNLabelVerticalTextAlignmentTop = UIControlContentVerticalAlignmentTop,
    
    /**
     *  Aligns the text vertically in the center of the label.
     */
    YUNLabelVerticalTextAlignmentMiddle = UIControlContentVerticalAlignmentCenter,
    
    /**
     *  Aligns the textt vertically at the bottom in the label.
     */
    YUNLabelVerticalTextAlignmentBottom = UIControlContentVerticalAlignmentBottom
    
} YUNLabelVerticalTextAlignment;

/**
 *  Simple label subclass that adds the ability to align your text to the top or bottom.
 */
@interface YUNLabel : UILabel

/**
 *  The vertical text alignment of the receiver.
 *  The default is 'YUNLabelVerticalTextAlignmentMiddle' to match ''UILabel.
 */
@property (nonatomic, assign) YUNLabelVerticalTextAlignment verticalTextAlignment;

/**
 *  The edge insets of the text.
 *  The default is 'UIEdgeInsetsZero' so it behaves like ''UILabel' by default.
 */
@property (nonatomic, assign) UIEdgeInsets textEdgeInsets;

@end
