//
//  BaseNetManager.m
//  WCProject
//
//  Created by BingoMacMini on 16/7/11.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import "BaseNetManager.h"
#import <AFNetworking/AFNetworking.h>
#import "WCHeader.h"
//#import "NSObject+WCTool.h"


@implementation BaseNetManager

static AFHTTPSessionManager *manager = nil;


+ (AFHTTPSessionManager *)sharedAFManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
                //NSURL *basicUrl = [NSURL URLWithString:httpHeader];
        manager = [AFHTTPSessionManager manager];
        
        manager.securityPolicy.allowInvalidCertificates = YES;
        manager.securityPolicy.validatesDomainName = NO;
        
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
        
//        NSString *urlStr = [NSString stringWithFormat:@"Bearer %@", [LinkUserContext context].auth.accessToken];
//        [manager.requestSerializer setValue:urlStr forHTTPHeaderField:@"Authorization"];
        
    });
    return manager;
}

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    //打印网络请求， DDLog  与  NSLog 功能一样
    NSLog(@"Request Path: %@, Params:%@", path, params);
    return [[self sharedAFManager] GET:path parameters:params success:^void(NSURLSessionDataTask * task, id responseObject) {
        //成功后的处理
        complete(responseObject, nil);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        complete(nil, error);
    }];
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    return [[self sharedAFManager] POST:path parameters:params success:^void(NSURLSessionDataTask * task, id responseObject) {
        complete(responseObject, nil);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
       // [self handleError:error];
        complete(nil, error);
    }];
}


+ (void)post:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
    [[self sharedAFManager] POST:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
            NSLog(@"post");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
            NSLog(@"post");
        }
    }];

}

+ (void)get:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{

    [[self sharedAFManager] GET:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                if (success) {
                    success(responseObject);
                    NSLog(@"get");
                }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                    NSLog(@"get");
                }
    }];
}



@end
