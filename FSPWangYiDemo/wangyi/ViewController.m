//
//  ViewController.m
//  wangyi
//
//  Created by Yozi on 16/10/19.
//  Copyright © 2016年 XueHai. All rights reserved.
//

#import "ViewController.h"
#import "BaseView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BaseView *b = [[BaseView alloc]initWithFrame:self.view.frame];
    self.view = b;
    __weak __typeof__(b)wB = b;
    [b setSelectedBlock:^(NSInteger tag, UIButton *sender) {
         TempView *v = [wB.viewArray objectAtIndex:sender.tag];
        v.l.text=[NSString stringWithFormat:@"吃东西%ld",sender.tag];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
