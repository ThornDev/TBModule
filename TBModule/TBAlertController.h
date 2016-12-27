//
//  TBAlertController.h
//  TBModule
//
//  Created by 王绵杰 on 2016/12/27.
//  Copyright © 2016年 王绵杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^ClickHandler) (void);


@interface TBAlertController : NSObject
// single request
+(instancetype)sharedInstance;

//-----------------Show AlertView with title and message-----------------
- (void)showAlert:(id)cSelf
       alertTitle:(NSString *)title
          message:(NSString *)message
      buttonTitle:(NSString *)buttonTitle
       buttonType:(UIAlertActionStyle)actionStyle Click:(ClickHandler)click;
@end
