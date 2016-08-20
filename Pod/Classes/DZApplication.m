//
//  DZApplication.m
//  Pods
//
//  Created by stonedong on 16/8/20.
//
//

#import "DZApplication.h"

@implementation DZApplication
@synthesize director = _director;

- (UIWindow*) window
{
    return self.director.keyWindow;
}
- (void) loadDirector
{
    
}
- (DZDirector*) director
{
    if (!_director) {
        [self  loadDirector];
    }
    return _director;
}
- (void) applicationDidFinishLaunching:(UIApplication *)application
{
    [self.director makeKeyWindowAndVisible];
}
@end
