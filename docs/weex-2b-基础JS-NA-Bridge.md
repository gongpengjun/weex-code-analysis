# Weex工作原理

## 二、知识准备 - Native <-> JavaScript Bridge

***0. JSContext下标语法***

JSContext[] Subscript语法 

[JSContext.mm源码](https://github.com/WebKit/webkit/blob/master/Source/JavaScriptCore/API/JSContext.mm) : [JSContext Subscript Support](JSContext_globalObject.png)

```
JSContext[@"nativeLog"] = ^(){};
//等价于
[JSContext globalObject][@"nativeLog"] = ^(){};
```

***1. JS调用OC函数***

1.1 ObjectiveC暴露函数给JavaScript

```
#import <JavaScriptCore/JavaScriptCore.h>

JSContext *jsContext = [[JSContext alloc] init];
// ObjectiveC Inject Block as JS Function
jsContext[@"nativeLog"] = ^() {
    NSMutableString *string = [NSMutableString string];
    [string appendString:@"jsLog: "];
    NSArray *args = [JSContext currentArguments];
    [args enumerateObjectsUsingBlock:^(JSValue *jsVal, NSUInteger idx, BOOL *stop) {
        [string appendFormat:@"%@ ", jsVal ];
    }];
    NSLog(@"%@", string);
};
```

1.2 JavaScript调用ObjectiveC函数

```
nativeLog("Hello from JS")
等价于
global.nativeLog("Hello from JS")
```

***2. OC调用JS函数***

2.1 JavaScript暴露函数给ObjectiveC

```
// JavaScript set global methods
global['callJS'] = (...args) => {
  receiveTasks(...args);
};
```

2.1 ObjectiveC调用JavaScript函数

```
#import <JavaScriptCore/JavaScriptCore.h>

JSContext *jsContext = [[JSContext alloc] init];
[[jsContext globalObject] invokeMethod:@"callJS" withArguments:@[execIns, tasks]];
```

***OC和JS对象传递***

[OC和JS对象关系](oc_js_objects.png)

参考文档：[深入浅出 JavaScriptCore](http://www.cocoachina.com/ios/20170720/19958.html)
