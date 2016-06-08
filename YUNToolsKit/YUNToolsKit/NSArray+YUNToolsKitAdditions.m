//
//  NSArray+YUNToolsKitAdditions.m
//  YUNToolsKit
//
//  Created by Orange on 6/8/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "NSArray+YUNToolsKitAdditions.h"
#import "NSMutableArray+YUNToolsKitAdditions.h"
#import "NSData+YUNToolsKitAdditions.h"

@interface NSArray (YUNToolsKitPrivateAdditions)
- (NSData *)_prehashData;
@end

@implementation NSArray (YUNToolsKitAdditions)

- (id)randomObject {
    return [self objectAtIndex:arc4random_uniform((uint32_t)[self count])];
}

- (NSArray *)shuffledArray {
    NSMutableArray *array = [self mutableCopy];
    [array shuffle];
    return array;
}

- (NSMutableArray *)deepMutableCopy {
    return (__bridge_transfer NSMutableArray *)CFPropertyListCreateDeepCopy(kCFAllocatorDefault, (__bridge CFArrayRef)self, kCFPropertyListMutableContainers);
}

- (NSString *)MD5Sum {
    return [[self _prehashData] MD5Sum];
}

- (NSString *)SHA1Sum {
    return [[self _prehashData] SHA1Sum];
}

@end

@implementation NSArray (YUNToolsKitPrivateAdditions)

- (NSData *)_prehashData {
    return [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListBinaryFormat_v1_0 options:0 error:nil];
}

@end