//
//  LeaveMessageVC.m
//  YiHeYun
//
//  Created by Ink on 2017/3/29.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "LeaveMessageVC.h"

@interface LeaveMessageVC ()

@property (weak, nonatomic) IBOutlet UITextView *leaveTextView;
@property (weak, nonatomic) IBOutlet UILabel *leavePlaceholderLabel;

@end

@implementation LeaveMessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"留言";

  [self configUI];
}

- (void)configUI {
  self.view.backgroundColor = [UIColor colorWithWhite:0.928 alpha:1.0];

  self.leaveTextView.delegate = self;
  self.leaveTextView.textContainerInset = UIEdgeInsetsMake(12, 13, 12, 13);

  UIButton *saveButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 44)];
  saveButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
  [saveButton setTitle:@"保存" forState:UIControlStateNormal];
  [saveButton setTitleColor:AEColor(126, 53, 150, 1) forState:UIControlStateNormal];
  [saveButton addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
  UIBarButtonItem *saveButtonItem = [[UIBarButtonItem alloc]initWithCustomView:saveButton];;
  self.navItem.rightBarButtonItem = saveButtonItem;
}

- (void)saveAction {
  NSString *leaveMessage = self.leaveTextView.text;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {

  if (textView == self.leaveTextView) {
    if (![text isEqualToString:@""]) {
      self.leavePlaceholderLabel.hidden = true;
    }

    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1) {
      self.leavePlaceholderLabel.hidden = false;
    }
  }

  return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
