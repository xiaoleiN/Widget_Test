//
//  SWAlertView.m
//  sofamon Widget
//
//  Created by 任晓磊 on 2024/11/19.
//

#import "SWAlertView.h"
//屏幕宽度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
// 刘海屏 宏定义
#define MPIPhoneX (SCREEN_HEIGHT >= 780.f ? YES : NO)
// 适配刘海屏状态栏高度
#define MPStatusBarHeight (MPIPhoneX ? 44.f : 20.f)
// 适配iPhone X 导航栏高度
#define LHNavHeight (MPIPhoneX ? 88.f : 64.f)
// 适配iPhone X 距离底部的距离
#define MPBottomSafeHeight (MPIPhoneX ? 34.f : 0.f)
@implementation SWAlertView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self == [super initWithFrame:frame]){
        [self setUI];
    }
    return self;
}
-(void)setUI{
    //bgColor
    self.backgroundColor = [UIColor whiteColor];
    
    UIButton * okayBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [okayBtn setTitle:@"Okay" forState:UIControlStateNormal];
    [okayBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    okayBtn.backgroundColor = [UIColor colorWithRed:78.0f/255.0 green:146.0f/255.0 blue:255.0f/255.0 alpha:1];
    okayBtn.layer.cornerRadius = 42/2;
    [okayBtn addTarget:self action:@selector(okayBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:okayBtn];
    [okayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(357, 42));
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-MPBottomSafeHeight);
    }];
    
    UIView * botView = [[UIView alloc] init];
    botView.backgroundColor = [UIColor colorWithRed:247.0f/255.0f green:247.0f/255.0f blue:247.0f/255.0f alpha:1];
    botView.clipsToBounds = YES;
    botView.layer.cornerRadius = 12;
    botView.layer.borderColor = [UIColor colorWithRed:240.0f/255.0f green:240.0f/255.0f blue:240.0f/255.0f alpha:1].CGColor;
    botView.layer.borderWidth = 1.0f;
    [self addSubview:botView];
    [botView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(17);
        make.right.mas_equalTo(-17);
        make.height.mas_equalTo(105);
        make.bottom.equalTo(okayBtn.mas_top).offset(-12);
    }];
    
    
    UIView * centerView = [[UIView alloc] init];
    centerView.backgroundColor = [UIColor colorWithRed:247.0f/255.0f green:247.0f/255.0f blue:247.0f/255.0f alpha:1];
    centerView.clipsToBounds = YES;
    centerView.layer.cornerRadius = 12;
    centerView.layer.borderColor = [UIColor colorWithRed:240.0f/255.0f green:240.0f/255.0f blue:240.0f/255.0f alpha:1].CGColor;
    centerView.layer.borderWidth = 1.0f;
    [self addSubview:centerView];
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(17);
        make.right.mas_equalTo(-17);
        make.height.mas_equalTo(105);
        make.bottom.equalTo(botView.mas_top).offset(-12);
    }];

    UIView * topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor colorWithRed:247.0f/255.0f green:247.0f/255.0f blue:247.0f/255.0f alpha:1];
    topView.clipsToBounds = YES;
    topView.layer.cornerRadius = 12;
    topView.layer.borderColor = [UIColor colorWithRed:240.0f/255.0f green:240.0f/255.0f blue:240.0f/255.0f alpha:1].CGColor;
    topView.layer.borderWidth = 1.0f;
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(17);
        make.right.mas_equalTo(-17);
        make.bottom.equalTo(centerView.mas_top).offset(-12);
        make.height.mas_equalTo(105);
    }];
    
    
    
    UILabel * titleLab = [[UILabel alloc] init];
    titleLab.text = @"Instructions";
    titleLab.font = [UIFont boldSystemFontOfSize:14];
    titleLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(23);
    }];
    
    

    UILabel * oneLab = [[UILabel alloc] init];
    oneLab.text = @"01";
    oneLab.font = [UIFont boldSystemFontOfSize:16];
    oneLab.textColor = [UIColor colorWithRed:178.0f/255.0f green:177.0f/255.0f blue:178.0f/255.0f alpha:1];
    [topView addSubview:oneLab];
    [oneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(19);
    }];
    UILabel * infoLab = [[UILabel alloc] init];
    infoLab.text = @"Long press empty on home screen";
    infoLab.font = [UIFont systemFontOfSize:13];
    [topView addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(75);
        make.right.mas_equalTo(-25);
    }];
    
    
    
    UILabel * twoLab = [[UILabel alloc] init];
    twoLab.text = @"02";
    twoLab.font = [UIFont boldSystemFontOfSize:16];
    twoLab.textColor = [UIColor colorWithRed:178.0f/255.0f green:177.0f/255.0f blue:178.0f/255.0f alpha:1];
    [centerView addSubview:twoLab];
    [twoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(19);
    }];
    UILabel * infoLab2 = [[UILabel alloc] init];
    infoLab2.text = @"Tap the [+] in the upper left corner to set the home widget";
    infoLab2.font = [UIFont systemFontOfSize:13];
    infoLab2.numberOfLines = 2;
    [centerView addSubview:infoLab2];
    [infoLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(75);
        make.right.mas_equalTo(-25);
    }];
    


    UILabel * threeLab = [[UILabel alloc] init];
    threeLab.text = @"03";
    threeLab.font = [UIFont boldSystemFontOfSize:16];
    threeLab.textColor = [UIColor colorWithRed:178.0f/255.0f green:177.0f/255.0f blue:178.0f/255.0f alpha:1];
    [botView addSubview:threeLab];
    [threeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(19);
    }];
    UILabel * infoLab3 = [[UILabel alloc] init];
    infoLab3.text = @"Search for [sofamon] widget and add to home screen";
    infoLab3.font = [UIFont systemFontOfSize:13];
    infoLab3.numberOfLines = 2;
    [botView addSubview:infoLab3];
    [infoLab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(75);
        make.right.mas_equalTo(-25);
    }];
    

}
-(void)okayBtnClick{
    if(self.okayBtnClickBlock){
        self.okayBtnClickBlock();
    }
}
@end
