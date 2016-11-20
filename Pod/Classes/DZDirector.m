//
//  DZScene.m
//  Pods
//
//  Created by stonedong on 16/3/27.
//
//

#import "DZDirector.h"
#import "EKElement.h"
@implementation DZDirector
@synthesize rootScene = _rootScene;
@synthesize keyWindow = _keyWindow;

- (instancetype) initWithRootScene:(EKElement *)rootScene
{
    self = [super init];
    if (!self) {
        return self;
    }
    _rootScene = rootScene;
    return self;
}

- (void) loadRootScene
{
    
}

- (BOOL) firstLanchAfterInstalled
{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSNumber* luandch = [defaults objectForKey:@"first-luanched"];
    if (!luandch) {
        [defaults setObject:@(YES) forKey:@"first-luanched"];
        [defaults synchronize];
        return YES;
    } else {
        return NO;
    }
}
- (EKElement*) rootScene
{
    if (!_rootScene) {
        [self loadRootScene];
    }
    return _rootScene;
}

- (UIViewController*) rootViewController
{
    return (UIViewController*)self.keyWindow.rootViewController;
}
- (UIWindow*) keyWindow
{
    if (!_keyWindow) {
        _keyWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        UIViewController* rootVC = [[self rootScene] createResponser];
        NSAssert([rootVC isKindOfClass:[UIViewController class]], @"the root scene's responser must be an ViewController, but it got %@", rootVC);
        _keyWindow.rootViewController = rootVC;
        [_keyWindow makeKeyAndVisible];
    }
    return _keyWindow;
}

- (void) makeKeyWindowAndVisible
{
    [self keyWindow];
}

- (void) changeScene:(EKElement*)scene animated:(BOOL)animated completion:(void(^)())completion
{
    UIViewController* currentVC = (UIViewController*)self.rootScene.uiEventPool;
    UIViewController* nextVC = [scene createResponser];
    [UIView transitionFromView:currentVC.view toView:nextVC.view duration:0.25 options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished) {
        _rootScene = scene;
        _keyWindow.rootViewController = nextVC;
    }];
}

- (void) changeViewController:(UIViewController*)vc scene:(EKElement*)scene  animated:(BOOL)animated completion:(void(^)())completion
{
    UIViewController* currentVC = (UIViewController*)self.rootScene.uiEventPool;
    UIViewController* nextVC = vc;
    [UIView transitionFromView:currentVC.view toView:nextVC.view duration:0.25 options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished) {
        _rootScene = scene;
        _keyWindow.rootViewController = nextVC;
    }];
}
@end
