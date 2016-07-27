//
//  UIViewController+YUNToolsKitAdditions.m
//  YUNToolsKit
//
//  Created by Orange on 6/12/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "UIViewController+YUNToolsKitAdditions.h"

@implementation UIViewController (YUNToolsKitAdditions)

- (void)displayError:(NSError *)error {
    if (!error) {
        return;
    }
    
    [self displayErrorString:[error localizedDescription]];
}

- (void)displayErrorString:(NSString *)string {
    if (!string || [string length] < 1) {
        return;
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:string delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
