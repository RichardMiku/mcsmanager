# mcsmanager

## 启动容器

使用

```bash
docker run -d -p 23333:23333 -p 24444:24444 -p 25565:25565 -p 19132:19132 --name mcsm mcmanager
```
或

```bash
docker run -d \
  -p 23333:23333 \
  -p 24444:24444 \
  -p 25565:25565 \
  -p 19132:19132/udp \
  --name mcsm \
  mcmanager

```

## 说明

由于使用Ubuntu镜像构建的镜像占空空间过大，若需使用请进入Ubuntu文件夹自行构建