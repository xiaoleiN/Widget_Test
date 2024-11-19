//
//  ViewController.m
//  sofamon Widget
//
//  Created by 任晓磊 on 2024/11/19.
//

#import "ViewController.h"
#import "SWAlertView.h"
#import <Masonry/Masonry.h>
#import "UIDefineHeader.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface ViewController ()
@property (nonatomic, strong) UIButton *addWidgetButton;
@property (nonatomic, strong) UIScrollView * bigScrollView;
@property (nonatomic, strong) UIView * maskView;
@property (nonatomic, strong) SWAlertView * alertView;
@property (nonatomic, strong) UIImageView *leftImg;
@property (nonatomic, strong) UIImageView *rightImg;
@property (nonatomic, strong) UIImageView *centerImageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUI];
}

-(void)setUI{
    
    UIScrollView *bigScrollView = [[UIScrollView alloc] init];
    bigScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:bigScrollView];
    [bigScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    // 在bigScrollView中添加内容
    UIView *contentView = [[UIView alloc] init];
    [bigScrollView addSubview:contentView];
    self.bigScrollView = bigScrollView;
    
    // topBtn
    self.addWidgetButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.addWidgetButton setTitle:@"Add Widgets to Home Screen" forState:UIControlStateNormal];
    [self.addWidgetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.addWidgetButton.backgroundColor = [UIColor colorWithRed:78.0f/255.0 green:146.0f/255.0 blue:255.0f/255.0 alpha:1];
    self.addWidgetButton.layer.cornerRadius = 34/2;
    [self.addWidgetButton addTarget:self action:@selector(showInstructionPopup) forControlEvents:UIControlEventTouchUpInside];
    [self.bigScrollView addSubview:self.addWidgetButton];
    [self.addWidgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(330, 34));
        make.centerX.equalTo(self.bigScrollView);
        if(kIsIphoneXSMAX){
            make.top.mas_equalTo(kIsIphone14Pro?70:50);
        }else{
            make.top.mas_equalTo(kIsIphone14Pro?65:50);
        }
    }];
    
    
    self.leftImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img1"]];
    self.leftImg.contentMode = 2;
    self.leftImg.layer.cornerRadius = 21.6f;
    self.leftImg.clipsToBounds = YES;
    self.leftImg.userInteractionEnabled = YES;
    [self.bigScrollView addSubview:self.leftImg];
    [self.leftImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(29);
        make.width.height.mas_equalTo(155);
        make.top.equalTo(self.addWidgetButton.mas_bottom).offset(20);
    }];
    [self.leftImg addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftImgClick)]];
    
    self.rightImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img2"]];
    self.rightImg.contentMode = 2;
    self.rightImg.layer.cornerRadius = 21.6f;
    self.rightImg.clipsToBounds = YES;
    self.rightImg.userInteractionEnabled = YES;
    [self.bigScrollView addSubview:self.rightImg];
    [self.rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-29);
        make.width.height.mas_equalTo(155);
        make.top.equalTo(self.addWidgetButton.mas_bottom).offset(20);
    }];
    [self.rightImg addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightImgClick)]];


    self.centerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img3"]];
    self.centerImageView.layer.cornerRadius = 21.6f;
    self.centerImageView.contentMode = 2;
    self.centerImageView.clipsToBounds = YES;
    self.centerImageView.userInteractionEnabled = YES;
    [self.bigScrollView addSubview:self.centerImageView];
    [self.centerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(ZTAdaptedSize(329, 155));
        make.top.equalTo(self.rightImg.mas_bottom).offset(20);
        make.centerX.mas_equalTo(0);
    }];
    [self.centerImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(centerImageViewClick)]];

    
    UIImageView * bottomImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img4"]];
    bottomImageView.layer.cornerRadius = 21.6f;
    bottomImageView.contentMode = 2;
    bottomImageView.clipsToBounds = YES;
    [self.bigScrollView addSubview:bottomImageView];
    [bottomImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(ZTAdaptedSize(329, 345));
        make.top.equalTo(self.centerImageView.mas_bottom).offset(20);
        make.centerX.mas_equalTo(0);
    }];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(bigScrollView);
        make.width.equalTo(bigScrollView); // 保证内容宽度与 bigScrollView 一致
        make.bottom.equalTo(bottomImageView.mas_bottom).offset(20); // 确保 contentSize 正确计算
    }];
    
    [self.view addSubview:self.maskView];
    [self.view addSubview:self.alertView];
    [self.alertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo([UIScreen mainScreen].bounds.size.height - (kIsIphone14Pro?358:323));
        make.top.equalTo(self.view.mas_bottom).offset(200);
    }];
        

}
- (void)showInstructionPopup {
    [self.maskView setHidden:NO];
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.33 animations:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf) {
            [weakSelf.alertView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(weakSelf.view.mas_bottom).offset(-([UIScreen mainScreen].bounds.size.height - (kIsIphone14Pro?358:323)));
            }];}
        [self.view layoutIfNeeded];
    }];
}
-(UIView *)maskView{
    if(!_maskView){
        _maskView = [[UIView alloc] initWithFrame:self.view.frame];
        _maskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        _maskView.hidden = YES;
    }
    return _maskView;
}
-(SWAlertView *)alertView{
    if(!_alertView){
        _alertView = [[SWAlertView alloc] init];
        _alertView.layer.cornerRadius = 21.6f;
        _alertView.clipsToBounds = YES;
        __weak typeof(self) weakSelf = self;
        _alertView.okayBtnClickBlock = ^{
            [weakSelf dissMissView];
        };

    }
    return _alertView;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dissMissView];
}
-(void)dissMissView{
    [self.maskView setHidden:YES];
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.33 animations:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf) {
            [strongSelf.alertView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(strongSelf.view.mas_bottom).offset(200);
            }];
            [strongSelf.view layoutIfNeeded];
        }
    }];
}
-(void)leftImgClick{
    [self addShakeAnimationToImageView:self.leftImg withTranStr:@"transform.translation.x"];
}
-(void)rightImgClick{
    [self addShakeAnimationToImageView:self.rightImg withTranStr:@"transform.translation.y"];
}
-(void)centerImageViewClick{
    [self addBigOrSmallSpringShakeAnimationToImageView:self.centerImageView];
}
- (void)addShakeAnimationToImageView:(UIImageView *)imageView withTranStr:(NSString *)tran{
    // 创建 Keyframe 动画
    CAKeyframeAnimation *shakeAnimation = [CAKeyframeAnimation animationWithKeyPath:tran];
    // 设置抖动路径
    shakeAnimation.values = @[@-10, @10, @-8, @8, @-5, @5, @0]; // 抖动幅度
    shakeAnimation.duration = 0.5; // 持续时间
    shakeAnimation.repeatCount = 1; // 重复次数
    
    // 将动画添加到 UIImageView 的图层
    [imageView.layer addAnimation:shakeAnimation forKey:@"shake"];
    
    // 添加震动反馈
    if (@available(iOS 10.0, *)) { // 震动反馈只支持 iOS 10 及以上
        UIImpactFeedbackGenerator *feedbackGenerator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
        [feedbackGenerator prepare];
        [feedbackGenerator impactOccurred];
    }
}
- (void)addBigOrSmallSpringShakeAnimationToImageView:(UIImageView *)imageView{
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @(1.0);
    scaleAnimation.toValue = @(1.2); // 放大 1.2 倍
    scaleAnimation.autoreverses = YES; // 动画反向
    scaleAnimation.duration = 0.3;
    scaleAnimation.repeatCount = 2; // 重复 3 次
    [imageView.layer addAnimation:scaleAnimation forKey:@"scale"];

    // 添加震动反馈
    if (@available(iOS 10.0, *)) { // 震动反馈只支持 iOS 10 及以上
        UIImpactFeedbackGenerator *feedbackGenerator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
        [feedbackGenerator prepare];
        [feedbackGenerator impactOccurred];
    }
}
@end
