//
//  DZApplication.h
//  Pods
//
//  Created by stonedong on 16/8/20.
//
//

#import <UIKit/UIKit.h>
#import "DZDirector.h"
@interface DZApplication : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic, readonly) UIWindow *window;
@property (nonatomic, strong) DZDirector*  director;
@end


#pragma SubClass the subclass of DZApplication must implitation - (void) loadDirector
@interface DZApplication ()
- (void) loadDirector;
@end