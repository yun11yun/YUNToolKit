//
//  NSMutableArray+YUNToolsKitAdditions.h
//  YUNToolsKit
//
//  Created by Orange on 6/8/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (YUNToolsKitAdditions)

/**
 Shuffles the elements of this array in-place using the Fisher-Yates algorithm
 */
- (void)shuffle;

@end
