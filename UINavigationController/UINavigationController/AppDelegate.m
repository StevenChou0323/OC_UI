//
//  AppDelegate.m
//  UINavigationController
//
//  Created by 周建宏 on 2018/3/31.
//  Copyright © 2018年 周建宏. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //http://www.ryanwright.me/cookbook/apple-developer/ios/obj-c/ui-library/uinavigationcontrolle/set-root-controller
    //set the window object
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //NOTE WE NEED TO CREATE AN INSTANCE OF A VIEW TO LOAD
    //create an instance of our view controller that
    //METHOD #1 - empty view
    //this will create an empty view(black) which we can them customize in the ViewDidLoad Method
    ViewController *viewController = [[ViewController alloc] init];
    
    //METHOD #2 - Load View Using A XIB File
    //if we designed our view on a XIB file we could instantiate our with it.
    //ViewController *viewController = [[ViewController alloc] initWithNibName:@"MainView" bundle:nil];
    
    //METHOD #3 - Load A StoryBoard ViewController
    //if we designed our view on the storyboard
    //ViewController *myViewController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil]
    //                                  instantiateViewControllerWithIdentifier:@"firstView"]
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    //set our controller as the root controller(initial controller)
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
