//
//  TBAlertController.m
//  TBModule
//
//  Created by 王绵杰 on 2016/12/27.
//  Copyright © 2016年 王绵杰. All rights reserved.
//

#import "TBAlertController.h"

@interface TBAlertController ()
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) NSArray *buttons;
@property (nonatomic, strong) NSArray *clicks;
@end

@implementation TBAlertController

+(instancetype)sharedInstance{
    static TBAlertController *alertController;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alertController = [[TBAlertController alloc] init];
    });
    return alertController;
}

- (void)showAlert:(id)cSelf
       alertTitle:(NSString *)title
          message:(NSString *)message
      buttonTitle:(NSString *)buttonTitle
       buttonType:(UIAlertActionStyle)actionStyle Click:(ClickHandler)click {
   
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cAction = [UIAlertAction actionWithTitle:buttonTitle
                                                      style:actionStyle
                                                    handler:^(UIAlertAction * _Nonnull action) {
                                                        if (click) {
                                                            click();
                                                        }
                                                    }];
    [alertController addAction:cAction];
    [cSelf presentViewController:alertController animated:YES completion:nil];
}

- (void)configAlertViewProperty:(NSString *)title message:(NSString *)message buttons:(NSArray *)buttons clicks:(NSArray *)clicks {
    self.title = title;
    self.message = message;
    self.buttons = buttons;
    self.clicks = clicks;
}

- (void)showAlert {
    NSInteger count = [self.buttons count];
    for (int i = 0; i < count; i++) {
        
    }
}

- (void)setAction:(UIAlertAction *)alertAction style:(TBAlertActionType)alertActionType{
    
    switch (alertActionType) {
        case TBAlertActionStyleDefault:{
//            alertAction.style = ;
        }
            break;
            
        default:
            break;
    }
}
@end
