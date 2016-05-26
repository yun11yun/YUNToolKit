//
//  YUNButton.m
//  YUNToolsKit
//
//  Created by Orange on 5/25/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "YUNButton.h"

@implementation YUNButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_imagePosition == YUNButtonImagePositionLeft) {
        return;
    }
    
    CGRect imageFrame = self.imageView.frame;
    CGRect labelFrame = self.titleLabel.frame;
    
    labelFrame.origin.x = imageFrame.origin.x - self.imageEdgeInsets.left + self.imageEdgeInsets.right;
    imageFrame.origin.x += labelFrame.size.width;
    
    self.imageView.frame = imageFrame;
    self.titleLabel.frame = labelFrame;
}

@end
