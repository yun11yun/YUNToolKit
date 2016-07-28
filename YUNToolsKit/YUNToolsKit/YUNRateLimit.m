//
//  YUNRateLimit.m
//  YUNToolsKit
//
//  Created by Orange on 7/28/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "YUNRateLimit.h"

@interface YUNRateLimit ()
+ (NSMutableDictionary *)_dictionary;
@end

@implementation YUNRateLimit

+ (BOOL)executeBlock:(void (^)(void))block name:(NSString *)name limit:(NSTimeInterval)limit {
    // Prevent a nil block
    if (!block) {
        return NO;
    }
    
    // Lookup last executed
    NSMutableDictionary *dictionary = [self _dictionary];
    NSDate *last = [dictionary objectForKey:name];
    NSTimeInterval timeInterval = [last timeIntervalSinceNow];
    
    // If last excuted is less than the limit, don't execute
    if (timeInterval < 0 && fabs(timeInterval) < limit) {
        return NO;
    }
    
    // Execute
    block();
    [dictionary setObject:[NSDate date] forKey:name];
    return YES;
}

+ (void)resetLimitForName:(NSString *)name {
    [[self _dictionary] removeObjectForKey:name];
}

#pragma mark - Private

+ (NSMutableDictionary *)_dictionary {
    static NSMutableDictionary *dictionary = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dictionary = [[NSMutableDictionary alloc] init];
    });
    return dictionary;
}

@end
