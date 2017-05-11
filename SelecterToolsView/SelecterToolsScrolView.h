//
//  SelecterToolsScrolView.h
//  SelecterTools
//
//  Created by hzz on 16/9/15.
//  Copyright © 2016年. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^BtnClick)(UIButton *);


typedef enum : NSUInteger {
    TriggerTypeOfBtnClick,
    TriggerTypeOfScrViewScroll,
} TriggerType;

@interface SelecterToolsScrolView : UIScrollView


-(void)updateSelecterToolsIndex:(NSInteger )index;


-(instancetype)initWithSeleterConditionTitleArr:(NSArray *)titleArr selectIndex:(NSString *)strIndex andBtnBlock:(BtnClick)btnClick;

@end
