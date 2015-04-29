//
//  BAHCoordinationLockerViewController.h
//  Pods
//
//  Created by BHughes on 4/18/15.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CoreGraphics.h>

@interface BAHCoordinationLockerViewController : UIViewController<UIGestureRecognizerDelegate>

@property (nonatomic, strong)UIImageView *backGroundImageView;

@property (nonatomic, strong)UIView *frostedView;

@property (nonatomic, strong)UIView *topTapView;

@property (nonatomic, strong)UIView *bottomTapView;

@property float tapViewSize;

@property (nonatomic, strong) UIColor *backgroundColor;

@property (nonatomic, strong)UIImage *backGroundImage;

@property (nonatomic, strong)UIColor *frostedViewBackGroundColor;

@property (nonatomic, strong)UIColor *topTapViewTintColor;

@property (nonatomic)CGColorRef topTapViewBorderTintColor;

@property (nonatomic)CGColorRef bottomTapViewBorderTintColor;

@property (nonatomic, strong)UIColor *bottomTapViewTintColor;

@property (nonatomic, strong)NSString *successLabelText;

@property (nonatomic, strong)UIFont *successLabelFont;

@property (nonatomic, strong)UIColor *successLabelTextColor;

@property (nonatomic)float tollerance;

@property (nonatomic, strong)NSNumber *activateHour;

@property (nonatomic, strong)NSNumber *deActivateHour;

+ (void)setActivateHour:(NSNumber *)activateHour;

+ (void)setDeActivateHour:(NSNumber *)deActivateHour;

- (void)setBackgroundColor:(UIColor *)backgroundColor;

- (void)checkSettingsForCoordinationLockerOnView:(UIViewController*)viewController;

- (void)setSuccessLabelText:(NSString *)successLabelText;

- (void)setSuccessLabelFont:(UIFont *)successLabelFont;

- (void)setSuccessLabelTextColor:(UIColor *)successLabelTextColor;

- (void)setTopTapViewTintColor:(UIColor *)topTapViewTintColor;

- (void)setTopTapViewBorderTintColor:(CGColorRef)topTapViewBorderTintColor;

- (void)setBottomTapViewTintColor:(UIColor *)bottomTapViewTintColor;

- (void)setBottomTapViewBorderTintColor:(CGColorRef)bottomTapViewBorderTintColor;

- (void)setBackGroundImage:(UIImage *)backGroundImage;

- (void)setFrostedViewBackGroundColor:(UIColor *)frostedViewBackGroundColor;

- (void)setTapViewSize:(float)tapViewSize;

- (void)lockView:(UIViewController*)viewController animated:(BOOL)flag;

- (void)lockView:(UIViewController*)view;

- (void)setTollerance:(float)tollerance;

@end
