//
//  TBMediator.m
//  TBModule
//
//  Created by 王绵杰 on 2016/12/22.
//  Copyright © 2016年 王绵杰. All rights reserved.
//

#import "TBMediator.h"

@implementation TBMediator
+ (instancetype)sharedInstance {
    static TBMediator *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[TBMediator alloc] init];
    });
    return mediator;
}

/*
 URL的一般格式为：
 scheme://host:port/path?query
 
 scheme://[target]/[action]?[params]
 
 */

/**
 *  URL 访问式请求处理
 *
 *  @param  url 请求地址
 *  @param  completion 请求结果回调
 */

- (id)performActionWithUrl:(NSURL *)url completion:(void (^)(NSDictionary *))completion {
    if (![url.scheme isEqualToString:@"kkbcScheme"]) {
        return @(NO);
    }
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSString *urlString = [url query];
    
    for (NSString *param in [urlString componentsSeparatedByString:@"&"]) {
        NSArray *elts = [param componentsSeparatedByString:@"="];
        if ([elts count] < 2)
            continue;
        [params setObject:[elts lastObject] forKey:[elts firstObject]];
    }
    
    NSString *actionName = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    id result = [self performTarget:url.host action:actionName params:params];
    if (completion) {
        if (result) {
            completion(@{@"result" : result});
        } else {
            completion(nil);
        }
    }
    return result;
}

/**
 *  本地 访问式请求处理
 *
 *  @param  targetName 请求目标
 *  @param  actionName 请求执行动作
 *  @param  params 请求参数
 */

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params {
    NSString *targetClassString = [NSString stringWithFormat:@"Target_%@",targetName];
    NSString *actionString = [NSString stringWithFormat:@"action_%@:",actionName];
    
    Class targetClass = NSClassFromString(targetClassString);
    id target = [[targetClass alloc] init];
    SEL action = NSSelectorFromString(actionString);
    
   
    if (target == nil) {
        return nil;
    }
    
    if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [target performSelector:action withObject:params];
    }else{
        // 这里处理无响应请求的地方，如果无反应，则尝试调用对应target的notFound方法统一处理
        SEL action = NSSelectorFromString(@"notFound");
        if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
        }else{
            // 处理无响应请求
            return nil;
        }
    }
}

@end
