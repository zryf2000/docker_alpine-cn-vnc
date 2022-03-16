# docker_alpine-cn-vnc
直接用[rwildcat](https://github.com/rwildcat/docker_alpine-vnc)的alpine-vnc镜像生成
**更新**: 3/16/2022    
**Base image**: Alpine:3.12 (3.12.4)
## 内容
1、解决中文字符乱码。
2、中文菜单。
3、增加unrar。
## 用户
User/pwd:
* root / alpine
* alpine / alpine (sudoer)
* vnc密码:1234 
* vnc密码更改：
  ```sh
   $ x11vnc -storepasswd 1234 /etc/x11vnc.pass
   ```
## 使用方法
 ```sh
# clone git repository
$ git clone https://github.com/zryf2000/docker_alpine-cn-vnc.git

# build image
$ cd zryf2000/docker_alpine-cn-vnc
$ docker build -t zryf2000/docker_alpine-cn-vnc:v1 .
``` 
