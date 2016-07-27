//
//  UIViewController+YUNToolsKitAdditions.h
//  YUNToolsKit
//
//  Created by Orange on 6/12/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Provides extensions to 'UIViewController' for varous common tasks.
 */
@interface UIViewController (YUNToolsKitAdditions)

/**
 Present a 'UIAlertController' with an error message.
 
 
 @param error Error to present.
 */
- (void)displayError:(NSError *)error;

/**
 *  Present a 'UIAlertController' with an error message.
 *
 *  @param string Error string to present
 */
- (void)displayErrorString:(NSString *)string;

@end
