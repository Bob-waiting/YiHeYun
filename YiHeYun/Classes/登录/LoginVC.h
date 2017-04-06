//
//  LoginVC.h
//  YiHeYun
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BaseVC.h"

@interface LoginVC : BaseVC

@property (nonatomic,copy) dispatch_block_t buttonBlock;

@property (weak, nonatomic) IBOutlet UITextField *accountTF;

@property (weak, nonatomic) IBOutlet UITextField *psWTF;

- (IBAction)forgetPswAction:(id)sender;
- (IBAction)loginAction:(id)sender;

@end
