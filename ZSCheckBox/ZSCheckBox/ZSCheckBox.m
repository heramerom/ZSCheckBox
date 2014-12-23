//
//  ZSCheckBox.m
//  ZSCheckBox
//
//  Created by HePanDai on 14/12/23.
//  Copyright (c) 2014年 heramerom. All rights reserved.
//

#import "ZSCheckBox.h"

#define MIN_BORDER(frame) MIN(CGRectGetWidth(frame), CGRectGetHeight(frame))
#define MAX_BORDER(frame) MAX(CGRectGetWidth(frame), CGRectGetHeight(frame))

#define RECT_WIDTH(frame)   CGRectGetWidth(frame)
#define RECT_HEIHGT(frame)  CGRectGetHeight(frame)

@implementation ZSCheckBox

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        _marginLeft = 0;
        _checkMarkColor = [UIColor greenColor];
        _boxBorderColor = [UIColor grayColor];
        _boxFillColor = [UIColor clearColor];
        _highlightedColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
        _type = ZSCheckBoxTypeRect;
        _boxMargin = 0;
        
        [self setup];
        
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setup
{

    if (!_boxLayer) {
        _boxLayer = [CAShapeLayer layer];
        _boxLayer.backgroundColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:_boxLayer];
    }
    if (!_highightedLayer) {
        _highightedLayer = [CAShapeLayer layer];
        _highightedLayer.hidden = YES;
        _highightedLayer.backgroundColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:_highightedLayer];
    }
    if (!_checkMarkLayer) {
        _checkMarkLayer = [CAShapeLayer layer];
        _checkMarkLayer.backgroundColor = [UIColor clearColor].CGColor;
        _checkMarkLayer.fillColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:_checkMarkLayer];
    }
    
    _checkMarkLayer.frame = [self boxFrameWithFrame:self.frame];
    _highightedLayer.frame = [self boxFrameWithFrame:self.frame];
    _boxLayer.frame = [self boxFrameWithFrame:self.frame];
    
    _checkMarkLayer.path = [self checkMarkPathWithFrame:self.frame].CGPath;
    _checkMarkLayer.lineWidth = [self checkMarkWidthWithFrame:self.frame];
    _checkMarkLayer.strokeColor = self.checkMarkColor.CGColor;
    
    if (_type == ZSCheckBoxTypeRect) {
        _boxLayer.path = [self boxBorderPathWithFrame:self.frame].CGPath;
        _highightedLayer.path = [self boxBorderPathWithFrame:self.frame].CGPath;
    } else if (_type == ZSCheckBoxTypeCircle) {
        _boxLayer.path = [self boxCirclePathWithFrame:self.frame].CGPath;
        _highightedLayer.path = [self boxCirclePathWithFrame:self.frame].CGPath;
    }
    
    _boxLayer.fillColor = self.boxFillColor.CGColor;
    _boxLayer.strokeColor = self.boxBorderColor.CGColor;
    _boxLayer.lineWidth = [self boxBorderWidthWithFrame:self.frame];
    
    if (_checked) {
        _checkMarkLayer.hidden = NO;
    }
    else {
        _checkMarkLayer.hidden = YES;
    }
    
    _highightedLayer.lineWidth = [self boxBorderWidthWithFrame:self.frame];
    _highightedLayer.fillColor = self.highlightedColor.CGColor;
}


- (CGRect)boxFrameWithFrame:(CGRect)frame
{
    return CGRectMake(0, 0, MIN_BORDER(frame), MIN_BORDER(frame));
}

- (CGRect)boxPathFrameWithFrame:(CGRect)frame
{
    return CGRectMake(_boxMargin, _boxMargin, MIN_BORDER(frame)-2*_boxMargin, MIN_BORDER(frame)-2*_boxMargin);
}

- (CGFloat)boxBorderWidthWithFrame:(CGRect)frame
{
    return MIN_BORDER(frame)-2*_boxMargin<50?2:3;
}

- (CGFloat)boxBorderCornerRadiusWithFrame:(CGRect)frame
{
    return (MIN_BORDER(frame)-2*_boxMargin)/10>2?MIN_BORDER(frame)/10+2:4;
}

- (CGRect)titleLabelFrameWithFrame:(CGRect)frame
{
    return CGRectMake(MIN_BORDER(frame) + _marginLeft, 0, CGRectGetWidth(frame) - MIN_BORDER(frame) - _marginLeft, RECT_HEIHGT(frame));
}

- (UIBezierPath *)boxPathWithFrame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius;
{
    CGFloat borderWidth = [self boxBorderWidthWithFrame:frame];
    CGRect rectPath = CGRectMake(borderWidth/2+_boxMargin, borderWidth/2+_boxMargin, MIN_BORDER(frame)-borderWidth-2*_boxMargin, MIN_BORDER(frame)-borderWidth-2*_boxMargin);
    return [UIBezierPath bezierPathWithRoundedRect:rectPath cornerRadius:cornerRadius];
}

- (UIBezierPath *)boxBorderPathWithFrame:(CGRect)frame
{
    return [self boxPathWithFrame:frame cornerRadius:[self boxBorderCornerRadiusWithFrame:frame]];
}

- (UIBezierPath *)boxCirclePathWithFrame:(CGRect)frame
{
    return [self boxPathWithFrame:frame cornerRadius:(RECT_WIDTH([self boxFrameWithFrame:frame])-[self boxBorderWidthWithFrame:frame]-_boxMargin)/2];
}

