//
//  YUNButton.h
//  YUNToolsKit
//
//  Created by Orange on 5/25/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YUNButtonImagePosition)
{
    YUNButtonImagePositionLeft = 0 ,
    YUNButtonImagePositionRight,
};

@interface YUNButton : UIButton

@property (nonatomic, assign) YUNButtonImagePosition imagePosition;

@end
