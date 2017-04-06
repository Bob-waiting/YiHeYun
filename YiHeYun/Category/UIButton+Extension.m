//
//  UIButton+Extension.m
//  YiHeYun
//
//  Created by Ink on 2017/3/30.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

-(void)adjustToVerticalLayout:(CGSize)buttonSize {
  CGSize imageSize = self.imageView.bounds.size;
  CGSize titleSize = self.titleLabel.bounds.size;


  self.titleEdgeInsets = UIEdgeInsetsMake(buttonSize.height - titleSize.height,-imageSize.width, 0, 0);
  self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -titleSize.width);
  self.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
}

@end
