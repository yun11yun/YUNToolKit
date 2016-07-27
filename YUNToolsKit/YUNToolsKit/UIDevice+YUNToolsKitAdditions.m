//
//  UIDevice+YUNToolsKitAdditions.m
//  YUNToolsKit
//
//  Created by Orange on 6/12/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "UIDevice+YUNToolsKitAdditions.h"

@implementation UIDevice (YUNToolsKitAdditions)

- (BOOL)isSimulator {
    static NSString *simulatorModel = @"iPhone Simulator";
    return [[self model] isEqualToString:simulatorModel];
}

- (BOOL)isCrappy {
    static NSString *iPodTouchModel = @"iPod touch";
    static NSString *iPhoneModel = @"iPhone";
    static NSString *iPhone3GModel = @"iPhone 3G";
    static NSString *iPhone3GSModel = @"iPhone 3GS";
    
    NSString *model = [self model];
    
    return ([model isEqualToString:iPodTouchModel] || [model isEqualToString:iPhoneModel] || [model isEqualToString:iPhone3GModel] || [model isEqualToString:iPhone3GSModel]);
}

@end
