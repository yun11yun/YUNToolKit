//
//  YUNWebView.h
//  YUNToolsKit
//
//  Created by Orange on 6/8/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YUNWebViewDelegate;

/**
 This class pushes UIWebView to its limits and many common and usually difficult tasks very simple.
 
 Note that this class doesn't actually inherit from UIWebView, but instead forwards all of UIWebView's public methods to 
 an internal instance. It has been designed to be a drop in replacement for UIWebView.
 
 
 Things of interest are the YUNWebView properties and the extra 'delegate' methods
 */
@interface YUNWebView : UIView <UIWebViewDelegate>

/**
 A Boolean value that controls whether the web view draws shadows around the outside of its content.
 
 If the value of this properties is 'YES', the web view will the shadows around the outside of its content. If the value
 is 'NO', shadows will be displayed like normal. The default value is 'NO'.
 
 Note
 */
@property (nonatomic, assign) BOOL shadowsHidden;

/**
 The receiver's 'delegate'.
 
 The 'delegate' is sent messages when content is loading.
 */
@property (nonatomic, assign) id<YUNWebViewDelegate> delegate;

/**
 *  Sets the main page contents, MIME type, content encoding, and base URL.
 *
 *  @param data             The content for the main page.
 *  @param MIMEType         The MIME type of the content.
 *  @param textEncodingName The IANA encoding name as in utl-8 or utf-16.
 *  @param baseURL          The base URL for the content.
 */
- (void)loadData:(NSData *)data MIMEType:(NSString *)MIMEType textEncodingName:(NSString *)textEncodingName baseURL:(NSURL *)baseURL;

/**
 *  Sets the main page content and base URL.
 *
 *  @param string  The content for the main page.
 *  @param baseURL The base URL for the content.
 */
- (void)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL;

/**
 *  Connects to a given URL by initiating an asynchronous client request.
 *
 *  To stop this load, use the stoploading method. To see whether the receiver is done loading the content, use the loading property.
 *
 *  @param request A URL request identifying the location of the content to load.
 */
- (void)loadRequest:(NSURLRequest *)request;

/**
 *  Sets the main page content
 *
 *  The baseURL is set to 'http://localhost'.
 *
 *  @param string The content for the main page.
 */
- (void)loadHTMLString:(NSString *)string;

/**
 *  Connects to a given URL by initiating an asynchronous client request.
 *
 *  To stop this load, use the stopLoading method. To see whether the receiver is done loading the content, use the loading property.
 *
 *  @param URL A URL identifying the location of the content to load.
 */
- (void)loadURL:(NSURL *)URL;

/**
 *  Connects to a given URL by initiating an asynchronous client request.
 *
 *  To stop this load, use the stopLoading method. To see whether the receiver is done loading the content, use the loading property.
 *
 *  @param string A string containing a URL identifying the location of the content to load.
 */
- (void)loadURLString:(NSString *)string;

// The URL request identifying the location of the content to load. (read-only)
@property (nonatomic, strong, readonly) NSURLRequest *request;

// The last NSURLRequest that the web view loaded. (read-only)
@property (nonatomic, strong, readonly) NSURLRequest *lastRequest;

// A Boolean value indicating whether the receiver is done loading content.
// If 'YES', the receiver is still loading content; ootherwise, 'NO'.
@property (nonatomic, readonly, getter=isLoading) BOOL loading;

// Returns whether the web view is loading a page (read-only)
// This will return 'YES' when the first NSURLRequest starts and 'NO' when there are no more reqeusts loading.
// Note: Setting this isn't 100% reliable since it is very hacky underneath.
@property (nonatomic, readonly, getter=isLoadingPage) BOOL loadingPage;

/**
 Stops the loading of any web content managed by the receiver.
 
 Stops any content in the process of being loaded by the main frame or any of its children frames. Does nothing if no content is being loaded.
 */
- (void)stopLoading;

/**
 *  Reloads the current page.
 */
- (void)reload;

/**
 A Boolean value indicating whether the receiver can move backward. (read-only)
 
 If `YES`, able to move backward; otherwise, `NO`.
 */
@property (nonatomic, readonly) BOOL canGoBack;

/**
 A Boolean value indicating whether the receiver can move forward. (read-only)
 
 If `YES`, able to move forward; otherwise, `NO`.
 */
@property (nonatomic, readonly) BOOL canGoForward;

/**
 Loads the previous location in the back-forward list.
 */
- (void)goBack;

/**
 Loads the next location in the back-forward list.
 */
- (void)goForward;


///-------------------------------------
/// @name Setting Web Content Properties
///-------------------------------------

/**
 A Boolean value determining whether the webpage scales to fit the view and the user can change the scale.
 
 If `YES`, the webpage is scaled to fit and the user can zoom in and zoom out. If `NO`, user
 zooming is disabled. The default value is `NO`.
 */
@property (nonatomic, assign) BOOL scalesPageToFit;

/**
 The scroll view associated with the web view. (read-only)
 
 Your application can access the scroll view if it wants to customize the scrolling behavior of the web view.
 */
@property (nonatomic, strong, readonly) UIScrollView *scrollView;


///-------------------------
/// @name Running JavaScript
///-------------------------

