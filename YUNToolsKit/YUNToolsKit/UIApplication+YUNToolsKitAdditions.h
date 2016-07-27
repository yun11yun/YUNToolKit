//
//  UIApplication+YUNToolsKitAdditions.h
//  YUNToolsKit
//
//  Created by Orange on 6/12/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Provides extensions to 'UIApplication' for various common tasks.
 */
@interface UIApplication (YUNToolsKitAdditions)

///------------------
/// @name Directories
///------------------

/**
 Returns the file URL of the documents directory.
 */
@property (nonatomic, strong, readonly) NSURL *documentsDirectoryURL;

/**
 Returns the file URL of the caches directory.
 */
@property (nonatomic, strong, readonly) NSURL *cachesDirectoryURL;

/**
 Returns the file URL of the downloads directory;
 */
@property (nonatomic, strong, readonly) NSURL *downloadsDirectoryURL;

/**
 Returns the file URL of the application support directory.
 */
@property (nonatomic, strong, readonly) NSURL *libraryDirectoryURL;

/**
 Returns the file URL of the application support directory.
 */
@property (nonatomic, strong, readonly) NSURL *applicationSupportDirectoryURL;

///----------------
/// @name Utilities
///----------------

/**
 Aggregates calls to settings 'networkActivityIndicatorVisiblle' to avoid flashing of the indicator in the status bar.
 Simply use 'setNetworkActivity:' instead of 'setNetworkActivityIndicatorVisible:'.
 
 Specify 'YES' if the application should show network activity and 'NO' if it should not. The default value is 'NO'.
 A spinning indicator in the status bar shows network activity. The application may explicitly hide or show this 
 indicator.
 
 @param inProgress A Boolean value that turns an indicator of network activity on or off.
 */
- (void)setNetworkActivity:(BOOL)inProgress;

/**
 Checks for pirated application indicators.
 
 This isn't bulletproof, but should catch a lot of cases.
 
 @return 'YES' if the application may be pirated. 'NO' if it is probablye not pirated.
 */
- (BOOL)isPirated;

@end
