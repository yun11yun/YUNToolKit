//
//  UIImage+YUNToolsKitAdditions.m
//  YUNToolsKit
//
//  Created by Orange on 6/12/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "UIImage+YUNToolsKitAdditions.h"

@implementation UIImage (YUNToolsKitAdditions)

+ (UIImage *)imageNamed:(NSString *)imageName bundleName:(NSString *)bundleName {
    if (!bundleName) {
        return [UIImage imageNamed:imageName];
    }
    
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *bundlePath = [resourcePath stringByAppendingPathComponent:bundleName];
    NSString *imagePath = [bundlePath stringByAppendingPathComponent:imageName];
    return [UIImage imageWithContentsOfFile:imagePath];
}

- (UIImage *)imageCroppedToRect:(CGRect)rect {
    // CGImageCreateWithImageInRect's 'rect' parameter is in pixels of the image's coordinates system. Convert from points.
    CGFloat scale = self.scale;
    rect = CGRectMake(rect.origin.x * scale, rect.origin.y * scale, rect.size.width * scale, rect.size.height * scale);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *cropped = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return cropped;
}

- (UIImage *)squareImage {
    CGSize imageSize = self.size;
    CGFloat shortestSide = fminf(imageSize.width, imageSize.height);
    return [self imageCroppedToRect:CGRectMake(0.0f, 0.0f, shortestSide, shortestSide)];
}

- (NSInteger)rightCapWidth {
    return (NSInteger)self.size.width - (self.leftCapWidth + 1);
}

- (NSInteger)bottomCapHeight {
    return (NSInteger)self.size.height - (self.topCapHeight + 1);
}

@end
