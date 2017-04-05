//
//  PersonInfoVC.m
//  YiHeYun
//
//  Created by 上海尚洪 on 2017/3/29.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "PersonInfoVC.h"
#import "EditVC.h"
#import "InfoTableViewCell.h"
@interface PersonInfoVC ()<UITableViewDataSource, UITableViewDelegate,EditVCDeleget>

@property(nonatomic,strong)UITableView *myTableView;
@property(nonatomic,strong)NSArray *typeArray;
@property(nonatomic,strong)NSArray *contentArray;
@property(nonatomic,strong)InfoTableViewCell *infoTableViewCell;
@end

@implementation PersonInfoVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}
-(void)initData{
    _typeArray=@[@"头像",@"昵称",@"手机",@"性别",@"年龄",@"体重",@"身高",@"步长",@"紧急联系人",@"家庭住址",@"收货地址"];
    _contentArray=@[@"",@"苏格拉底",@"137****8888",@"女",@"18岁",@"60kg",@"170cm",@"40cm",@"大外甥",@"湖南省长沙市 芙蓉区 东二环二段368号上东辛顿公寓被动101",@"刘德华 18899997777\n湖南省长沙市 芙蓉区 东二环二段368号上东辛顿"];
}
-(void)initView{
    self.title=@"个人信息";
    
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64) style:UITableViewStyleGrouped];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    [_myTableView registerClass:[InfoTableViewCell class] forCellReuseIdentifier:@"InfoTableViewCellMark"];
    [self.view addSubview:_myTableView];
}
#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _infoTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"InfoTableViewCellMark"];
    _infoTableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    _infoTableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    _infoTableViewCell.textLabel.font = [UIFont systemFontOfSize:15];
    if (indexPath.row==0) {
        _infoTableViewCell.textLabel.text = _typeArray[indexPath.row];
        _infoTableViewCell.contentLab.hidden=YES;
        _infoTableViewCell.iconImage.hidden=NO;
    }else if(indexPath.row>0&&indexPath.row<9){
        _infoTableViewCell.textLabel.text = _typeArray[indexPath.row];
        _infoTableViewCell.contentLab.text= _contentArray[indexPath.row];
        _infoTableViewCell.contentLab.hidden=NO;
        _infoTableViewCell.iconImage.hidden=YES;
    }else{
        _infoTableViewCell.textLabel.text = [NSString stringWithFormat:@"%@\n%@",_typeArray[indexPath.row],_contentArray[indexPath.row]];
        _infoTableViewCell.textLabel.numberOfLines=0;
        _infoTableViewCell.contentLab.hidden=YES;
        _infoTableViewCell.iconImage.hidden=YES;
    }
    return _infoTableViewCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row>8) {
        return  [InfoTableViewCell cellHeight:[NSString stringWithFormat:@"%@\n%@",_typeArray[indexPath.row],_contentArray[indexPath.row]]];
    }
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        
    }else if(indexPath.row>0){
        EditVC *vc=[[EditVC alloc]init];
        vc.delegate=self;
        vc.row=indexPath.row;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
#pragma mark -EditVC保存返回后的代理
-(void)endEditMeInfo:(NSString *)info andInRow:(NSInteger)row{
    
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
