//
//  YUNLoadingView.h
//  YUNToolsKit
//
//  Created by Orange on 6/1/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 An easy view to show loading similar to the loading screens in the iTunes or App Store applications. The view is 
 intended to cover another view while it is loading and the removed once loading is complete.
 
 This view will automatically center the text and the activity indicator.
 */
@interface YUNLoadingView : UIView

/**
 The text label that is displayed to the user.
 */
@property (nonatomic, strong, readonly) UILabel *textLabel;

/**
 A view that indicates loading activity to the user. (read-only)
 */
@property (nonatomic, strong, readonly) UIActivityIndicatorView *activityIndicatorView;

@end
