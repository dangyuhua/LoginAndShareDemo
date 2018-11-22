//
//  QuickCreate.m
//  Shopping
//
//  Created by 党玉华 on 2018/7/11.
//  Copyright © 2018年 党玉华. All rights reserved.
//

#import "QuickCreate.h"

@interface QuickCreate()

@property (nonatomic, strong)NSTimer *timer;

@property (nonatomic, assign)NSInteger second;

@end

@implementation QuickCreate
//UIButton
+(UIButton *)UIButtonWithFrame:(CGRect )frame backgroundColor:(UIColor *)backgroundColor title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage font:(CGFloat)font textColor:(UIColor *)textColor selectTextColor:(UIColor *)selectTextColor edgeInsets:(UIEdgeInsets )edgeInsets tag:(NSInteger)tag target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = backgroundColor;
    button.frame = frame;
    if (title != nil) {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:textColor forState:UIControlStateNormal];
        [button setTitleColor:selectTextColor forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:font];
        button.titleEdgeInsets = edgeInsets;
    }else{
        [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
        button.imageEdgeInsets = edgeInsets;
    }
    button.tag = tag;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}




//UIScrollView
+ (UIScrollView *)UIScrollViewWithFrame:(CGRect )frame backgroundColor:(UIColor *)bgcolor size:(CGSize )size isPagingEnable:(BOOL )isPage isBounces:(BOOL )isBounces scrollEnabled:(BOOL )scrollEnabled isShowVerticalIndicator:(BOOL )isShowVIndicator isShowsHorizontalScrollIndicator:(BOOL )isShowHIndicator{
    
    UIScrollView *scrollview = [[UIScrollView alloc]initWithFrame:frame];
    scrollview.backgroundColor = bgcolor;
    scrollview.contentSize = size;
    scrollview.pagingEnabled = isPage;
    scrollview.bounces = isBounces;
    scrollview.scrollEnabled = scrollEnabled;
    scrollview.showsVerticalScrollIndicator = isShowVIndicator;
    scrollview.showsHorizontalScrollIndicator = isShowHIndicator;
    return scrollview;
}
//解决含有scrollview的vc手势返回冲突
+(UIScrollView *)UIScrollViewConflictWithVCBack:(UIScrollView *)scrollview vc:(UIViewController *)vc{
    NSArray *gestureArray = vc.navigationController.view.gestureRecognizers;
    for (UIGestureRecognizer *gestureRecognizer in gestureArray) {
        if ([gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
            [scrollview.panGestureRecognizer requireGestureRecognizerToFail:gestureRecognizer];
        }
    }
    return scrollview;
}


@end





