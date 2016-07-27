//
//  UIDevice+YUNToolsKitAdditions.h
//  YUNToolsKit
//
//  Created by Orange on 6/12/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Provides extensions to 'UIDevice' for various common tasks.
 */
@interface UIDevice (YUNToolsKitAdditions)

/**
 Returns 'YES' if the device is a simulator.
 
 @return 'YES' if the device is a simulator and 'NO' if it is not.
 */
- (BOOL)isSimulator;

/**
 Retunrs 'YES' if the device is an iPod touch, iPhone, iPhone 3G , or an iPhone 3GS.
 
 @return 'YES' if the device is crappy and 'NO' if it is not.
 */
- (BOOL)isCrappy;

@end
