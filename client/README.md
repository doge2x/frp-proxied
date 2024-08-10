# Client 端配置

本目录下包含在 Client 端, 即需要访问 Remote 的机器, 上部署的配置.

示例中包含了两种工作模式,

1. FRP 模式, 默认模式, 代理流量需要通过 FRP 进行传输, 本模式下可以利用到 FRP 的一些高级特性:
   - [STCP](https://gofrp.org/zh-cn/docs/features/stcp-sudp/): 提供更安全的数据传输, 可以防止数据被泄露给 Server 端
   - [XTCP](https://gofrp.org/zh-cn/docs/features/xtcp/): 提供 P2P 数据传输, 如果成功建立连接, 可以避免绕路 Server 端, 从而有效提高传输效率
2. Direct 模式, 代理流量直接发送到 Sever 端, 任何兼容所配置代理协议的客户端 (V2RayA/V2RayN/Hiddify/...) 均可连接, 使用时请根据 [sing-box-direct/config.json](sing-box-direct/config.json) 进行适配.
