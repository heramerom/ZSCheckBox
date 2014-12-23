//
//  ViewController.m
//  ZSCheckBox
//
//  Created by HePanDai on 14/12/23.
//  Copyright (c) 2014年 heramerom. All rights reserved.
//

#import "ViewController.h"
#import "ZSCheckBox.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZSCheckBox *checkBox1 = [[ZSCheckBox alloc] initWithFrame:CGRectMake(30, 40, 30, 30)];
    checkBox1.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:checkBox1];
    
    ZSCheckBox *checkBox2 = [[ZSCheckBox alloc] initWithFrame:CGRectMake(30, 80, 320-30-30, 50)];
    checkBox2.title = @"a check box with marginLeft";
    checkBox2.marginLeft = 10.0f;
    checkBox2.titleLabel.numberOfLines = 2;
    checkBox2.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:checkBox2];
    
    ZSCheckBox *checkBox3 = [[ZSCheckBox alloc] initWithFrame:CGRectMake(30, 140, 320-60, 50)];
    checkBox3.title = @"a check box with boxMargin";
    checkBox3.boxMargin = 10.0;
    checkBox3.titleLabel.numberOfLines = 2;
    checkBox3.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:checkBox3];
    
    ZSCheckBox *checkBox4 = [[ZSCheckBox alloc] initWithFrame:CGRectMake(30, 140+50+10, 320-60, 50)];
    checkBox4.title = @"a check box with ZSCheckBoxTypeCircle";
    checkBox4.boxMargin = 10.0;
    checkBox4.titleLabel.numberOfLines = 2;
    checkBox4.type = ZSCheckBoxTypeCircle;
    checkBox4.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:checkBox4];
    
    
    ZSCheckBox *checkBox5 = [[ZSCheckBox alloc] initWithFrame:CGRectMake(30, 140+50+10+50+10, 320-60, 50)];
    checkBox5.title = @"a check box with checkedImage and decheckedImage";
    checkBox5.titleLabel.numberOfLines = 2;
    checkBox5.boxMargin = 10.0f;
    checkBox5.checkedImage = [UIImage imageNamed:@"cb_green_on"];
    checkBox5.decheckedImage = [UIImage imageNamed:@"cb_green_off"];
    checkBox5.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:checkBox5];
    
    
    ZSCheckBox *checkBox6 = [[ZSCheckBox alloc] initWithFrame:CGRectMake(30, 140+50+10+50+10+50+10, 320-60, 50)];
    checkBox6.title = @"touch events test";
    checkBox6.titleLabel.numberOfLines = 2;
    checkBox6.boxMargin = 10.0;
    checkBox6.backgroundColor = [UIColor yellowColor];
    [checkBox6 addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:checkBox6];
    
    ZSCheckBox *checkBox7 = [[ZSCheckBox alloc] initWithFrame:CGRectMake(30, 140+50+10+50+10+50+10+50+10, 320-60, 50)];
    checkBox7.title = @"color user defined";
    checkBox7.titleLabel.numberOfLines = 2;
    checkBox7.boxMargin = 10.0;
    checkBox7.boxFillColor = [UIColor greenColor];
    checkBox7.checkMarkColor = [UIColor whiteColor];
    checkBox7.boxBorderColor = [UIColor greenColor];
    checkBox7.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:checkBox7];
    
    ZSCheckBox *checkBox8 = [[ZSCheckBox alloc] initWithFrame:CGRectMake(30, 140+50+10+50+10+50+10+50+10+50+10, 320-60, 50)];
    checkBox8.title = @"color user defined";
    checkBox8.titleLabel.numberOfLines = 2;
    checkBox8.boxMargin = 10.0;
    checkBox8.checkMarkColor = [UIColor redColor];
    checkBox8.boxBorderColor = [UIColor purpleColor];
    checkBox8.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:checkBox8];
    
}

- (void)valueChanged:(ZSCheckBox*)checkBox
{
    if (checkBox.checked) {
        NSLog(@"on");
    }
    else {
        NSLog(@"off");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
