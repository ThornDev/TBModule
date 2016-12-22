//
//  TBMediator.h
//  TBModule
//
//  Created by 王绵杰 on 2016/12/22.
//  Copyright © 2016年 王绵杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBMediator : NSObject
+(instancetype)sharedInstance;

/**
 *  URL 访问式请求处理
 *
 *  @param  url 请求地址
 *  @param  completion 请求结果回调
 */
- (id)performActionWithUrl:(NSURL *)url completion:(void(^)(NSDictionary *info))completion;


/**
 *  本地 访问式请求处理
 *
 *  @param  targetName 请求目标
 *  @param  actionName 请求执行动作
 *  @param  params 请求参数
 */
- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params;
@end
