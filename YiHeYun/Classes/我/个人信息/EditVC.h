//
//  EditVC.h
//  YueYueMusic
//
//  Created by 上海尚洪 on 16/8/10.
//  Copyright © 2016年 上海尚洪. All rights reserved.
//

#import "BaseVC.h"

@protocol EditVCDeleget <NSObject>

-(void)endEditMeInfo:(NSString *)info andInRow:(NSInteger)row;

@end
@interface EditVC : BaseVC

@property(nonatomic,assign)id<EditVCDeleget>delegate;
@property (nonatomic,strong)UserInfo *userInfo;
@property(nonatomic,assign)NSInteger row;

@end
