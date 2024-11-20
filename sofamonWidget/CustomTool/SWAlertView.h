//
//  SWAlertView.h
//  sofamon Widget
//
//  Created by 任晓磊 on 2024/11/19.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

NS_ASSUME_NONNULL_BEGIN

@interface SWAlertView : UIView
@property (nonatomic,copy) void(^okayBtnClickBlock)(void);
@end

NS_ASSUME_NONNULL_END
