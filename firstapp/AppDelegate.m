//
//  AppDelegate.m
//  firstapp
//
//  Created by Rust Enikeev on 7/4/21.
//

#import "AppDelegate.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.rootViewController = [[LoginViewController alloc] init];

    self.window.rootViewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
