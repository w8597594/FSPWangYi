//
//  BaseView.h
//  wangyi
//
//  Created by Yozi on 16/10/19.
//  Copyright © 2016年 XueHai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempView : UIView
@property(nonatomic,strong)UILabel  *l;
@end

typedef void (^SelectedBlock) (NSInteger tag,UIButton *sender);

@interface BaseView : UIView<UIScrollViewDelegate>
{
    NSMutableArray  *titleArray;
    NSMutableArray  *contentArray;
    UIView          *tickView;
    NSMutableArray  *btnArray;
    NSInteger       lastSelected;
    SelectedBlock   selectBlock;
}
@property(nonatomic,strong)NSMutableArray   *viewArray;
@property(nonatomic,strong)UIScrollView     *titleScrollView;
@property(nonatomic,strong)UIScrollView     *contentScrollView;
-(void)setSelectedBlock:(SelectedBlock)block;

@end
