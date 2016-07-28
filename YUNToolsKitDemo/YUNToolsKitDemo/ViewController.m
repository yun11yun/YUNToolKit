//
//  ViewController.m
//  YUNToolsKitDemo
//
//  Created by Orange on 7/28/16.
//  Copyright © 2016 colorcun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YUNButton *button = [[YUNButton alloc] init];
    button.imagePosition = YUNButtonImagePositionLeft;
    button.frame = CGRectMake(0, 0, 100, 44);
    button.center = self.view.center;
    button.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:1.0].CGColor;
    button.layer.borderWidth = 1.0;
    button.layer.cornerRadius = 3.0f;
    button.layer.masksToBounds = YES;
    [self.view addSubview:button];
    
    UIColor *greenColor = [UIColor greenColor];
    NSString *hexColor = [greenColor hexValue];
    NSLog(@"hexColor -- %@", hexColor);
}

@end
