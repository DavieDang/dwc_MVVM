//
//  BaseNetManager.h
//  WCProject
//
//  Created by BingoMacMini on 16/7/11.
//  Copyright © 2016年 BingoMacMini. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MessageUserType) {
    UserTypeStudent = 0,
    UserTypeTeacher = 1,

};

@interface BaseNetManager : NSObject

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete;

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete;



+ (void)post:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure;

+ (void)get:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure;


@end
