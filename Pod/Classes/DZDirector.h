//
//  DZScene.h
//  Pods
//
//  Created by stonedong on 16/3/27.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class EKElement;
@interface DZDirector : NSObject
@property (nonatomic, assign, readonly) BOOL firstLanchAfterInstalled;
@property (nonatomic, strong, readonly) UIViewController* rootViewController;
@property (nonatomic, strong, readonly)EKElement * rootScene;
@property (nonatomic, strong, readonly) UIWindow* keyWindow;
- (instancetype) init  UNAVAILABLE_ATTRIBUTE;
- (instancetype) initWithRootScene:(EKElement*)rootScene NS_DESIGNATED_INITIALIZER;
- (void) makeKeyWindowAndVisible;
- (void) changeScene:(EKElement*)scene animated:(BOOL)animated completion:(void(^)())completion;
- (void) changeViewController:(UIViewController*)vc scene:(EKElement*)scene  animated:(BOOL)animated completion:(void(^)())completion;
//
- (void) willUpdateFromVersion:(NSString*)version toVersion:(NSString*)toversion;
@end



#pragma SubClass
@interface DZDirector()
- (void) loadRootScene;
@end
