# docker-v2ray
快速开始的v2ray服务器
# 使用
```
docker pull ghostry/v2ray
name=gv2
docker container stop $name
docker container rm $name
docker run -d \
--name $name \
--user $(id -u):$(id -g) \
-p 9011:9011 \
-v ~/.$name:/v2ray \
--restart always \
ghostry/v2ray
sleep 5
cat ~/.$name/config.json
```
如果希望自定义UUID,增加参数
```
-e UUID=YOUR_UUID \
```
