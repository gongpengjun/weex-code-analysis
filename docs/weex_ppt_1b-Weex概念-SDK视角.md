# Weex工作原理

### 1、Weex总体结构

![](weex_app_architecture.png)

### 2、 常见概念简介

- Weex源文件: .we 或 .vue文件
- JS Bundle: 由weex源文件经过transformer([webpack](https://webpack.github.io/))转化生成的.js文件
- Weex SDK: JS Framework + (JS Engine) + Native Render Engine
	* Native Render Engine: 基于iOS/Android原生代码(ObjectiveC/Java)编写的绘制引擎
	* JS Framework: 基于Vue 2.0开发的，native-bundle-main.js 简称 main.js就是JS Framework
- JS Engine: 解析运行JavaScript代码的引擎，iOS是JavaScriptCore.framework (JSContext)
