# 使用官方CentOS基础镜像
FROM centos:centos7

# 设置工作目录
WORKDIR /opt/mcsmanager

# 更换为阿里云镜像源
# RUN curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo

# 更换为清华大学开源软件镜像站的镜像源
RUN curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.tuna.tsinghua.edu.cn/centos/7/os/x86_64/

# 更新yum源并安装必要的环境
RUN yum makecache && yum install -y \
    nodejs \
    npm \
    screen \
    wget \
    && yum clean all

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
