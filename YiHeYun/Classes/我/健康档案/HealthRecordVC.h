//
//  HealthRecordVC.h
//  YiHeYun
//
//  Created by Ink on 2017/3/28.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BaseVC.h"

@protocol SlideSwitchSubviewDelegate <NSObject>
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
-(void)showToast:(NSString *)message;
@end

@interface HealthRecordVC : BaseVC

@end
