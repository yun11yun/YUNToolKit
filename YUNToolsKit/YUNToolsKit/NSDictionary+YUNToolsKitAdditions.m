//
//  NSDictionary+YUNToolsKitAdditions.m
//  YUNToolsKit
//
//  Created by Orange on 6/8/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "NSDictionary+YUNToolsKitAdditions.h"
#import "NSString+YUNToolsKitAdditions.h"
#import "NSData+YUNToolsKitAdditions.h"

@interface NSDictionary (YUNToolsKitPrivateAdditions)
- (NSData *)_prehashData;
@end

@implementation NSDictionary (YUNToolsKitAdditions)

+ (NSDictionary *)dictionaryWithFormEncodedString:(NSString *)encodedString {
    if (!encodedString) {
        return nil;
    }
    
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    NSArray *pairs = [encodedString componentsSeparatedByString:@"&"];
    
    for (NSString *kvp in pairs) {
        if ([kvp length] == 0) {
            continue;
        }
        
        NSRange pos = [kvp rangeOfString:@"="];
        NSString *key;
        NSString *value;
        
        if (pos.location == NSNotFound) {
            key = [kvp stringByUnescapingFromURLQuery];
            value = @"";
        } else {
            key = [[kvp substringFromIndex:pos.location] stringByUnescapingFromURLQuery];
            value = [[kvp substringFromIndex:pos.location + pos.length] stringByUnescapingFromURLQuery];
        }
        
        if (!key || !value) {
            continue; // I'm sure this will bite my arse one day
        }
        
        [result setObject:value forKey:key];
    }
    return result;
}

- (NSString *)stringWithFormEncodedComponents {
    NSMutableArray *arguments = [NSMutableArray arrayWithCapacity:[self count]];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop) {
        [arguments addObject:[NSString stringWithFormat:@"%@=%@",
                              [key stringByEscapingForURLQuery],
                              [[object description] stringByEscapingForURLQuery]]];
    }];
    
    return [arguments componentsJoinedByString:@"&"];
}


- (NSMutableDictionary *)deepMutableCopy {
    return (__bridge_transfer NSMutableDictionary *)CFPropertyListCreateDeepCopy(kCFAllocatorDefault, (__bridge CFDictionaryRef)self, kCFPropertyListMutableContainers);
}


- (NSString *)MD5Sum {
    return [[self _prehashData] MD5Sum];
}


- (NSString *)SHA1Sum {
    return [[self _prehashData] SHA1Sum];
}

@end


@implementation NSDictionary (YUNToolsKitPrivateAdditions)

- (NSData *)_prehashData {
    return [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListBinaryFormat_v1_0 options:0 error:nil];
}


@end
