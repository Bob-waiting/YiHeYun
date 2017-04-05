//
//  ElecFenceVC.m
//  YiHeYun
//
//  Created by zhanbing han on 17/4/4.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "ElecFenceVC.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapLocationKit/AMapLocationManager.h>
#import "PanSingleProgressView.h"

@interface ElecFenceVC ()<MAMapViewDelegate,AMapLocationManagerDelegate>
{
    UIView *_tipView;
}

@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic,retain) AMapLocationManager *locationManager; //定位管理者
@property (nonatomic,retain) MAPointAnnotation *anno; //点击地图标注
@property (nonatomic,retain) CLLocation *userLocation; //用户当前的位置
@property (nonatomic,assign) CLLocationCoordinate2D userTapLocation; //用户点击地图位置
@property (nonatomic,retain) MACircle *currentCircle; //当前电子围栏
@property (nonatomic,retain) PanSingleProgressView *radiusPanView; //设置半径
@property (nonatomic, strong) NSMutableArray *circles;
@property (nonatomic, assign) int radiusValue; //电子围栏半径

@end

@implementation ElecFenceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"电子围栏设定";
    
    [self initNav];
    
    [self initCircles];
    
    [self initMap];
    
    [self initTipView];
}

#pragma mark - Initialization

- (void)initCircles {
    
    self.circles = [NSMutableArray array];
    /* Circle. */
    MACircle *circle1 = [MACircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(39.996441, 116.411146) radius:15000];
    [self.circles addObject:circle1];
    
    MACircle *circle2 = [MACircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(40.096441, 116.511146) radius:12000];
    [self.circles addObject:circle2];
    
    MACircle *circle3 = [MACircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(39.896441, 116.311146) radius:9000];
    [self.circles addObject:circle3];
}

#pragma mark - init view

- (void)initNav {
    
    UIButton *locateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [locateBtn addTarget:self action:@selector(locateAction) forControlEvents:UIControlEventTouchUpInside];
    [locateBtn setImage:[UIImage imageNamed:@"nava_site"] forState:UIControlStateNormal];
    
    [locateBtn sizeToFit];
    UIBarButtonItem *locateItem = [[UIBarButtonItem alloc] initWithCustomView:locateBtn];
    
    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingBtn addTarget:self action:@selector(settingAction) forControlEvents:UIControlEventTouchUpInside];
    [settingBtn setImage:[UIImage imageNamed:@"nava_set"] forState:UIControlStateNormal];
    [settingBtn sizeToFit];
    UIBarButtonItem *settingBtnItem = [[UIBarButtonItem alloc] initWithCustomView:settingBtn];
    
    self.navItem.rightBarButtonItems  = @[settingBtnItem,locateItem];
}

- (void)initMap {
    
    //地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    
    self.mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64)];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapView.delegate = self;
    _mapView.showsCompass = NO; //隐藏指南针
    _mapView.showsScale = NO; //隐藏比例尺
    _mapView.rotateEnabled= NO; //禁止地图旋转
    _mapView.rotateCameraEnabled= NO; //禁止地图倾斜
    [self.view addSubview:self.mapView];
    
    //开启定位
    _mapView.showsUserLocation = YES;
    [_mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES]; //地图跟着位置移动
    
    //创建定位管理者
    _locationManager = [[AMapLocationManager alloc] init];
    _locationManager.delegate = self;
    [self setLocationManagerForHundredMeters]; //百米精确度
    //开始定位
    [_locationManager startUpdatingLocation];
    
    
    __weak ElecFenceVC *weakSelf = self;
    
    _radiusPanView =  [[PanSingleProgressView alloc]initWithFrame:CGRectMake(15, self.mapView.height-260, WIDTH-30, 160) andUnit:@"km"];
    _radiusPanView.title = @"设置半径";
    _radiusPanView.y = HEIGHT;
    _radiusPanView.sureSlect = ^(NSString *radiusValue){
        NSLog(@"%@",radiusValue);
        weakSelf.radiusValue = [radiusValue intValue]*1000;
        [weakSelf updateElecFence];
        [weakSelf hiddenPanView];
    };
    _radiusPanView.cancleSlect = ^(){
        [weakSelf hiddenPanView];
        [weakSelf removeElecFence];
    };
    [self.mapView addSubview:_radiusPanView];
}

