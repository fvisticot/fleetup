#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "GoogleMaps/GoogleMaps.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  // Override point for customization after application launch.
    [GMSServices provideAPIKey:@"AIzaSyDSoD21cMifOom7oHfqrNnCydntDBGGCE8"];
    [GeneratedPluginRegistrant registerWithRegistry:self];
    
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
