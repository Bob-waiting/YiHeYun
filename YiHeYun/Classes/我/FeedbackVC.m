//
//  FeedbackVC.m
//  YiHeYun
//
//  Created by Ink on 2017/3/28.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "FeedbackVC.h"

@interface FeedbackVC ()

@property (weak, nonatomic) IBOutlet UITextView *feedBackTextView;
@property (weak, nonatomic) IBOutlet UILabel *feedBackPlaceholderLabel;

@property (weak, nonatomic) IBOutlet UITextView *contactTextView;
@property (weak, nonatomic) IBOutlet UILabel *contactPlaceholderLabel;

@end

@implementation FeedbackVC

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"意见反馈";

  [self configUI];
}

- (void)configUI {
  self.view.backgroundColor = [UIColor colorWithWhite:0.928 alpha:1.0];

  self.feedBackTextView.delegate = self;
  self.feedBackTextView.textContainerInset = UIEdgeInsetsMake(12, 13, 12, 13);

  self.contactTextView.delegate = self;
  self.contactTextView.textContainerInset = UIEdgeInsetsMake(17, 13, 17, 13);
}

- (IBAction)CommitAction {
  NSString *feedBackStr = self.feedBackTextView.text;
  NSString *contactStr = self.contactTextView.text;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {

  if (textView == self.feedBackTextView) {
    if (![text isEqualToString:@""]) {
      self.feedBackPlaceholderLabel.hidden = true;
    }

    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1) {
      self.feedBackPlaceholderLabel.hidden = false;
    }
  }

  if (textView == self.contactTextView) {
    if (![text isEqualToString:@""]) {
      self.contactPlaceholderLabel.hidden = true;
    }

    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1) {
      self.contactPlaceholderLabel.hidden = false;
    }
  }

  return YES;
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