- (void)hiddenPanView {
    
    [UIView animateWithDuration:0.2 animations:^{
        _radiusPanView.y = HEIGHT;
    } completion:^(BOOL finished) {
        _radiusPanView.hidden = YES;
    }];
}

- (void)removeElecFence {
    
    [self.mapView removeOverlay:_currentCircle];
    [self.circles removeObject:_currentCircle];
    [self.mapView removeAnnotation:_anno];
}

- (void)initTipView {
    
    //提示视图
    _tipView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 30)];
    _tipView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    [_mapView addSubview:_tipView];
    
    UILabel *tipTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, WIDTH-20, _tipView.height)];
    tipTitleLab.text = @"点击地图上任意一点确定电子围栏中心，然后调整半径";
    tipTitleLab.font = [UIFont systemFontOfSize:10];
    tipTitleLab.textColor = [UIColor whiteColor];
    [_tipView addSubview:tipTitleLab];
}

#pragma mark - methods

//定位
- (void)locateAction {
    
    //开始定位
    [_locationManager startUpdatingLocation];
}

//设置
- (void)settingAction {
    
    
}

- (void)updateElecFence {
    MACircleRenderer *circleRender = (MACircleRenderer *)[self.mapView rendererForOverlay:_currentCircle];
    
    if(circleRender) {
        circleRender.circle.radius = self.radiusValue;
        [circleRender setNeedsUpdate];
    }
}

#pragma mark - mapView 代理方法

//定位结果回调
- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location {
    // 定位结果
    NSLog(@"location:{lat:%f; lon:%f; accuracy:%f}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy);
    //更新用户位置
    _userLocation = location;
    //设置地图中心点
    [_mapView setCenterCoordinate:_userLocation.coordinate animated:YES];
    
    // 停止定位
    [_locationManager stopUpdatingLocation];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_mapView setZoomLevel:14 animated:YES];
    });
}

//当位置(经纬度/方向)更新时，会进行定位回调
- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation)
    {
        //取出当前位置的坐标
        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
        
        //更新用户位置
        _userLocation = userLocation.location;
    }
}

#pragma mark - MAMapViewDelegate

//单击地图
- (void)mapView:(MAMapView *)mapView didSingleTappedAtCoordinate:(CLLocationCoordinate2D)coordinate {
    
    self.userTapLocation = coordinate;
    
    //创建大头针
    [_mapView removeAnnotation:_anno];
    _anno = [[MAPointAnnotation alloc] init];
    _anno.coordinate = CLLocationCoordinate2DMake(coordinate.latitude,coordinate.longitude);
    //将大头针添加到地图中
    [_mapView addAnnotation:_anno];
    
    //显示电子围栏
    _currentCircle = [MACircle circleWithCenterCoordinate:coordinate radius:1000];
    [self.mapView addOverlay:_currentCircle];
    [self.circles addObject:_currentCircle];
    
    //显示设置半径
    _radiusPanView.hidden = NO;
    [UIView animateWithDuration:0.5 animations:^{
        _radiusPanView.y = self.mapView.height-_radiusPanView.height-30;
    }];
}

- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[MACircle class]])
    {
        MACircleRenderer *circleRenderer = [[MACircleRenderer alloc] initWithCircle:overlay];
        
        circleRenderer.lineWidth   = 6.f;
        circleRenderer.strokeColor = [UIColor colorWithRed:0.841 green:0.670 blue:0.921 alpha:0.500];
        
        NSInteger index = [self.circles indexOfObject:overlay];
        if(index == 0) {
            circleRenderer.fillColor   = [UIColor clearColor];
        } else if(index == 1) {
            circleRenderer.fillColor   = [UIColor clearColor];
        } else if(index == 2) {
            circleRenderer.fillColor   = [UIColor clearColor];
        } else {
            circleRenderer.fillColor   = [UIColor clearColor];
        }
        
        return circleRenderer;
    }
    
    return nil;
}

//设置百米精确度
-(void)setLocationManagerForHundredMeters{
    
    //1.带逆地理信息的一次定位（返回坐标和地址信息）
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    
    //2.定位超时时间，最低2s，此处设置为2s
    _locationManager.locationTimeout =2;
    
    //3.逆地理请求超时时间，最低2s，此处设置为2s
    _locationManager.reGeocodeTimeout = 2;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    [self.mapView addOverlays:self.circles];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
