//
//  addCase_photoDetailViewController.m
//  addCaseDemo
//
//  Created by 金波 on 2017/3/30.
//  Copyright © 2017年 Bob. All rights reserved.
//
#define RGB(color) [UIColor colorWithRed:((color>>8)&0xff)/255.0 green:((color>>4)&0xff)/255.0 blue:((color>>0)&0xff)/255.0 alpha:1.0]

#import "addCase_photoDetailViewController.h"

@interface addCase_photoDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@end

@implementation addCase_photoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBars];
    //_detailImage.image=[self imageByScalingAndCroppingForSize:CGSizeMake(360, 331) withSourceImage:self.img] ;
    _detailImage.image=self.img;
   // CGSize size=CGSizeMake(_detailImage.frame.size.width, (_detailImage.frame.size.width/self.img.size.width)*self.img.size.height);
    //_detailImage.image=[self OriginImage:self.img scaleToSize:size];
    // Do any additional setup after loading the view.
}

- (void)setNavBars {
    
    self.navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 375, 64.0)];
    self.navBar.translucent = NO;
    self.navItem = [[UINavigationItem alloc] init];
    self.navItem.title=@"图片详情";
    [self.navBar setItems:@[self.navItem]];
    
    UIButton *bb = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 44)];
    [bb setImage:[UIImage imageNamed:@"backIcon"] forState:0];
    bb.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [bb addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:bb];
    
    self.navItem.leftBarButtonItem = backBarButtonItem;
    
    [self.view addSubview:self.navBar];
    self.navigationController.navigationBarHidden=YES;
}

-(void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize withSourceImage:(UIImage *)sourceImage
{
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth= width * scaleFactor;
        scaledHeight = height * scaleFactor;
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else if (widthFactor < heightFactor)
        {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width= scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil)
        NSLog(@"could not scale image");
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
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
