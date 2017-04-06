//
//  addCase_PhotoCollectionViewCell.m
//  addCaseDemo
//
//  Created by 金波 on 2017/3/29.
//  Copyright © 2017年 Bob. All rights reserved.
//

#import "addCase_PhotoCollectionViewCell.h"

@implementation addCase_PhotoCollectionViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setImage:(UIImage *)image
{
    _photoImage.image=image;
}
@end
