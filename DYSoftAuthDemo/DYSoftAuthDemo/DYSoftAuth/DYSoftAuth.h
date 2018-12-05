//
//  DYSoftAuth.h
//  MZUnifiedIdentifyAuthen
//
//  Created by 慕子 on 2017/9/19.
//  Copyright © 2017年 慕子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - 用户信息

@interface DYSoftUser :NSObject

/**
 用户的登录账号
 */
@property (nonatomic, copy)NSString * account;

/**
 用户的唯一标示ID
 */
@property (nonatomic, copy)NSString * uniqueid;

/**
 用户的email
 */
@property (nonatomic, copy)NSString * email;

/**
 昵称或者用户名
 */
@property (nonatomic, copy)NSString * nickName;

/**
 用户的头像
 */
@property (nonatomic, copy)NSString * headImage;

/**
 用户的access_token
 */
@property (nonatomic, copy)NSString * access_token;

/**
 access_token的过期时间
 */
@property (nonatomic, assign)CGFloat expires_in;

/**
 所有的属性
 */
@property (nonatomic, strong)NSDictionary * extendAttributeDictionary;

@end


#pragma mark - 鼎永科技登录核心类
/**
  鼎永科技登录核心类
 
 @discussion 您需要通过sharedAuth方法，获取单利对象
 */
@interface DYSoftAuth : NSObject


/**
 获取鼎永科技登录的核心类单例

 @return 鼎永科技登录的核心类单例
 */
+ (instancetype)sharedAuth;

#pragma mark - 初始化操作

/**
 初始化操作

 @param authHost 认证中心的地址
 @param scope 授权范围 多个类型空格隔开
 @param clientID app的ID（分配的）
 @param clientSecret appkey(分配的)
 */
- (void)initWithAuthHost:(NSString *)authHost
                   scope:(NSString *)scope
                clientID:(NSString *)clientID
            clientSecret:(NSString *)clientSecret;

/**
 开始登录

 @param block 结果回调
 */
- (void)beginLogin:(void(^)(BOOL success, NSString *localizedDescription, DYSoftUser * user))block;


/**
 退出登录
 */
- (void)logout;

@end


