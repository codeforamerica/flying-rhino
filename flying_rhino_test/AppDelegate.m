//
//  AppDelegate.m
//  flying_rhino_test
//
//  Created by Jesse Bounds on 8/31/12.
//  Copyright (c) 2012 rebounds. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    NSLog(@"registering...");
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                                           UIRemoteNotificationTypeSound |
                                                                           UIRemoteNotificationTypeAlert)];
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    
    // Save the token to server
    
    //NSString *urlStr = @"http://4gdc.localtunnel.com/register";
    NSString *urlStr = @"http://flying-pusher.herokuapp.com/register";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    
    NSMutableData *postBody = [NSMutableData data];
    [postBody appendData:[[NSString stringWithFormat:@"&token=%@", [deviceToken description]] dataUsingEncoding:NSUTF8StringEncoding]];

    [req setHTTPMethod:@"POST"];
    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
    [req setHTTPBody:postBody];

    NSData *urlData;
    NSURLResponse *response;
    NSError *requestError;
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    urlData = [NSURLConnection sendSynchronousRequest:req returningResponse:&response error:&requestError];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
//    NSLog(@"%@", deviceToken);
//    NSString *urlString = [NSString stringWithFormat:@"http://flying-pusher.herokuapp.com/register?token=%@", [deviceToken description]];
//    NSString *escapedUrl = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSLog(@"%@", escapedUrl);
//
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:escapedUrl]
//                                                           cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
//                                                       timeoutInterval:10];    
//    [request setHTTPMethod: @"GET"];
//
//    NSData *urlData;
//    NSURLResponse *response;
//    NSError *requestError;
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
//    urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&requestError];
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//    
//    NSLog(@"%@", requestError);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
