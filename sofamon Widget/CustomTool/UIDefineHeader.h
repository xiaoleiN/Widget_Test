//
//  UIDefineHeader.h
//  Aclass
//
//  Created by BoNet on 1/21/21.
//

#ifndef UIDefineHeader_h
#define UIDefineHeader_h

//屏幕尺寸
#define kSCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define kSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//是否为iPhone X系列

//iPhone4/4s    320x480
#define kIsIphone4 (kSCREEN_WIDTH == 320.f && kSCREEN_HEIGHT == 480.f)
//iPhone5/5c/5s/SE  320x568
#define kIsIphone5 (kSCREEN_WIDTH == 320.f && kSCREEN_HEIGHT == 568.f)
//iPhone6/6s/7/8    375x667
#define kIsIphone6 (kSCREEN_WIDTH == 375.f && kSCREEN_HEIGHT == 667.f)
//iPhone6/6s/7/8 Plus   414x736
#define kIsIphone6Plus (kSCREEN_WIDTH == 414.f && kSCREEN_HEIGHT == 736.f)
//iPhoneX/iPhoneXS/11Pro    375x812（安全区域: (44, 0, 0, 34)）
#define kIsIphoneX (kSCREEN_WIDTH == 375.f && kSCREEN_HEIGHT == 812.f)
//iPhoneXR/11   414x896（安全区域: (48, 0, 0, 34)）
#define kIsIphoneXR (kSCREEN_WIDTH == 414.f && kSCREEN_HEIGHT == 896.f)
//iPhoneXSMax/11ProMax  414x896（安全区域: (47, 0, 0, 34)）
#define kIsIphoneXSMAX (kSCREEN_WIDTH == 414.f && kSCREEN_HEIGHT == 896.f)
//iPhone12mini iPhone13mini 360x780（安全区域: (47, 0, 0, 34)）
#define kIsIphone12mini (kSCREEN_WIDTH == 360.f && kSCREEN_HEIGHT == 780.f)
//iPhone12/12Pro iPhone13/13Pro iPhone14    390x844（安全区域: (47, 0, 0, 34)）
#define kIsIphone12 (kSCREEN_WIDTH == 390.f && kSCREEN_HEIGHT == 844.f)
//iPhone12/13ProMax iPhone14 Plus 428x926（安全区域: (47, 0, 0, 34)）
#define kIsIphone12ProMax (kSCREEN_WIDTH == 428.f && kSCREEN_HEIGHT == 926.f)
//iPhone14 Pro iPhone 15 iPhone 15 Pro 393x852（安全区域: (59, 0, 0, 34)） 适配灵动岛高度 54的状态栏高度 59的安全区域高度
#define kIsIphone14Pro (kSCREEN_WIDTH == 393.f && kSCREEN_HEIGHT == 852.f)
//iPhone14 Pro Max iPhone 15 Plus iPhone 15 Pro Max   430x932（安全区域: (59, 0, 0, 34)） 适配灵动岛高度 54的状态栏高度    59的安全区域高度
#define kIsIphone14ProMax (kSCREEN_WIDTH == 430.f && kSCREEN_HEIGHT == 932.f)
//iphone16 pro  //874 402
#define kIsIphone16Pro (kSCREEN_WIDTH == 402.f && kSCREEN_HEIGHT == 874.f)
//iphone16promax //956 440
#define kIsIphone16ProMax (kSCREEN_WIDTH == 440.f && kSCREEN_HEIGHT == 956.f)

#define  is_X_Seris (kIsIphoneX || kIsIphoneXR || kIsIphoneXSMAX || kIsIphone12mini || kIsIphone12 || kIsIphone12ProMax || kIsIphone14Pro || kIsIphone14ProMax || kIsIphone16Pro || kIsIphone16ProMax)

#define KTopSafeHeight (kIsIphoneX?44:(kIsIphoneXR?48:((kIsIphoneXSMAX || kIsIphone12mini || kIsIphone12 || kIsIphone12ProMax)?47:((kIsIphone14Pro || kIsIphone14ProMax || kIsIphone16Pro || kIsIphone16ProMax)?59:20))))

#define kBottomSafeHeight (is_X_Seris?34:0)


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
// 适配iPhone X Tabbar高度
#define MPTabbarHeight (MPIPhoneX ? (56.f + 34.f) : 56.f)

/** 以iphone6为基准适配 */
#define MPWidthRatio  (SCREEN_WIDTH / 375.0)
#define MPHeightRatio (SCREEN_HEIGHT / 667.0)

#define MPAdaptedWidth(x)  (ceilf((x) * MPWidthRatio))
#define MPAdaptedHeight(x) (ceilf((x) * MPHeightRatio))

#define ZTAdaptedSize(w,h) CGSizeMake(MPAdaptedWidth(w),MPAdaptedHeight(h))

/*********************************start************************************/
#pragma mark - Quick Init

#define ZTQuickInitTableView(__quickTableView, UITableViewStyle) \
    __quickTableView = ({ \
        UITableView *__quickInit = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyle]; \
        if (@available(iOS 11.0, *)) { \
            __quickInit.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever; \
        } \
        __quickInit.showsVerticalScrollIndicator = NO;\
        __quickInit.showsHorizontalScrollIndicator = NO;\
        __quickInit.separatorStyle = UITableViewCellSeparatorStyleNone; \
        __quickInit.backgroundColor = [UIColor clearColor]; \
        __quickInit.estimatedRowHeight = 100.0f; \
        __quickInit.estimatedSectionFooterHeight = 0.0f; \
        __quickInit.estimatedSectionHeaderHeight = 0.0f; \
        [__quickInit setTableFooterView:[UIView new]]; \
        __quickInit; \
    })
/*********************************end************************************/


#endif /* UIDefineHeader_h */
