# shell_script

> 本仓库只作自己使用, 未过多考虑环境信息, 暂只支持 Ubuntu , Vultr、Google Cloud、AlibabCloud (国际版) 主机 Ubuntu 16 测试通过

### 使用方式：

简单安装
```
curl "https://raw.githubusercontent.com/junbaor/shell_script/master/shadowsocks.sh" | /bin/sh
```

支持 chacha20
```
curl "https://raw.githubusercontent.com/junbaor/shell_script/master/shadowsocks-chacha20.sh" | /bin/sh
```

更换 v4.12.6 内核开启 BBR
```
curl "https://raw.githubusercontent.com/junbaor/shell_script/master/kernel_bbr.sh" | /bin/sh
```

编译安装 nginx (使用最新版openssl zlib pcre 开启 http_ssl_module http_v2_module)
```
curl "https://raw.githubusercontent.com/junbaor/shell_script/master/nginx.sh" | /bin/sh
```

单机安装 redis-cluster
```
curl "https://raw.githubusercontent.com/junbaor/shell_script/master/redis-cluster.sh" | /bin/sh
```
