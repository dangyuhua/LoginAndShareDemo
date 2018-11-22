//
//  QuickCreate.h
//  Shopping
//
//  Created by 党玉华 on 2018/7/11.
//  Copyright © 2018年 党玉华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>


@interface QuickCreate : NSObject

//UIButton
+(UIButton *)UIButtonWithFrame:(CGRect )frame backgroundColor:(UIColor *)backgroundColor title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage font:(CGFloat)font textColor:(UIColor *)textColor selectTextColor:(UIColor *)selectTextColor edgeInsets:(UIEdgeInsets )edgeInsets tag:(NSInteger)tag target:(id)target action:(SEL)action;
//导航栏返回按钮
+(UIBarButtonItem *)UIBarButtonItemNavBackBarButtonItemWithTarget:(id)target action:(SEL)action;
//导航栏按钮
+(UIBarButtonItem *)UIBarButtonItemBarButtonWithTarget:(id)target action:(SEL)action frame:(CGRect )frame title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage font:(CGFloat)font textColor:(UIColor *)textColor edgeInsets:(UIEdgeInsets)edgeInsets;
//上拉下拉tableview
+(UITableView *)UITableViewMJRefreshWithBackgroundColor:(UIColor *)color frame:(CGRect )frame style:(UITableViewStyle)style contentInset:(UIEdgeInsets )contentInset footIsNeedDrag:(BOOL)footIsNeedDrag mjheadBlock:(void (^)(void))mjheadBlock mjfootBlock:(void (^)(void))mjfootBlock;
//
+(UITableView *)UITableViewWithBackgroundColor:(UIColor *)color frame:(CGRect )frame separatorStyle:(UITableViewCellSeparatorStyle )separatorStyle style:(UITableViewStyle)style contentInset:(UIEdgeInsets )contentInset;
//通过data获取image,可获取image大小
+(UIImage *)UIImageWithimageURL:(NSString *)imageURL;
//UICollectionView
+(UICollectionView *)UICollectionViewWithFrame:(CGRect)frame scrollDirection:(UICollectionViewScrollDirection )scrollDirection itemSize:(CGSize )itemSize minimumLineSpacing:(CGFloat )minimumLineSpacing minimumInteritemSpacing:(CGFloat )minimumInteritemSpacing backgroundColor:(UIColor *)backgroundColor scrollEnabled:(BOOL )scrollEnabled pagingEnabled:(BOOL )pagingEnabled showsScrollIndicator:(BOOL )showsScrollIndicator contentInset:(UIEdgeInsets )contentInset;
//UICollectionView
+(UICollectionView *)UICollectionViewMJRefreshWithFrame:(CGRect)frame scrollDirection:(UICollectionViewScrollDirection )scrollDirection itemSize:(CGSize )itemSize minimumLineSpacing:(CGFloat )minimumLineSpacing minimumInteritemSpacing:(CGFloat )minimumInteritemSpacing backgroundColor:(UIColor *)backgroundColor scrollEnabled:(BOOL )scrollEnabled pagingEnabled:(BOOL )pagingEnabled showsScrollIndicator:(BOOL )showsScrollIndicator contentInset:(UIEdgeInsets )contentInset footerLabelLeftInset:(CGFloat)inset mjfootBlock:(void (^)(void))mjfootBlock;
//解决含有UICollectionView的vc手势返回冲突
+(UICollectionView *)UICollectionViewConflictWithVCBack:(UICollectionView *)collectionview vc:(UIViewController *)vc;
//UIScrollView
+ (UIScrollView *)UIScrollViewWithFrame:(CGRect )frame backgroundColor:(UIColor *)bgcolor size:(CGSize )size isPagingEnable:(BOOL )isPage isBounces:(BOOL )isBounces scrollEnabled:(BOOL )scrollEnabled isShowVerticalIndicator:(BOOL )isShowVIndicator isShowsHorizontalScrollIndicator:(BOOL )isShowHIndicator;
//解决含有scrollview的vc手势返回冲突
+(UIScrollView *)UIScrollViewConflictWithVCBack:(UIScrollView *)scrollview vc:(UIViewController *)vc;
//
+(UIView *)UIViewWithFrame:(CGRect )frame backgroundColor:(UIColor *)backgroundColor;
//
+(UITextView *)UITextViewithFrame:(CGRect )frame backgroundColor:(UIColor *)backgroundColor content:(NSString *)content font:(CGFloat)fontSize textColor:(UIColor *)textColor;
//
+(UITextField *)UITextFieldWithFrame:(CGRect )frame cornerRadius:(CGFloat )r font:(CGFloat)font borderStyle:(UITextBorderStyle )borderStyle backgroundColor:(UIColor *)bgcolor placeholder:(NSString *)placeholder attributes:(NSDictionary<NSAttributedStringKey, id> *)attrs returnKeyType:(UIReturnKeyType)returnKeyType leftview:(UIView *)leftview rightView:(UIView *)rightView clearButtonMode:(UITextFieldViewMode )clearButtonMode keyboardType:(UIKeyboardType )keyboardType;
//
+(UIImageView *)UIImageViewWithFrame:(CGRect )frame image:(NSString *)image;
//
+(UILabel *)UILabelWithFrame:(CGRect )frame backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor text:(NSString *)text numberOfLines:(NSInteger)numberOfLines textAlignment:(NSTextAlignment )textAlignment font:(CGFloat)fontSize;
//UISearchController
+(UISearchController *)UISearchControllerWithSearchResultsController:(UIViewController *)searchResultsController frame:(CGRect )frame;
//WKWebView
+(WKWebView *)WKWebViewWithFrame:(CGRect )frame url:(NSString *)url;
//UIActivityIndicatorView
+(UIActivityIndicatorView *)UIActivityIndicatorViewWithFrame:(CGRect )frame activityIndicatorViewStyle:(UIActivityIndicatorViewStyle) activityIndicatorViewStyle;
+(NSAttributedString *)NSAttributedStringWithIndex1:(NSInteger )index1 index2:(NSInteger )index2 string:(NSString *)string color:(UIColor *)color font:(CGFloat)font;
//尚未确定
+(UIControl *)TopImageBottomStringWithFrame:(CGRect)frame image:(NSString *)image imageurl:(NSString *)imageurl placeholderImage:(NSString *)placeholderImage name:(NSString *)name font:(CGFloat)font textColor:(UIColor *)textColor tag:(NSInteger)tag target:(id)target action:(SEL)action;
//下载图片
+(UIImageView *)SDWebImageSetImage:(UIImageView *)imageview url:(NSString *)imageURL placeholderImage:(NSString *)placeholderImage;
//图片渐显
+(UIImageView *)SDWebImageFadeInImageView:(UIImageView *)imageview url:(NSString *)url placeholderImage:(NSString *)placeholderImage;
//下载图片(需要获取frame的)
+(UIImageView *)SDWebImageNeedFrame:(UIImageView *)imageview url:(NSString *)imageURL placeholderImage:(NSString *)placeholderImage;
//截取字符串
+(NSString *)cutoutNSString:(NSString *)str range:(NSInteger )index;
//
+(UIControl *)UIControlFrame:(CGRect )frame backgroundColor:(UIColor *)backgroundColor tag:(int)tag target:(id)target action:(SEL)action;
//计算字符串高度
+(CGFloat)calculatedStringHeight:(NSString *)string WithSize:(CGSize)size font:(CGFloat)fontSize;
//计算字符串宽度
+(CGFloat)calculatedStringWidth:(NSString *)string WithSize:(CGSize)size font:(CGFloat)fontSize;