/**
 Returns the result of running a script.
 
 JavaScript execution time is limited to 10 seconds for each top-level entry point. If your script executes for more
 than 10 seconds, the web view stops executing the script. This is likely to occur at a random place in your code, so
 unintended consequences may result. This limit is imposed because JavaScript execution may cause the main thread to
 block, so when scripts are running, the user is not able to interact with the webpage.
 
 JavaScript allocations are also limited to 10 MB. The web view raises an exception if you exceed this limit on the
 total memory allocation for JavaScript.
 
 @param script The script to run.
 
 @return The result of running script or `nil` if it fails.
 */
- (NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script;


///-----------------------------------
/// @name Using the JavaScript Console
///-----------------------------------

/**
 A Boolean value that controls whether `console.log` messages are intercepted.
 
 If the value of this property is `YES`, the web view will inject some JavaScript after the DOM has loaded that replaces
 `console.log` with a custom implementation that will NSLog the `console.log` messages.
 
 Note: This isn't 100% reliable since it is very hacky underneath.
 */
@property (nonatomic, assign) BOOL consoleEnabled;


///------------------------------
/// @name Detecting Types of Data
///------------------------------

/**
 The types of data converted to clickable URLs in the web view's content.
 
 You can use this property to specify the types of data (phone numbers, http links, email address, and so on) that
 should be automatically converted to clickable URLs in the web view. When clicked, the web view opens the application
 responsible for handling the URL type and passes it the URL.
 */
@property (nonatomic, assign) UIDataDetectorTypes dataDetectorTypes;


///------------------------------
/// @name Managing Media Playback
///------------------------------

/**
 A Boolean value that determines whether HTML5 videos play inline or use the native full-screen controller.
 
 The default value on iPhone is `NO`.
 */
@property (nonatomic, assign) BOOL allowsInlineMediaPlayback;

/**
 A Boolean value that determines whether HTML5 videos can play automatically or require the user to start playing them.
 
 The default value on both iPad and iPhone is `YES`.
 */
@property (nonatomic, assign) BOOL mediaPlaybackRequiresUserAction;


///--------------------------------
/// @name Interacting with Controls
///--------------------------------

/** Uses JavaScript to remove focus from the active element.
 
 If the receiver is in a modal `UIViewController` with the `modalPresentationStyle` `UIModalPresentationFormSheet`,
 it will not dismiss the keyboard due to how `UIModalPresentationFormSheet` works.
 */
- (void)dismissKeyboard;

/** Removes the text selection in the web view.
 
 Using Javascript to this doesn't always work as expected. This method will correctly remove the text selection.
 */
- (void)removeTextSelection;


///----------------------
/// @name Resetting State
///----------------------

/**
 Destroys the internal `UIWebView` and recreates.
 
 All of the properties are maintained across the reset.
 */
- (void)reset;

@end


@protocol YUNWebViewDelegate <NSObject>

@optional

/**
 Sent before a web view begins loading a page.
 
 @param aWebView The web view that started loading its page.
 
 @see webViewDidFinishLoadingPage:
 @see webViewDidLoadDOM:
 @see webViewDidStartLoad:
 */
- (void)webViewDidStartLoadingPage:(YUNWebView *)aWebView;

/**
 Sent after a web view finishes loading its DOM.
 
 Note: This isn't 100% reliable.
 
 @param aWebView The web view that finished loading its DOM.
 
 @see webViewDidStartLoadingPage:
 @see webViewDidFinishLoadingPage:
 */
- (void)webViewDidLoadDOM:(YUNWebView *)aWebView;

/**
 Sent after a web view finishes loading a page.
 
 @param aWebView The web view that finished loading its page.
 
 @see webViewDidStartLoadingPage:
 @see webViewDidLoadDOM:
 @see webViewDidFinishLoad:
 */
- (void)webViewDidFinishLoadingPage:(YUNWebView *)aWebView;


///----------------------
/// @name Loading Content
///----------------------

/**
 Sent if a web view failed to load a frame.
 
 @param aWebView The web view that failed to load a frame.
 
 @param error The error that occurred during loading.
 
 @see webView:shouldStartLoadWithRequest:navigationType:
 @see webViewDidStartLoad:
 @see webViewDidFinishLoad:
 */
- (void)webView:(YUNWebView *)aWebView didFailLoadWithError:(NSError *)error;

/**
 Sent before a web view begins loading a frame.
 
 @param aWebView The web view that is about to load a new frame.
 
 @param aRequest The content location.
 
 @param navigationType The type of user action that started the load request.
 
 @see webViewDidStartLoad:
 @see webViewDidFinishLoad:
 @see webView:didFailLoadWithError:
 */
- (BOOL)webView:(YUNWebView *)aWebView shouldStartLoadWithRequest:(NSURLRequest *)aRequest navigationType:(UIWebViewNavigationType)navigationType;

/**
 Sent after a web view finishes loading a frame.
 
 @param aWebView The web view has finished loading.
 
 @see webView:shouldStartLoadWithRequest:navigationType:
 @see webViewDidStartLoad:
 @see webView:didFailLoadWithError:
 */
- (void)webViewDidFinishLoad:(YUNWebView *)aWebView;

/**
 Sent after a web view starts loading a frame.
 
 @param aWebView The web view that has begun loading a new frame.
 
 @see webView:shouldStartLoadWithRequest:navigationType:
 @see webViewDidFinishLoad:
 @see webView:didFailLoadWithError:
 */
- (void)webViewDidStartLoad:(YUNWebView *)aWebView;

@end