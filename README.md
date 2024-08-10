# frp proxied

使用 [frp](https://github.com/fatedier/frp) + [sing-box](https://github.com/SagerNet/sing-box) 实现内网穿透.

## 特性

- **安全**: 客户端和远程端均通过加密协议传输
- **通用**: 客户端只需要兼容任一种协议 (SSR/Hysteria/Reality/...) 即可使用
- **方便**: 服务端和远程端均通过 [Docker Compose](https://docs.docker.com/compose) 进行部署

## 部署

> [!IMPORTANT]
>
> 为便于演示, 代理采用了 VLESS + WebSocket, 实际部署时请根据需要更换, 其它配置可参考 <https://github.com/chika0801/sing-box-examples> 等.

_开始前请确保已正确安装配置 [Docker Compose](https://docs.docker.com/compose/install/)_

```bash
# 0) 克隆本项目
git clone https://github.com/doge2x/frp-proxied.git frp-proxied && cd frp-proxied
# 1) 配置变量
SERVER_ADDR="your.server.com" ./scripts/interpolate.sh
# 2) 根据 server/remote/client 开启不同的服务, 以 server 端为例
cd server && docker-compose up
```

正式部署前, 也可以在本地尝试部署:

```bash
# 1) 把服务器地址配置为 host,
SERVER_ADDR="host.docker.internal" ./scripts/interpolate.sh
#    如果使用 Podman 的话
SERVER_ADDR="host.containers.internal" ./scripts/interpolate.sh
# 2) 依次启动 server, remote, client 服务
cd server && docker-compose up
#    ...
# 3) 开启 DEBUG 日志
./scripts/debug.sh
# 4) 通过 curl 测试代理
curl --proxy socks5h://127.0.0.1:1080 https://www.baidu.com/
```

## 许可

根据 Unlicense ([UNLICENSE](UNLICENSE) or <https://unlicense.org/>) 许可发布.
