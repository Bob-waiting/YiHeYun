//
//  RegisterVC.m
//  YiHeYun
//
//  Created by zyl on 17/3/12.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "RegisterVC.h"

@interface RegisterVC ()

@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"注册";
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

//获取验证码
- (IBAction)getCodeAction:(id)sender {
    
}

//注册协议
- (IBAction)registerProtocolAction:(id)sender {
    
}

//注册
- (IBAction)registerAction:(id)sender {
    
    if ([Utils isBlankString:_phoneTF.text]) {
        [Utils showToast:@"请输入手机号"];
        return;
    }
    
    if (_phoneTF.text.length!=11) {
        [Utils showToast:@"请输入正确的手机号"];
        return;
    }
    
    if ([Utils isBlankString:_nameTF.text]) {
        [Utils showToast:@"请输入真实姓名"];
        return;
    }
    
    if ([Utils isBlankString:_pswTF.text]) {
        [Utils showToast:@"请输入密码"];
        return;
    }
    
    [JHHJView showLoadingOnTheKeyWindowWithType:JHHJViewTypeSingleLine]; //开始加载
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         [[Utils transform:_nameTF.text] stringByReplacingOccurrencesOfString:@" " withString:@""], @"accountId",
                         _nameTF.text, @"memberName",
                         _pswTF.text, @"passowrd",
                         _phoneTF.text, @"mobileNo",
                         nil];
    [[NetworkManager sharedManager] postJSON:URL_Register parameters:dic imagePath:nil completion:^(id responseData, RequestState status, NSError *error) {
        
        [JHHJView hideLoading]; //结束加载
        
        if (status == Request_Success) {
            [Utils showToast:@"注册成功"];
            
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            [Utils showToast:@"注册失败"];
        }
    }];
}

@end
