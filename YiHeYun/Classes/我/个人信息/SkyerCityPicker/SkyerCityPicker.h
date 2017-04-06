//
//  SkyerCityPicker.h
//  CityPicker
//
//  Created by odier on 2016/10/29.
//  Copyright © 2016年 Skyer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkyerCityPicker : UIView <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic,copy) void(^selectCityBlock)(NSMutableDictionary*);

@property NSArray *arrProvince;
@property NSArray *arrCity;
@property NSArray *arrDistrict;
@property NSMutableDictionary *dicSelectCityAndCityCode;

@property (strong, nonatomic) UIPickerView *cityPicker;
@property (strong, nonatomic) UILabel *btnSelectShow;

@end