- (UIBezierPath *)checkMarkPathWithFrame:(CGRect)frame
{
    UIBezierPath *checkMarkPath = [[UIBezierPath alloc] init];
    [checkMarkPath moveToPoint:CGPointMake(_boxMargin+(MIN_BORDER(frame)-2*_boxMargin)*0.25, _boxMargin+(MIN_BORDER(frame)-2*_boxMargin)*0.5)];
    [checkMarkPath addLineToPoint:CGPointMake(_boxMargin+(MIN_BORDER(frame)-2*_boxMargin)*0.454, _boxMargin+(MIN_BORDER(frame)-2*_boxMargin)*0.70)];
    [checkMarkPath addLineToPoint:CGPointMake(_boxMargin+(MIN_BORDER(frame)-2*_boxMargin)*0.787, _boxMargin+(MIN_BORDER(frame)-2*_boxMargin)*0.227)];
    return checkMarkPath;
}

- (CGFloat)checkMarkWidthWithFrame:(CGRect)frame
{
    return MIN_BORDER(frame)-2*_boxMargin>50?6:3;
}

- (CGRect)checkBoxImageFrameWithFrame:(CGRect)frame
{
    return CGRectMake(_boxMargin, _boxMargin, MIN_BORDER(frame) - 2*_boxMargin, MIN_BORDER(frame) - 2*_boxMargin);
}

#pragma mark - set properties

- (void)setCheckMarkColor:(UIColor *)checkMarkColor
{
    _checkMarkColor = checkMarkColor;
    _checkMarkLayer.strokeColor = _checkMarkColor.CGColor;
}

- (void)setBoxBorderColor:(UIColor *)boxBorderColor
{
    _boxBorderColor = boxBorderColor;
    _boxLayer.strokeColor = _boxBorderColor.CGColor;
}

- (void)setBoxFillColor:(UIColor *)boxFillColor
{
    _boxFillColor = boxFillColor;
    _boxLayer.fillColor = _boxFillColor.CGColor;
}

- (void)setType:(ZSCheckBoxType)type
{
    _type = type;
    [self setNeedsLayout];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:[self titleLabelFrameWithFrame:self.frame]];
        _titleLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_titleLabel];
    }
    self.titleLabel.text = title;
}


- (void)setCheckedImage:(UIImage *)checkedImage
{
    _checkedImage = checkedImage;
    [self setNeedsLayout];
}

- (void)setDecheckedImage:(UIImage *)decheckedImage
{
    _decheckedImage = decheckedImage;
    [self setNeedsLayout];
}

- (void)setHighlightedCheckedImage:(UIImage *)highlightedImage
{
    _highlightedCheckedImage = highlightedImage;
    [self setNeedsLayout];
}

- (void)setMarginLeft:(CGFloat)paddingLeft
{
    _marginLeft = paddingLeft;
    [self setNeedsLayout];
}

- (void)setChecked:(BOOL)checked
{
    _checked = checked;
    [self setNeedsLayout];
}

#pragma mark - layout subveiws
- (void)layoutSubviews
{
    [super layoutSubviews];
    if (_checkedImage && _decheckedImage) {
        if (!_checkBoxImageView) {
            _checkBoxImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            [self addSubview:_checkBoxImageView];
        }
        if (_checked) {
            _checkBoxImageView.image = self.checkedImage;
        }
        else {
            _checkBoxImageView.image = self.decheckedImage;
        }
        
        _checkBoxImageView.frame = [self checkBoxImageFrameWithFrame:self.frame];
        if (_boxLayer) {
            [_boxLayer removeFromSuperlayer];
            _boxLayer = nil;
        }
        if (_checkMarkLayer) {
            [_checkMarkLayer removeFromSuperlayer];
            _checkMarkLayer = nil;
        }
        if (_highightedLayer) {
            [_highightedLayer removeFromSuperlayer];
            _highightedLayer = nil;
        }
    }
    else {
        [self setup];
    }
    if (_titleLabel) {
        _titleLabel.frame = [self titleLabelFrameWithFrame:self.frame];
    }
}

#pragma mark - touch events

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (CGRectContainsPoint([self boxFrameWithFrame:self.frame], [touch locationInView:self])) {
        [self highLighted];
        return YES;
    }
    return YES;
}
- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (CGRectContainsPoint([self boxFrameWithFrame:self.frame], [touch locationInView:self])) {
        return YES;
    }
    else {
        [self normal];
        return NO;
    }
}
- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (CGRectContainsPoint([self boxFrameWithFrame:self.frame], [touch locationInView:self])) {
        _checked = !_checked;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
    [self normal];
}
- (void)cancelTrackingWithEvent:(UIEvent *)event
{
    NSLog(@"cancelTrackingWithEvent");
    [self normal];
}


- (void)highLighted
{
    if (_checkedImage && _decheckedImage) {
        _checkBoxImageView.image = _highlightedCheckedImage?_highlightedCheckedImage:_decheckedImage;
    }
    else {
        _highightedLayer.hidden = NO;
    }
}

- (void)normal
{
    if (_checked) {
        if (_checkedImage && _decheckedImage) {
            _checkBoxImageView.image = _checkedImage;
        }
        else {
            _highightedLayer.hidden = YES;
            _checkMarkLayer.hidden = NO;
        }
    }
    else {
        if (_checkedImage && _decheckedImage) {
            _checkBoxImageView.image = _decheckedImage;
        }
        else {
            _highightedLayer.hidden = YES;
            _checkMarkLayer.hidden = YES;
        }
    }
}

@end
