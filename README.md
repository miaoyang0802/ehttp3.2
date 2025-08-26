# EHTTP 3.2

EHTTP 是一个基于 Windows HTTP.sys (HTTP Server API) 的高性能 HTTP 服务器 DLL 库。它保持了原有的 DLL API 不变（stdcall + __declspec(dllexport)），核心服务器逻辑由 HTTP.sys 实现以获得最大性能。

## 特性

- **高性能**: 基于 Windows HTTP.sys API，内核级别的 HTTP 处理
- **SIMD 优化**: 使用 SSE2/AVX 指令集优化内存操作
- **GZIP 压缩**: 集成 miniz 库提供 GZIP 压缩支持
- **32位兼容**: 专门为 32位环境优化
- **DLL 接口**: 提供标准的 Windows DLL 接口

## 构建

使用提供的批处理文件构建项目：

```batch
build.bat
```

确保在 x86 Native Tools Command Prompt 环境下运行以获得最佳结果。

## 文件结构

```
├── ehttp.cpp          # 主要实现文件
├── ehttp.def          # DLL 导出定义
├── build.bat          # 构建脚本
└── miniz-3.0.2/       # GZIP 压缩库
    ├── miniz.h
    ├── miniz.c
    └── examples/
```

## API 函数

- `EHTTP_Config` - 配置 HTTP 服务器
- `EHTTP_StartServer` - 启动 HTTP 服务器
- `EHTTP_StopServer` - 停止 HTTP 服务器
- `EHTTP_SetRequestHandlerEx` - 设置请求处理器
- `EHTTP_SetErrorCallback` - 设置错误回调
- `EHTTP_GetStats` - 获取统计信息
- `EHTTP_SetHeader` - 设置 HTTP 头
- `EHTTP_Send` - 发送 HTTP 响应
- `EHTTP_SendFast` - 快速发送响应

## 系统要求

- Windows Vista 或更高版本
- Visual Studio Build Tools 或 Visual Studio
- x86 架构支持

## 许可证

本项目使用 MIT 许可证。miniz 库遵循其自身的许可证条款。