//
//  ZFPickerViewModel.m
//  ZFPickerViewDemo
//
//  Created by abner on 2018/1/12.
//  Copyright © 2018年 Abnerzj. All rights reserved.
//

#import "ZFPickerViewModel.h"

@implementation ZFPickerViewModel

+ (instancetype)initWithDict:(NSDictionary *)dict
{
    ZFPickerViewModel *model = [[ZFPickerViewModel alloc] init];
    
    if (dict) {
        model.name = dict.allKeys.firstObject;
        
        id modelValue = dict[model.name];
        if (modelValue) {
            if ([modelValue isKindOfClass:[NSArray class]]) {
                NSMutableArray *subModels = [NSMutableArray array];
                [modelValue enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ([obj isKindOfClass:[NSDictionary class]]) {
                        [subModels addObject:[self initWithDict:obj]];
                    } else if ([obj isKindOfClass:[NSString class]] ||
                               [obj isKindOfClass:[NSNumber class]]) {
                        [subModels addObject:obj];
                    }
                }];
                model.subModels = subModels;
            }
        }
    }
    
    return model;
}

@end
