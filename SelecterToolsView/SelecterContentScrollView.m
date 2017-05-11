 //
//  SelecterContentScrollView.m
//  SelecterTools
//
//  Created by hzz on 16/9/15.
//  Copyright © 2016年. All rights reserved.
//

#import "SelecterContentScrollView.h"


#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface SelecterContentScrollView ()<UIScrollViewDelegate>

@property(nonatomic,retain)NSArray *vcArr;
@property(nonatomic,retain)NSArray *urlArr;
@property(nonatomic,copy)ScrollPage scrollPage;

@end

@implementation SelecterContentScrollView

-(instancetype)initWithSeleterConditionTitleArr:(NSArray *)vcArr urlArr:(NSArray *)urlarr selectIndex:(NSString *)str  andBtnBlock:(ScrollPage)page
{
    self = [super init];
    if (self) {
        self.selectUrl =[str integerValue];
        self.frame = CGRectMake(0,64+68,WIDTH,HEIGHT-self.frame.origin.y);
        self.backgroundColor = [UIColor whiteColor];
        _vcArr = vcArr;
        _urlArr = urlarr;
        [self lazyLoadVcFromIndex:0];
        self.pagingEnabled = YES;
        self.contentSize = CGSizeMake(WIDTH * vcArr.count,self.frame.size.height);
        self.delegate = self;
        self.scrollPage = page;
        [self updateVCViewFromIndex:self.selectUrl];
    }
    return self;
}

-(void)updateVCViewFromIndex:(NSInteger )index
{
    [self setContentOffset:CGPointMake(index*WIDTH, 0) animated:YES];
}

-(void)lazyLoadVcFromIndex:(NSInteger )index
{
    UIViewController *vc = _vcArr[index];
    vc.view.frame = CGRectMake(WIDTH*index,0, WIDTH,self.frame.size.height);
    [self addSubview:vc.view];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (scrollView.contentOffset.x+WIDTH/2)/WIDTH;
    [self lazyLoadVcFromIndex:page];
    self.scrollPage(page);
}

@end
