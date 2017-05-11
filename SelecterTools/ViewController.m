//
//  ViewController.m
//  SelecterTools
//
//  Created by hzz on 16/9/15.
//  Copyright © 2016年. All rights reserved.
//

#import "ViewController.h"
#import "SelecterToolsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}
- (IBAction)nextBtnClick:(UIButton *)sender {
    
    SelecterToolsViewController *vc = [[SelecterToolsViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