// 根据图片url获取图片尺寸
+(CGSize)getImageSizeWithURL:(id)imageURL;
//获得目前时间
+(NSString *)getCurrentDateFormatter:(NSString *)dateFormat;
//获取某个时间与现在时间差
+(NSInteger)getTimeDifferenceWithNowTime:(NSString*)nowTime endTime:(NSString*)endTime;
//数字字符串转成时间字符串
+(NSString *)NumberTimeChangeString:(NSString *)time;
//string时间转数字时间戳
+(NSString *)StringDateToNSIntergeTime:(NSString*)time;
//获取目前的VC
+ (UIViewController *)getCurrentVC;
//用途比如推送跳转
+ (UINavigationController *)getCurrentNav;
//设置NSAttributedString颜色
+(NSMutableAttributedString *)NSMutableAttributedStringColorConfigText:(NSString *)text textColor:(UIColor *)textColor range:(NSRange)range;
//震动
+(void)playVibrate;
//image转data
+(NSData *)UIImageExchangeNSData:(UIImage *)image;
//data转image
+(UIImage *)NSDataExchangeUIImage:(NSData *)data;
//相机相册调用
+(UIImagePickerController *)UIImagePickerControllerWithAllowsEditing:(BOOL)allowsEditing sourceType:(UIImagePickerControllerSourceType) sourceType;
//点按
+(UITapGestureRecognizer *)UITapGestureRecognizerWithTarget:(id)target action:(SEL)action;
//长按
+(UILongPressGestureRecognizer *)UILongPressGestureRecognizerWithTarget:(id)target action:(SEL)action;
//轻扫
+(UISwipeGestureRecognizer *)UISwipeGestureRecognizerWithTarget:(id)target action:(SEL)action direction:(UISwipeGestureRecognizerDirection)direction;
//旋转
+(UIRotationGestureRecognizer *)UIRotationGestureRecognizerWithTarget:(id)target action:(SEL)action;
//捏合
+(UIPinchGestureRecognizer *)UIPinchGestureRecognizerWithTarget:(id)target action:(SEL)action;
//拖拽
+(UIPanGestureRecognizer *)UIPanGestureRecognizerWithTarget:(id)target action:(SEL)action;
//FPS检测 //流畅度
+(void)FPSLabel;
// 返回虚线image的方法
+(UIImage *)drawLineByImageView:(UIImageView *)imageView lineColor:(UIColor *)color;
@end
