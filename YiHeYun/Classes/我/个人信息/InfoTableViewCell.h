//
//  InfoTableViewCell.h
//  YiHeYun
//
//  Created by 上海尚洪 on 2017/3/29.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *iconImage;
@property(nonatomic,strong)UILabel *contentLab;

+(CGFloat)cellHeight:(NSString *)cellInfo;
@end
