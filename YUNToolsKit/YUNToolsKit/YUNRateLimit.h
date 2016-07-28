//
//  YUNRateLimit.h
//  YUNToolsKit
//
//  Created by Orange on 7/28/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YUNRateLimit : NSObject

/**
 *  Executes the given block. If the block has been executed in less time than the limit, it will not be executed.
 *
 *  @param block The block to be excuted. This should not be 'nil'.
 *  @param name  A string identifying the block. If more than one block have the same name, their last executed time will be stored together.
 *  @param limit The time interval (in seconds). This should be a positive, non-zero value.
 *
 *  @return 'YES' if the block was executed. 'NO' if it was not.
 *
 *  The time will not be persisted across application launches (for now). The block is synchronously executed on the same
 *  thread that called this method and not in a GCD queue. If you need to dispatch, simply do that in the block you provide.
 */
+ (BOOL)executeBlock:(void(^)(void))block name:(NSString *)name limit:(NSTimeInterval)limit;

/**
 *  Resets the time for a given name.
 *
 *  @param name A string identifying a block's stored time.
 *
 *  The next time a block with the same name is passed to 'executeBlock:name:limit:' it will be executed.
 */
+ (void)resetLimitForName:(NSString *)name;

@end
