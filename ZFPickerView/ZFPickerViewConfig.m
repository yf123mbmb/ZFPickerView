//
//  ZFPickerViewConfig.m
//  ZFPickerViewConfig <https://github.com/Abnerzj/ZFPickerView>
//
//  Created by Abnerzj on 2020/10/17.
//  Copyright © 2017年 Abnerzj. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "ZFPickerViewConfig.h"
#import "ZFPickerViewProperty.h"

static NSString * const kDividedSymbol = @","; // divided symbol


@implementation ZFPickerViewConfig

- (instancetype)init {
    if (self == [super init]) {
        [self resetConfig];
    }
    return self;
}

+ (instancetype)defaultConfig
{
    ZFPickerViewConfig *config = [[ZFPickerViewConfig alloc] init];
    return config;
}

+ (instancetype)configWithPropertyDict:(nullable NSDictionary *)propertyDict
{
    ZFPickerViewConfig *config = [self defaultConfig];
    
    [propertyDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (obj) {
            if ([key isEqualToString:ZFPickerViewPropertyCanceBtnTitleKey]) {
                config.cancelBtnTitle = obj;
            } else if ([key isEqualToString:ZFPickerViewPropertySureBtnTitleKey]) {
                config.sureBtnTitle = obj;
            } else if ([key isEqualToString:ZFPickerViewPropertyTipLabelTextKey]) {
                config.titleLabelText = obj;
            }
            else if ([key isEqualToString:ZFPickerViewPropertyTipLabelTextKey_title]) {
               config.titleLabelText_title = obj;
            }
            else if ([key isEqualToString:ZFPickerViewPropertyDividedSymbolKey]) {
                config.dividedSymbol = obj;
            } else if ([key isEqualToString:ZFPickerViewPropertyCanceBtnTitleColorKey]) {
                config.cancelTextColor = obj;
            } else if ([key isEqualToString:ZFPickerViewPropertySureBtnTitleColorKey]) {
                config.sureTextColor = obj;
            } else if ([key isEqualToString:ZFPickerViewPropertyTipLabelTextColorKey]) {
                config.titleTextColor = obj;
            } else if ([key isEqualToString:ZFPickerViewPropertyLineViewBackgroundColorKey]) {
                config.titleLineColor = obj;
            } else if ([key isEqualToString:ZFPickerViewPropertyCanceBtnTitleFontKey]) {
                config.cancelTextFont = obj;
            } else if ([key isEqualToString:ZFPickerViewPropertySureBtnTitleFontKey]) {
                config.sureTextFont = obj;
            } else if ([key isEqualToString:ZFPickerViewPropertyTipLabelTextFontKey]) {
                config.titleTextFont = obj;
            } else if ([key isEqualToString:ZFPickerViewPropertyPickerViewHeightKey]) {
                config.pickerViewHeight = [obj floatValue];
            } else if ([key isEqualToString:ZFPickerViewPropertyOneComponentRowHeightKey]) {
                config.rowHeight = [obj floatValue];
            } else if ([key isEqualToString:ZFPickerViewPropertySelectRowTitleAttrKey]) {
                config.selectRowTitleAttribute = obj;
            } else if ([key isEqualToString:ZFPickerViewPropertyUnSelectRowTitleAttrKey]) {
                config.unSelectRowTitleAttribute = obj;
            } else if ([key isEqualToString:ZFPickerViewPropertySelectRowLineBackgroundColorKey]) {
                config.separatorColor = obj;
            } else if ([key isEqualToString:ZFPickerViewPropertyIsTouchBackgroundHideKey]) {
                config.isTouchMaskHide = [obj boolValue];
            } else if ([key isEqualToString:ZFPickerViewPropertyIsShowTipLabelKey]) {
                config.hiddenTitleLabel = ![obj boolValue];
                if (config.isShowSelectContent) {
                    config.hiddenTitleLabel = NO;
                }
            } else if ([key isEqualToString:ZFPickerViewPropertyIsShowSelectContentKey]) {
                config.isShowSelectContent = [obj boolValue];
                if (config.isShowSelectContent) {
                    config.hiddenTitleLabel = NO;
                }
            } else if ([key isEqualToString:ZFPickerViewPropertyIsScrollToSelectedRowKey]) {
                config.isScrollToSelectedRow = [obj boolValue];
            } else if ([key isEqualToString:ZFPickerViewPropertyIsDividedSelectContentKey]) {
                config.isDividedSelectContent = [obj boolValue];
            } else if ([key isEqualToString:ZFPickerViewPropertyBackgroundAlphaKey]) {
                config.maskAlpha = [obj floatValue];
            } else if ([key isEqualToString:ZFPickerViewPropertyIsAnimationShowKey]) {
                config.isAnimationShow = [obj boolValue];
            }
        }
    }];
    
    return config;
}

- (void)resetConfig
{
    NSArray *diffLanguageTitles = [self getDiffLanguageCanceAndSureBtnTitles];
    
    self.maskAlpha = 0.5f;
    self.isTouchMaskHide = NO;
    
    self.pickerViewHeight = 216.0f;
    self.rowHeight = 32.0f;
    self.selectRowTitleAttribute = @{NSForegroundColorAttributeName : kZFPickerViewDefaultThemeColor, NSFontAttributeName : [UIFont systemFontOfSize:20.0f]};
    self.unSelectRowTitleAttribute = @{NSForegroundColorAttributeName : [UIColor lightGrayColor], NSFontAttributeName : [UIFont systemFontOfSize:20.0f]};
    if (@available(iOS 14.0, *)) {
        self.separatorColor = [UIColor tertiarySystemFillColor];
    } else {
        self.separatorColor = [UIColor colorWithRed:222.0/255.0 green:222.0/255.0 blue:222.0/255.0 alpha:1.0];
    }
    self.isScrollToSelectedRow = NO;
    self.sureBtnTitle = diffLanguageTitles.lastObject;
    self.sureTextColor = kZFPickerViewDefaultThemeColor;
    self.sureTextFont = [UIFont systemFontOfSize:17.0];
    
    self.cancelBtnTitle = diffLanguageTitles.firstObject;
    self.cancelTextColor = [UIColor grayColor];
    self.cancelTextFont = [UIFont systemFontOfSize:17.0];
    
    self.titleLabelText = @"";
    self.titleTextColor = [UIColor darkTextColor];
    self.titleLabelBGColor = [UIColor whiteColor];
    self.titleTextFont = [UIFont systemFontOfSize:17.0];
    self.titleLineColor = [UIColor colorWithRed:222.0/255.0 green:222.0/255.0 blue:222.0/255.0 alpha:1.0];
    self.dividedSymbol = kDividedSymbol;
    self.isDividedSelectContent = NO;
    self.isShowSelectContent = NO;
    self.hiddenTitleLabel = YES;
    
    self.isAnimationShow = YES;
}

- (NSArray *)getDiffLanguageCanceAndSureBtnTitles
{
    NSString *languageName = [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0];
    
    // 简体中文
    if ([languageName rangeOfString:@"zh-Hans"].location != NSNotFound) {
        return @[@"取消", @"确定"];
    }
    
    // 繁体中文
    if ([languageName rangeOfString:@"zh-Hant"].location != NSNotFound) {
        return @[@"取消", @"確定"];
    }
    
    // Other language
    return @[@"Cance", @"Sure"];
}


@end
