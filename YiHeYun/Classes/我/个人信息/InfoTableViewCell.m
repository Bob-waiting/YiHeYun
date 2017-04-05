//
//  InfoTableViewCell.m
//  YiHeYun
//
//  Created by 上海尚洪 on 2017/3/29.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "InfoTableViewCell.h"

@implementation InfoTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH-66, 4, 36, 36)];
        _iconImage.layer.cornerRadius = 18;
        _iconImage.layer.masksToBounds = YES;
        _iconImage.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_iconImage];
        
        _contentLab = [[UILabel alloc]initWithFrame:CGRectMake(100, 12, WIDTH-130, 20)];
        _contentLab.font = [UIFont systemFontOfSize:15];
        _contentLab.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_contentLab];
    }
    return self;
}

+(CGFloat)cellHeight:(NSString *)cellInfo{
    CGSize size;
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize: 15]};
    size = [cellInfo boundingRectWithSize:CGSizeMake(WIDTH-50, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil ].size;
    CGFloat height = size.height+26;
    return height;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
