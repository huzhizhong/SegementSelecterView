//
//  SelecterToolsViewController.m
//  SelecterTools
//
//  Created by hzz on 16/9/15.
//  Copyright © 2016年. All rights reserved.
//

#import "SelecterToolsViewController.h"
#import "SelecterToolsScrolView.h"
#import "SelecterContentScrollView.h"
#import "TestViewController.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height


@interface SelecterToolsViewController ()

@property(nonatomic,retain)NSArray *titleArr;
@property(nonatomic,retain)NSMutableArray *vcArr;
@property(nonatomic,retain)NSArray *urlArr;

@property(nonatomic,retain)SelecterToolsScrolView *selectTools;
@property(nonatomic,retain)SelecterContentScrollView *contentScrView;

@end

@implementation SelecterToolsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"SegementSelecterView";
    
    self.view.backgroundColor = [UIColor whiteColor];
    _titleArr = @[@"卡片1➡️",@"卡片2➡️",@"卡片3➡️",@"卡片4➡️",@"卡片5➡️",@"卡片6➡️",@"卡片7➡️" ];    
    _urlArr = @[@"http://baidu.com",@"http://baidu.com",@"http://baidu.com",@"http://baidu.com",@"http://baidu.com",@"http://baidu.com",@"http://baidu.com",@"http://baidu.com",@"http://baidu.com"];
    _vcArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < 7 ; i++) {
        TestViewController *vc = [[TestViewController alloc]init];
        vc.url = _urlArr[i];
        [self addChildViewController:vc];
        [_vcArr addObject:vc];
    }
    [self createSelecterToolsSrc:@"4"];
    [self createContentVCSrc:@"4"];
}

-(void)createSelecterToolsSrc:(NSString *)str
{
    __weak typeof(self) weakSelf = self;
    
    _selectTools = [[SelecterToolsScrolView alloc]initWithSeleterConditionTitleArr:_titleArr selectIndex:str andBtnBlock:^(UIButton * btn) {
        [weakSelf updateVCViewFrom:btn.tag];
    }];
    [self.view addSubview:_selectTools];
}

-(void)createContentVCSrc:(NSString *)str
{
    __weak typeof(self) weakSelf = self;
    _contentScrView = [[SelecterContentScrollView alloc]initWithSeleterConditionTitleArr:_vcArr urlArr:_urlArr selectIndex:str andBtnBlock:^(int index) {
        [weakSelf updateSelectToolsIndex:index];
    }];
    [self.view addSubview:_contentScrView];
}


-(void)updateSelectToolsIndex:(NSInteger)index
{
    [_selectTools updateSelecterToolsIndex:index];
}

-(void)updateVCViewFrom:(NSInteger )index
{
    [_contentScrView updateVCViewFromIndex:index];
}

-(void)dealloc
{
    NSLog(@"dealloc");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
