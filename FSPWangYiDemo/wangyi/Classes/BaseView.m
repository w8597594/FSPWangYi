//
//  BaseView.m
//  wangyi
//
//  Created by Yozi on 16/10/19.
//  Copyright © 2016年 XueHai. All rights reserved.
//

#import "BaseView.h"
#define SCREENW [UIScreen mainScreen].bounds.size.width

@implementation TempView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _l = [[UILabel alloc]init];
        _l.textAlignment = NSTextAlignmentCenter;
        _l.backgroundColor = [UIColor clearColor];
        _l.frame = CGRectMake(0, 0, SCREENW, 500);
        [self addSubview:_l];
    }
    return self;
}

@end

@implementation BaseView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        btnArray = [[NSMutableArray alloc]init];
        _viewArray = [[NSMutableArray alloc]init];
        self.backgroundColor = [UIColor whiteColor];
        titleArray = [[NSMutableArray alloc]initWithObjects:@"新浪",@"网易",@"谷歌",@"腾讯",@"淘宝",@"京东",@"唯品会",@"微信",@"其他", nil];
        contentArray = [[NSMutableArray alloc]init];
        _titleScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20,SCREENW , 50)];
//        _titleScrollView.backgroundColor = [UIColor redColor];
        _titleScrollView.showsHorizontalScrollIndicator = YES;
        _titleScrollView.contentSize = CGSizeMake([titleArray count]*50, 50);
        _titleScrollView.contentOffset = CGPointMake(0, 0);
        _titleScrollView.delegate = self;
        [self addSubview:_titleScrollView];
        [self createTitleScrollView];
        _contentScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 70, SCREENW, 800)];
        _contentScrollView.contentSize = CGSizeMake([titleArray count]*SCREENW, 800);
        _contentScrollView.contentOffset = CGPointMake(0, 0);
        _contentScrollView.delegate = self;
        _contentScrollView.bounces = YES;
        _contentScrollView.pagingEnabled = YES;
        [self addSubview:_contentScrollView];
        [self createContentScrollView];
        
        tickView = [[UIView alloc]initWithFrame:CGRectMake(0, 45, 50, 5)];
        tickView.backgroundColor = [UIColor yellowColor];
        [_titleScrollView addSubview:tickView];
        
    }
    return self;
}

- (void)createTitleScrollView
{
    for (int i =0; i<[titleArray count]; i++) {
        UIButton *bu = [[UIButton alloc]initWithFrame:CGRectMake(i*50, 0, 50, 50)];
        bu.titleLabel.font = [UIFont systemFontOfSize:14];
        [bu setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
        [bu setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [bu setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
        bu.adjustsImageWhenHighlighted=NO;
        bu.highlighted=NO;
        bu.tag = i;
        if (i==0) {
            bu.selected=YES;
            lastSelected=0;
        }
        [btnArray addObject:bu];
        [bu addTarget:self action:@selector(buAct:) forControlEvents:UIControlEventTouchUpInside];
        bu.backgroundColor = [UIColor blueColor];
        [_titleScrollView addSubview:bu];
    }
}

- (void)setSelectedBlock:(SelectedBlock)block
{
    selectBlock = block;
}

- (void)buAct:(UIButton *)sender
{
    if (lastSelected==sender.tag) {
        return;
    }else{
        UIButton *bu = [btnArray objectAtIndex:lastSelected];
        bu.selected=NO;
    }
    sender.selected = YES;
    CGRect rect = CGRectMake(sender.tag*50, 45, 50, 5);
    [UIView animateWithDuration:0.3
                     animations:^{
                         tickView.frame = rect;
                     }];
    [UIView animateWithDuration:0.3
                     animations:^{
                         [_contentScrollView setContentOffset:CGPointMake(sender.tag*SCREENW, 0) animated:NO];
                         
                     }];
    if (selectBlock) {
        selectBlock(sender.tag,sender);
    }
}

- (void)createContentScrollView
{
    for (int i =0; i<[titleArray count]; i++) {
        TempView *view = [[TempView alloc]initWithFrame:CGRectMake(i*SCREENW, 0, SCREENW, 800)];
        view.backgroundColor = view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
        [_viewArray addObject:view];
        [_contentScrollView addSubview:view];
        view.l.text = [titleArray objectAtIndex:i];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:_contentScrollView]) {
        CGFloat x = (int)scrollView.contentOffset.x/SCREENW;
        CGRect rect = CGRectMake(50*x, 45, 50, 5);
        [UIView animateWithDuration:0.3
                         animations:^{
                             tickView.frame=rect;
                             [_titleScrollView scrollRectToVisible:CGRectMake(50*x-150, 20, SCREENW, 50) animated:NO];
                         }];
        for (int i=0 ;i<btnArray.count;i++) {
            if (x==i) {
                UIButton *bu = [btnArray objectAtIndex:i];
                bu.selected = YES;
                if (lastSelected>=0&&lastSelected!=i) {
                    UIButton *bu = [btnArray objectAtIndex:lastSelected];
                    bu.selected =NO;
                }
                lastSelected = i;
            }
        }
    }
}
@end
