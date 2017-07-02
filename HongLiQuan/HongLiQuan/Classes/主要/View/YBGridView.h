//
//  YBGridView.h
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/18.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBChartYView.h"

@interface YBGridView : UIView

- (instancetype)initWithFrame:(CGRect)frame style:(YBChartYViewStyle)style points:(NSArray<NSString *> *)points;

@end
