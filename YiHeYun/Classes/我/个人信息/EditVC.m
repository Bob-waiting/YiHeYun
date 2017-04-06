//
//  EditVC.m
//  YueYueMusic
//
//  Created by 上海尚洪 on 16/8/10.
//  Copyright © 2016年 上海尚洪. All rights reserved.
//

#import "EditVC.h"
#import "SkyerCityPicker.h"
@interface EditVC ()<UITextFieldDelegate,UITextViewDelegate>
@property(nonatomic,strong)UITextField *textField;
@property(nonatomic,strong)UITextField *personTextField;
@property(nonatomic,strong)UITextField *telphoneTextField;
@property(nonatomic,strong)UITextView *textView;
@property(nonatomic,strong)UILabel *addressLabel;
@property(nonatomic,strong)NSString *info;

@end

@implementation EditVC


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *ensureButton=[[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(ensureInfo)];
    [ensureButton setTintColor:[UIColor purpleColor]];
    self.navItem.rightBarButtonItem=ensureButton;
    [self initWithView];
}
-(void)initWithView{
    if (_row>0&&_row<9) {
        [self initView1];
    }else if(_row==9){
        [self initView2];
    }else{
        [self initView3];
    }
    
}
#pragma mark - 简单信息界面
-(void)initView1{
    _textField=[[UITextField alloc]initWithFrame:CGRectMake(20, 80, WIDTH-40, 40)];
    _textField.backgroundColor=[UIColor whiteColor];
    [_textField setFont:[UIFont systemFontOfSize:16]];
    _textField.adjustsFontSizeToFitWidth = YES;
    _textField.minimumFontSize =16;
    _textField.clearButtonMode=UITextFieldViewModeWhileEditing;
    _textField.delegate=self;
    [_textField becomeFirstResponder];
    [self.view addSubview:_textField];
    
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(0, 80, 20, 40)];
    label1.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:label1];
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH-20, 80, 20, 40)];
    label2.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:label2];
}
#pragma mark - 家庭住址界面
-(void)initView2{
    UILabel *addressLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 80, 100, 40)];
    addressLabel.backgroundColor=[UIColor whiteColor];
    addressLabel.text=@"所在地区";
    [self.view addSubview:addressLabel];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(120, 80, WIDTH-140, 40);
    [button addTarget:self action:@selector(showPickView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _addressLabel=[[UILabel alloc]initWithFrame:CGRectMake(120, 80, WIDTH-140, 40)];
    _addressLabel.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_addressLabel];
    
    UILabel *detailAddressLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 121, WIDTH-20, 30)];
    detailAddressLabel.backgroundColor=[UIColor whiteColor];
    detailAddressLabel.text=@"详细地址";
    [self.view addSubview:detailAddressLabel];
    
    _textView=[[UITextView alloc]initWithFrame:CGRectMake(20, 151, WIDTH-40, 80)];
    _textView.delegate=self;
    [_textView setFont:[UIFont systemFontOfSize:16]];
    [self.view addSubview:_textView];
    
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(0, 80, 20, 151)];
    label1.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:label1];
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH-20, 80, 20, 151)];
    label2.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:label2];
}
#pragma mark - 收货地址界面
-(void)initView3{
    UILabel *personLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 80, 100, 40)];
    personLabel.backgroundColor=[UIColor whiteColor];
    personLabel.text=@"收货人";
    [self.view addSubview:personLabel];
    
    _personTextField=[[UITextField alloc]initWithFrame:CGRectMake(120, 80, WIDTH-40, 40)];
    _personTextField.backgroundColor=[UIColor whiteColor];
    [_personTextField setFont:[UIFont systemFontOfSize:16]];
    _personTextField.adjustsFontSizeToFitWidth = YES;
    _personTextField.minimumFontSize =16;
    _personTextField.clearButtonMode=UITextFieldViewModeWhileEditing;
    _personTextField.delegate=self;
    [self.view addSubview:_personTextField];
    
    UILabel *phoneLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 121, 100, 40)];
    phoneLabel.backgroundColor=[UIColor whiteColor];
    phoneLabel.text=@"联系电话";
    [self.view addSubview:phoneLabel];
    
    _telphoneTextField=[[UITextField alloc]initWithFrame:CGRectMake(120, 121, WIDTH-40, 40)];
    _telphoneTextField.backgroundColor=[UIColor whiteColor];
    [_telphoneTextField setFont:[UIFont systemFontOfSize:16]];
    _telphoneTextField.adjustsFontSizeToFitWidth = YES;
    _telphoneTextField.minimumFontSize =16;
    _telphoneTextField.clearButtonMode=UITextFieldViewModeWhileEditing;
    _telphoneTextField.delegate=self;
    [_telphoneTextField becomeFirstResponder];
    [self.view addSubview:_telphoneTextField];
    
    UILabel *addressLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 162, 100, 40)];
    addressLabel.backgroundColor=[UIColor whiteColor];
    addressLabel.text=@"所在地区";
    [self.view addSubview:addressLabel];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(120, 162, WIDTH-140, 40);
    [button addTarget:self action:@selector(showPickView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _addressLabel=[[UILabel alloc]initWithFrame:CGRectMake(120, 162, WIDTH-140, 40)];
    _addressLabel.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_addressLabel];
    
    UILabel *detailAddressLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 203, WIDTH-20, 30)];
    detailAddressLabel.backgroundColor=[UIColor whiteColor];
    detailAddressLabel.text=@"详细地址";
    [self.view addSubview:detailAddressLabel];
    
    _textView=[[UITextView alloc]initWithFrame:CGRectMake(20, 233, WIDTH-40, 80)];
    _textView.delegate=self;
    [_textView setFont:[UIFont systemFontOfSize:16]];
    [self.view addSubview:_textView];
    
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(0, 80, 20, 233)];
    label1.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:label1];
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH-20, 80, 20, 233)];
    label2.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:label2];
}

-(void)showPickView{
    [self.view endEditing:YES];
    typeof(self) __weak weakSelf = self;
    SkyerCityPicker *skyerCityPicker=[[SkyerCityPicker alloc] init];
    skyerCityPicker.selectCityBlock=^(NSMutableDictionary *dic){
        _addressLabel.text=[NSString stringWithFormat:@"%@%@%@",[dic objectForKey:@"Province"],[dic objectForKey:@"City"],[dic objectForKey:@"District"]];
    };
}
-(void)ensureInfo{
    [self.view endEditing:YES];
    if (_row>0&&_row<9) {
        _info=_textField.text;
    }else if(_row==9){
        _info=_textView.text;
    }else{
        _info=[NSString stringWithFormat:@"%@ %@\n%@",_personTextField.text,_telphoneTextField.text,_textView.text];
    }
    if ([self.delegate respondsToSelector:@selector(endEditMeInfo:andInRow:)]) {
        [self.delegate endEditMeInfo:_info andInRow:_row];
    }
    [self.navigationController popViewControllerAnimated:YES];
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
