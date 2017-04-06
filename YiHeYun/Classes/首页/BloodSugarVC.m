//
//  BloodSugarVC.m
//  YiHeYun
//
//  Created by mac on 2017/4/5.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BloodSugarVC.h"



@implementation BloodSugarCell

-(void)awakeFromNib{
    [super awakeFromNib];
    _line1View.width = 0.5;
    _line12View.width = 0.5;
    _line3View.width = 0.5;
    _line6View.width = 0.5;
    _line4View.width = 0.5;
    _line5View.width = 0.5;


}

@end

@interface BloodSugarVC ()

@end

@implementation BloodSugarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"血糖";
    _listTabView.tableFooterView = [[UIView alloc]init];
    _listTabView.layer.borderColor= [UIColor lightGrayColor].CGColor;
    _listTabView.layer.borderWidth = 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BloodSugarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BloodSugarCell"];
    [cell setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
