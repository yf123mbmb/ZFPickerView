//
//  ZFPickerViewProperty.h
//  ZFPickerViewProperty <https://github.com/Abnerzj/ZFPickerView>
//
//  Created by Abnerzj on 2020/10/17.
//  Copyright © 2017年 Abnerzj. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFPickerViewProperty : NSObject

// content: NSString type
extern NSString * _Nonnull const ZFPickerViewPropertyCanceBtnTitleKey; // cance button Title（取消按钮）
extern NSString * _Nonnull const ZFPickerViewPropertySureBtnTitleKey;  // sure button Title（确定按钮）
extern NSString * _Nonnull const ZFPickerViewPropertyTipLabelTextKey;  // tipLabel text（选择提示标签，tips: When multi component, recommended the selected content be separated by commas. 重要提示：多列时建议已选择的内容用英文逗号隔开，参考`ZFPickerViewPropertyIsDividedSelectContentKey`这个key）
extern NSString * _Nonnull const ZFPickerViewPropertyTipLabelTextKey_title;
extern NSString * _Nonnull const ZFPickerViewPropertyDividedSymbolKey;  // divided symbol, default commas （选中内容的分隔符，默认英文逗号）

// color: UIColor type
extern NSString * _Nonnull const ZFPickerViewPropertyCanceBtnTitleColorKey; // cance button Title color（取消按钮文字颜色）
extern NSString * _Nonnull const ZFPickerViewPropertySureBtnTitleColorKey;  // sure button Title color（确定按钮文字颜色）
extern NSString * _Nonnull const ZFPickerViewPropertyTipLabelTextColorKey;  // tipLabel text color（选择提示标签文字颜色）
extern NSString * _Nonnull const ZFPickerViewPropertyLineViewBackgroundColorKey;  // lineView backgroundColor（顶部工具条分割线背景颜色）

// font: UIFont type
extern NSString * _Nonnull const ZFPickerViewPropertyCanceBtnTitleFontKey; // cance button label font, default 17.0f（取消按钮字体大小）
extern NSString * _Nonnull const ZFPickerViewPropertySureBtnTitleFontKey;  // sure button label font, default 17.0f（确定按钮字体大小）
extern NSString * _Nonnull const ZFPickerViewPropertyTipLabelTextFontKey;  // tipLabel font, default 17.0f（选择提示标题字体大小）

// pickerView:
// CGFloat type
extern NSString * _Nonnull const ZFPickerViewPropertyPickerViewHeightKey;  // pickerView height, default 224 pt（pickerView高度）
extern NSString * _Nonnull const ZFPickerViewPropertyOneComponentRowHeightKey;  // one component row height, default 32 pt（pickerView一行的高度）
// NSDictionary type
extern NSString * _Nonnull const ZFPickerViewPropertySelectRowTitleAttrKey;  // select row titlt attribute（pickerView当前选中的文字颜色）
extern NSString * _Nonnull const ZFPickerViewPropertyUnSelectRowTitleAttrKey;  // unSelect row titlt attribute（pickerView当前没有选中的文字颜色）
// UIColor type
extern NSString * _Nonnull const ZFPickerViewPropertySelectRowLineBackgroundColorKey;  // select row top and bottom line backgroundColor, IOS 14+ is to cover the framed background above the selected row. The transparency of the background color is recommended to be set to 0.12, otherwise the content of the selected row will be blocked（选中行顶部和底部分割线背景颜色，iOS 14+是覆盖在选中行上面的框住背景，背景颜色的透明度建议设置为0.12，否则会遮挡选中行的内容）

// other:
// BOOL type
extern NSString * _Nonnull const ZFPickerViewPropertyIsTouchBackgroundHideKey;  // touch background is hide, default NO（是否点击背景隐藏）
extern NSString * _Nonnull const ZFPickerViewPropertyIsShowTipLabelKey;  // is show tipLabel, default NO. note: if the value of this key`ZFPickerViewPropertyIsShowSelectContentKey` is YES, the value of ZFPickerViewPropertyIsShowTipLabelKey is ignored.（是否显示提示标签。注意，如果这个key`ZFPickerViewPropertyIsShowSelectContentKey`的值为YES，忽略ZFPickerViewPropertyIsShowTipLabelKey的值）
extern NSString * _Nonnull const ZFPickerViewPropertyIsShowSelectContentKey;  // scroll component is update and show select content in tipLabel, default NO（选择内容后是否更新选择提示标签）
extern NSString * _Nonnull const ZFPickerViewPropertyIsScrollToSelectedRowKey;  // when pickerView will show scroll to selected row, default NO. note:`ZFPickerViewPropertyTipLabelTextKey` Must pass by value（将要显示时是否滚动到已选择内容那一行，注意，选择提示标签tipLabel必须传内容，比如之前选择了`北京`，此时就需要传入`北京`）
extern NSString * _Nonnull const ZFPickerViewPropertyIsDividedSelectContentKey;  // the select content is divided by comma symbol when pickerView before show, use string matching for every component if value is nil, default NO.（pickerView显示前，已选择的内容是否已用逗号隔开，默认用选择的内容字符串去匹配每一列选中的内容，如果每一列选中的内容存在相似，会造成滚动到选择的那一行出现问题。比如，总共有两列，选择的内容是：`8.2,8.2`，第一列选择的内容`8.2`在索引2的位置，第二列选择的内容`8.2`在索引4的位置，这个时候如果用默认的匹配规则，则每一列在滚动到已选择那一行时，都只会滚动到索引为2之处）
extern NSString * _Nonnull const ZFPickerViewPropertyIsAnimationShowKey;  // show pickerView is need Animation, default YES（显示pickerView时是否带动画效果）
// CGFloat type
extern NSString * _Nonnull const ZFPickerViewPropertyBackgroundAlphaKey;  // background alpha, default 0.5(0.0~1.0)（背景视图透明度）

@end

NS_ASSUME_NONNULL_END
