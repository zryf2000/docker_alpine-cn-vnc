# docker_alpine-cn-vnc
直接用[rwildcat](https://github.com/rwildcat/docker_alpine-vnc)的alpine-vnc镜像生成
**更新**: 3/16/2022    
**Base image**: Alpine:3.12 (3.12.4)
## 内容
1、解决中文字符乱码。
2、中文菜单。
3、增加unrar。
## Users
User/pwd:
* root / alpine
* alpine / alpine (sudoer)
* vnc密码:1234 
* vnc密码更改：
  ```sh
   $ x11vnc -storepasswd 1234 /etc/x11vnc.pass
   ```
