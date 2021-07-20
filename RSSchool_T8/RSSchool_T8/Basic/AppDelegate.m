//
//  AppDelegate.m
//  RSSchool_T8
//
//  Created by Mikita Shalima on 19.07.21.
//

#import "AppDelegate.h"
#import "ArtistViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UINavigationController *rootViewController = [UINavigationController new];
    
    ArtistViewController *artistConroller = [ArtistViewController new];
    
    rootViewController.viewControllers = @[artistConroller];
    
    [window setRootViewController:rootViewController];
    self.window = window;
    [self.window makeKeyAndVisible];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle

@end
