//
//  ZSCheckBox.h
//  ZSCheckBox
//
//  Created by HePanDai on 14/12/23.
//  Copyright (c) 2014年 heramerom. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZSCheckBoxType) {
    ZSCheckBoxTypeRect,
    ZSCheckBoxTypeCircle,
    ZSCheckBoxTypeUserDefined
};


@interface ZSCheckBox : UIControl
{
    CAShapeLayer *_boxLayer;
    CAShapeLayer *_checkMarkLayer;
    CAShapeLayer *_highightedLayer;
    UIImageView *_checkBoxImageView;
}

@property (nonatomic, assign) BOOL checked;

@property (nonatomic, strong) UIColor *checkMarkColor;  ///< default is green color
@property (nonatomic, strong) UIColor *boxBorderColor;  ///< default is light gray color
@property (nonatomic, strong) UIColor *boxFillColor;    ///< default is clear color
@property (nonatomic, strong) UIColor *highlightedColor;    /// default is ragb(0.5, 0.5, 0.5, 0.5)

@property (nonatomic, assign) CGFloat boxMargin;    ///< the check box margin

@property (nonatomic, assign) ZSCheckBoxType type;  ///< default is ZSCheckBoxTypeRect

/**
 *  you mast both set "checkedImage" and "decheckedImage", it can be work.
 */
@property (nonatomic, strong) UIImage *checkedImage;        ///< the image displayed when checked, default nil
@property (nonatomic, strong) UIImage *decheckedImage;      ///< the image dispalyed when dechecked, default nil
@property (nonatomic, strong) UIImage *highlightedCheckedImage;  ///< the image displayec when highlighted or pressed, default nil

// title
@property (nonatomic, strong) NSString *title;
@property (nonatomic, readonly) UILabel *titleLabel;
@property (nonatomic, assign) CGFloat marginLeft;  ///< the title label left edge margin the check box right edge

- (instancetype)initWithFrame:(CGRect)frame;

@end
