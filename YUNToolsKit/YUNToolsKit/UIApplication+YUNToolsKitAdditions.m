//
//  UIApplication+YUNToolsKitAdditions.m
//  YUNToolsKit
//
//  Created by Orange on 6/12/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "UIApplication+YUNToolsKitAdditions.h"

@interface UIApplication (MSPrivateAdditions)
- (void)_setNetworkActivityWithNumber:(NSNumber *)number;
- (void)_setNetworkActivityIndicatorHidden;
@end

@implementation UIApplication (MSPrivateAdditions)

- (void)_setNetworkActivityWithNumber:(NSNumber *)number {
    [self setNetworkActivity:[number boolValue]];
}

- (void)_setNetworkActivityIndicatorHidden {
    self.networkActivityIndicatorVisible = NO;
}

@end

@implementation UIApplication (YUNToolsKitAdditions)

- (BOOL)isPirated {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"SignerIdentity"] != nil;
}

- (void)setNetworkActivity:(BOOL)inProgress {
    // Ensure we're on the main thread
    if ([NSThread isMainThread] == NO) {
        [self performSelectorOnMainThread:@selector(_setNetworkActivityWithNumber:) withObject:[NSNumber numberWithBool:inProgress] waitUntilDone:NO];
        return;
    }
    
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(_setNetworkActivityIndicatorHidden) object:nil];
    
    if (inProgress == YES) {
        if (self.networkActivityIndicatorVisible == NO) {
            self.networkActivityIndicatorVisible = inProgress;
        }
    } else {
        [self performSelector:@selector(_setNetworkActivityIndicatorHidden) withObject:nil afterDelay:0.3];
    }
}

- (NSURL *)documentsDirectoryURL {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


- (NSURL *)cachesDirectoryURL {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSURL *)downloadsDirectoryURL {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDownloadsDirectory inDomains:NSUserDomainMask] lastObject];
}


- (NSURL *)libraryDirectoryURL {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask] lastObject];
}


- (NSURL *)applicationSupportDirectoryURL {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
}


@end
