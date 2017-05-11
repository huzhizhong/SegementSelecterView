//
//  SelecterContentScrollView.h
//  SelecterTools
//
//  Created by hzz on 16/9/15.
//  Copyright © 2016年. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ScrollPage)(int);

@interface SelecterContentScrollView : UIScrollView

@property (nonatomic, assign) NSInteger selectUrl;

-(void)updateVCViewFromIndex:(NSInteger )index;

-(instancetype)initWithSeleterConditionTitleArr:(NSArray *)vcArr urlArr:(NSArray *)urlarr selectIndex:(NSString *)str andBtnBlock:(ScrollPage)page;



@end
