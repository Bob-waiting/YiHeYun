//
//  AddCaseVC.m
//  YiHeYun
//
//  Created by Ink on 2017/3/28.
//  Copyright © 2017年 yhy. All rights reserved.
//
#define RGB(color) [UIColor colorWithRed:((color>>8)&0xff)/255.0 green:((color>>4)&0xff)/255.0 blue:((color>>0)&0xff)/255.0 alpha:1.0]
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#import "AddCaseVC.h"
#import "SelectDateView.h"
#import "addCase_PhotoCollectionViewCell.h"
#import <Photos/Photos.h>
#import "addCase_photoDetailViewController.h"
@interface AddCaseVC ()
{
NSMutableArray *_photoArray;
    UIButton *bgButton;
    SelectDateView *slectDateView;

}
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UIButton *timeButton;
@property (weak, nonatomic) IBOutlet UIButton *photoButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (retain, nonatomic) IBOutlet UICollectionView *photoCollectionView;
@end

@implementation AddCaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
  self.title = @"添加病历";
    _photoArray=[[NSMutableArray alloc]init];
    [self initView];
}

-(void)initView
{
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(0, 0, 40, 44)];
    [rightButton setTitle:@"保存" forState:UIControlStateNormal];
    [rightButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [rightButton addTarget:self action:@selector(doSaveCase:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitleColor:RGB(0x1283fe) forState:UIControlStateNormal];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    self.navItem.rightBarButtonItem=rightItem;
    bgButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64)];
    bgButton.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.6];
    [bgButton addTarget:self action:@selector(hiddenAllView) forControlEvents:UIControlEventTouchUpInside];
    bgButton.alpha = 0.0;
    bgButton.hidden = YES;
    [self.view addSubview:bgButton];

    __weak AddCaseVC *weakSelf = self;
    slectDateView = [[SelectDateView alloc]initWithMode:DisplayDate andFrame:CGRectMake(15, HEIGHT, WIDTH-30, 250)];
    
    slectDateView.getSlectDate = ^(NSString *date){
        weakSelf.timeLable.text = date;
        
    };
    slectDateView.cancleSelect = ^(){
        [weakSelf hiddenAllView];
    };
    [self.view addSubview:slectDateView];
    // 对时间条进行设置
    NSCalendar *calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *now = [NSDate date];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
    self.timeLable.text=[NSString stringWithFormat:@"%ld年%02ld月%02ld日",[dateComponent year],[dateComponent month],[dateComponent day]];
    
    [self.timeButton addTarget:self action:@selector(doClickTimeButton:) forControlEvents:UIControlEventTouchUpInside];
    //对上传照片按钮进行设置
    [self.photoButton addTarget:self action:@selector(doClickPhotoButton:) forControlEvents:UIControlEventTouchUpInside];
    //对删除按钮进行设置
    [self.deleteButton addTarget:self action:@selector(doClickDeleteButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.deleteButton.layer.masksToBounds=YES;
    self.deleteButton.layer.cornerRadius=25.0;
    //对图片显示的collectionview进行设置
    [self.photoCollectionView registerNib:[UINib nibWithNibName:@"addCase_PhotoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"photoId"];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.sectionInset=UIEdgeInsetsMake(5, 5, 5, 5);
    layout.minimumInteritemSpacing=5;
    layout.itemSize=CGSizeMake((ScreenWidth-40)/4,(ScreenWidth-40)/4);
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    self.photoCollectionView.collectionViewLayout=layout;
    
}


#pragma mark--返回按钮的点击事件--

-(void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark--保存按钮的点击事件--

-(void)doSaveCase:(id)sender
{
    
}

#pragma mark--点击时间条的事件--

-(void)doClickTimeButton:(id)sender
{
    [self.view endEditing:YES];
    slectDateView.hidden = NO;
    bgButton.hidden = NO;
    [UIView animateWithDuration:0.2 animations:^{
        slectDateView.y = HEIGHT/2-slectDateView.frame.size.height/2.0;
        bgButton.alpha = 1.0;
    } completion:^(BOOL finished) {
        
    }];

    
}

#pragma mark--点击照片条的事件--

-(void)doClickPhotoButton:(id)sender
{
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"选择照片来源"message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;//设置可编辑
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:nil];//进入照相界面
        
    }];
    
    UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"从相册获取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
        //进入相册界面
        QBImagePickerController* _imagePickerController = [[QBImagePickerController alloc] init];
        _imagePickerController.mediaType=QBImagePickerMediaTypeImage;
        _imagePickerController.assetCollectionSubtypes=@[@(PHAssetCollectionSubtypeSmartAlbumUserLibrary),@(PHAssetCollectionSubtypeAlbumMyPhotoStream)];
        _imagePickerController.delegate = self;
        _imagePickerController.allowsMultipleSelection = YES;
        _imagePickerController.maximumNumberOfSelection = 9;
        [self presentViewController:_imagePickerController animated:YES completion:nil];
        
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:photoAction];
    [alertController addAction:archiveAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
}

#pragma mark--点击删除按钮的事件--

-(void)doClickDeleteButton:(id)sender
{
    UIAlertController *alertVC=[UIAlertController alertControllerWithTitle:@"提示" message:@"你确定放弃添加病历吗" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertVC addAction:cancelAction];
    
    UIAlertAction *sureAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertVC dismissViewControllerAnimated:YES completion:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alertVC addAction:sureAction];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)hiddenAllView{
    [UIView animateWithDuration:0.2 animations:^{
       // recordView.y = HEIGHT;
        slectDateView.y = HEIGHT;
        bgButton.alpha = 0.0;
    } completion:^(BOOL finished) {
        bgButton.hidden = YES;;
       // recordView.hidden = YES;
        slectDateView.hidden = YES;
        
        //        selectTimeView.hidden = YES;
    }];
}

#pragma mark--photoColletionView的代理事件--

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_photoArray.count<=0)
        return 4;
    return _photoArray.count;
}

- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellId=@"photoId";
    addCase_PhotoCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    if (_photoArray.count<=0) {
        cell.photoImage.backgroundColor=[UIColor lightGrayColor];
        //cell.image=[UIImage imageNamed:@"photo"];
    }else
    {
        cell.image=[_photoArray objectAtIndex:indexPath.row];
    }
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_photoArray.count<=0) {
        return;
    }
    addCase_photoDetailViewController *photoDetailVC=[[UIStoryboard storyboardWithName:@"Me" bundle:nil]instantiateViewControllerWithIdentifier:@"addCase_photoDetail"];
    
    photoDetailVC.img=[_photoArray objectAtIndex:indexPath.row];
    ;
    [self.navigationController pushViewController:photoDetailVC animated:YES];
    
}

#pragma mark--拍照回调:UIImagePickerControllerDelegate--

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo
{
    [_photoArray addObject:image];
    [picker dismissViewControllerAnimated:YES completion:^{
        [_photoCollectionView reloadData];
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark--相册回调:QBImagePickerControllerDelegate--

- (void)qb_imagePickerController:(QBImagePickerController *)imagePickerController didFinishPickingAssets:(NSArray *)assets
{
    PHImageManager *imageManager = [[PHImageManager alloc] init];
    for (PHAsset *asset in assets) {
        [imageManager requestImageForAsset:asset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            [_photoArray addObject:result];
        }];
    }
    [self dismissViewControllerAnimated:YES completion:^{
        [_photoCollectionView reloadData];
    }];
}

- (void)qb_imagePickerControllerDidCancel:(QBImagePickerController *)imagePickerController{
    [self dismissViewControllerAnimated:YES completion:nil];
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
