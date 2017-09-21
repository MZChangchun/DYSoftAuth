# DYSoftAuth

#杭州鼎永科技有限公司统一身份认证 iOS SDK

## <a id="Installation"></a> Installation【安装】

### Manually【手动导入】

- Drag all source files under floder `DYSoftAuth` to your project.【将`DYSoftAuth`文件夹中的所有代码拽入项目中】
- Import the main header file：`#import "DYSoftAuth.h"`【导入主头文件：`#import "DYSoftAuth.h"`】
- 在项目的`Linked Frameworks and Libraries`下`Add Other`添加  `DYSoftAuth.a`
- 在info.plist 中添加
```
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key>
<true/>
</dict>
```


# <a id="Examples"></a> Examples【示例】

1.在`AppDelegate.m`中导入头文件`#import "DYSoftAuth.h"`

2.在`didFinishLaunchingWithOptions`方法中初始化
```
/**
 初始化操作

 @param authHost 认证中心的地址
 @param authWebUrl 开放平台的地址
 @param fileHost 文件中心的地址
 @param scope 授权范围 多个类型空格隔开
 @param clientID app的ID（分配的）
 @param clientSecret appkey(分配的)
 */
[[DYSoftAuth sharedAuth] initWithAuthHost:@"http://AuthHost" //认证中心的地址
                                   authWebUrl:@"http://WebUrl" //开放平台的地址
                                     fileHost:@"http://Host1" //文件中心的地址
                                        scope:@"openid profile" //授权范围 多个类型空格隔开
                                     clientID:@"clientID" //app的ID（分配的）
                                 clientSecret:@"clientSecret"]; //appkey(分配的)
```

3.在需要使用登录的地方导入头文件`#import "DYSoftAuth.h"`
然后调用登录方法
```
[[DYSoftAuth sharedAuth] beginLogin:^(BOOL success, NSString *localizedDescription, DYSoftUser *user) {
        if (success) {
            NSLog(@"%@", user);
        } else {
            NSLog(@"%@", localizedDescription);
        }
    }];
```

#注意 回调函数改变UI请在主线程中执行. block请注意避免循环引用
