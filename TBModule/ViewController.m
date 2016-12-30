//
//  ViewController.m
//  TBModule
//
//  Created by 王绵杰 on 2016/12/19.
//  Copyright © 2016年 王绵杰. All rights reserved.
//

#import "ViewController.h"
#import "TBAlertController.h"
@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Life Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlertAction:(UIButton *)sender {
    [[TBAlertController sharedInstance] showAlert:self
                                       alertTitle:@"提示"
                                          message:@"警示信息，信息！"
                                      buttonTitle:@"知道了"
                                       buttonType:UIAlertActionStyleDefault Click:^{
                                           NSLog(@"Click");
                                       }];
}

@end
