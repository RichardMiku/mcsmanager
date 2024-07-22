# 使用官方Node.js 20的Alpine基础镜像
FROM node:20-alpine

# 设置工作目录
WORKDIR /opt/mcsmanager

# 安装必要的依赖
RUN apk add --no-cache \
    screen \
    wget \
    bash

# 更新npm和安装pm2
RUN npm install -g npm@latest pm2

# 下载MCSManager最新版本
RUN wget https://github.com/MCSManager/MCSManager/releases/latest/download/mcsmanager_linux_release.tar.gz

# 解压MCSManager到当前目录
RUN tar -zxf mcsmanager_linux_release.tar.gz

# 清理下载的压缩包
RUN rm mcsmanager_linux_release.tar.gz

# 从Dockerfile所在目录导入启动脚本start.sh
COPY start.sh /opt/mcsmanager/start.sh

# 赋予启动脚本执行权限
RUN chmod +x /opt/mcsmanager/start.sh

# 暴露端口23333供外部访问
EXPOSE 23333

# 执行启动脚本
CMD ["./start.sh"]
