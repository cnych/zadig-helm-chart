# zadig helm chart

基于官方 `koderover-chart/zadig` Chart 包对 Kubernetes1.22 版本进行了兼容，主要是对于 Ingress 资源对象的兼容修改。

一键安装：

```shell
$ helm upgrade --install zadig --namespace zadig  ./zadig --set endpoint.type=IP \
    --set endpoint.IP=xx.xx.xx.xx \
    --set ingress-nginx.controller.service.nodePorts.http=30888 \
    --set ingress-nginx.controller.image.repository=cnych/ingress-nginx-controller \
    --set ingress-nginx.controller.image.tag=v1.0.4
```

Kubernetes1.22 需要使用 ingress-nginx v1.0.0+ 版本：

![ingress-nginx 版本支持](https://bxdc-static.oss-cn-beijing.aliyuncs.com/images/20211110124506.png)

其他定制方法参考官方文档：[https://docs.koderover.com/zadig/install/helm-deploy/](https://docs.koderover.com/zadig/install/helm-deploy/)
