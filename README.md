# 哪吒监控 Zeabur 反向代理

此仓库包含用于在 Zeabur 平台上为哪吒监控部署反向代理的自定义 Nginx 配置。

## 核心组件
1. **Dockerfile**: 构建包含 `ngx_http_grpc_module` 的 Nginx 镜像。
2. **nginx.conf**: 代理所有流量（HTTP、WebSocket、gRPC）。

## 部署到 Zeabur
1. 在 Zeabur 控制台创建新服务或重新配置现有服务。
2. 选择“从 Git 仓库部署”，连接此仓库。
3. Zeabur 将自动使用本仓库的 `Dockerfile` 进行构建。
