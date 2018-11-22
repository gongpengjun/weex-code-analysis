# Weex工作原理

## 零、Weex关键问题

- Weex App的组成架构？模块、内存、线程(done)
- Weex App是怎么运行起来的？(done)
- Weex App的界面是怎么生成的？(vDOM API)
- Weex App的界面是怎么布局的？(UI线程) 
- Weex App的交互事件是怎么处理的？(fireEvent)
- Weex App的界面是怎么刷新的？(vDOM API)
- Weex Component的注册和使用？起什么作用？(done)
- Weex Module的注册和使用？(done)
- Weex App的性能瓶颈在哪里？

## 零、Weex关键议题

- Weex架构
	* 代码组成和路径
	* 模块
	* 内存
	* 线程
- Bridge
	* JS调用Native (callNative)
		* Native提供给JS的Bridge接口列表
		* 调用时序图
		* 调用相关数据结构
		* 同步异步，返回值处理
	* Native调用JS (callJS)
		* JS提供给Native的Bridge接口列表
		* 调用时序图
		* 调用相关数据结构
		* 同步异步，返回值处理

- JS Framework
	* 初始化
	* 解析执行JS bundle
		* 初始化页面
		* 加载JS Bundle中自定义组件
		* 加载JS Bundle中自定义模块
	* JS Runtime和具体framework交互
	* 界面绘制和刷新
	* 数据绑定
	* 事件绑定
	* Native绘制 调用时序图 + 传递数据结构
- Native代码逻辑分析 (布局和刷新时序图)
	* 初始化NA代码
	* 初始化JS Framework代码 (JS Runtime + 各Framework)
	* 下载JS Bundle
	* 界面绘制和布局
	* 界面刷新
	* 事件响应 调用时序图 + 传递数据结构
