//
//  NSURL+YUNToolsKitAdditions.m
//  YUNToolsKit
//
//  Created by Orange on 6/8/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "NSURL+YUNToolsKitAdditions.h"

@implementation NSURL (YUNToolsKitAdditions)

+ (NSURL *)URLWithFormat:(NSString *)format, ... {
    va_list vaArgument;
    va_start(vaArgument, format);
    NSString *string = [[NSString alloc] initWithFormat:format arguments:vaArgument];
    va_end(vaArgument);
    
    return [NSURL URLWithString:string];
}

- (NSDictionary *)queryDictionary {
    return nil;
}

@end
