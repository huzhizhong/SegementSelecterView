//
//  SelecterToolsScrolView.m
//  SelecterTools
//
//  Created by hzz on 16/9/15.
//  Copyright © 2016年. All rights reserved.
//

#import "SelecterToolsScrolView.h"
#import "UIViewExt.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

#define TitleFont 14


@interface SelecterToolsScrolView()

@property(nonatomic,copy)BtnClick btnClick;


@property(nonatomic,retain)NSMutableArray *btnArr;
@property(nonatomic,retain)UIButton * previousBtn;
@property(nonatomic,retain)UIButton * currentBtn;
@property(nonatomic,assign)NSInteger currIdx;

@property(nonatomic,retain)UIView *bottomScrLine;
@end

@implementation SelecterToolsScrolView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithSeleterConditionTitleArr:(NSArray *)titleArr selectIndex:(NSString *)strIndex andBtnBlock:(BtnClick)btnClick
{
    self = [super init];
    if (self) {
        UIImage *imageV = [UIImage imageNamed:@"sqjr_list_h5header_0"];
        NSLog(@"%lf",imageV.size.height);
        self.frame = CGRectMake(-1,64,WIDTH+2, imageV.size.height);
        self.backgroundColor = [UIColor whiteColor];
        _btnArr = [NSMutableArray array];
        _currIdx = [strIndex integerValue];
        for (int i = 0; i<titleArr.count; i++) {
            UIButton *titleBtn = [[UIButton alloc]initWithFrame:CGRectMake(i*imageV.size.width,0, imageV.size.width,imageV.size.height)];
            titleBtn.tag = i;
            [titleBtn setBackgroundImage:[UIImage imageNamed:@"sqjr_list_h5header_1"] forState:UIControlStateNormal];
            [titleBtn setBackgroundColor:[UIColor blueColor]];
            [titleBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            titleBtn.titleEdgeInsets = UIEdgeInsetsMake(20, 0, 0, 0);
            [titleBtn setTitle:titleArr[i] forState:UIControlStateNormal];
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:TitleFont];
            [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [titleBtn setBackgroundImage:[UIImage imageNamed:@"sqjr_list_h5header_2"] forState:UIControlStateSelected];
            [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            titleBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
            [self addSubview:titleBtn];
            [_btnArr addObject:titleBtn];
            }
        _bottomScrLine = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-3,80,3)];
        _bottomScrLine.center = CGPointMake(_currentBtn.center.x, _bottomScrLine.center.y);
        _bottomScrLine.backgroundColor = [UIColor whiteColor];
        [self addSubview:_bottomScrLine];
        self.contentSize = CGSizeMake(titleArr.count*imageV.size.width, imageV.size.height);
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.btnClick = btnClick;
        [self updateSelecterToolsIndex:self.currIdx];
    }
    return self;
}

-(void)updateSelecterToolsIndex:(NSInteger )index
{
    UIButton *selectBtn = _btnArr[index];
    [self changeSelectBtn:selectBtn];
}

-(void)btnClick:(UIButton *)sender
{
    self.btnClick(sender);
}

-(void)changeSelectBtn:(UIButton *)btn
{
    _previousBtn = _currentBtn;
    _currentBtn = btn;
    _previousBtn.selected = NO;
    _currentBtn.selected = YES;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _bottomScrLine.center = CGPointMake(_currentBtn.center.x, _bottomScrLine.center.y);
    } completion:^(BOOL finished) {
        
    }];
    if (_currentBtn.center.x<WIDTH/2) {
        [self setContentOffset:CGPointMake(0, 0) animated:YES];
    }else if (_currentBtn.center.x>self.contentSize.width-WIDTH/2)
    {
        [self setContentOffset:CGPointMake(self.contentSize.width-WIDTH, 0) animated:YES];
    }else
    {
        [self setContentOffset:CGPointMake(btn.center.x-WIDTH/2, 0) animated:YES];

    }
    
}

@end
