# 使用官方Node.js 20的Alpine基础镜像
FROM node:20-alpine

# 设置工作目录
WORKDIR /opt/mcsmanager

# 安装必要的依赖
RUN apk add --no-cache \
    screen \
    wget \
    bash \
    openjdk17-jre  # 安装OpenJDK 17 JRE

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

# 暴露多个端口供外部访问
EXPOSE 23333
EXPOSE 24444
EXPOSE 25565
EXPOSE 19132

# 设置环境变量，指定Java路径
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk \
    PATH=$PATH:/usr/lib/jvm/java-17-openjdk/bin

# 执行启动脚本
CMD ["./start.sh"]
