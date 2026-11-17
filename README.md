<div align="center">

# 📺 TVBox 源

一份在线托管的 TVBox 配置源，配置与 `spider` jar 一起放在本仓库，可长期引用。

![sites](https://img.shields.io/badge/站点数-16-2ea44f?style=flat-square)
![format](https://img.shields.io/badge/格式-JSON-orange?style=flat-square)

</div>

---

## 📖 这是什么

**TVBox**（含影视、影视仓等套壳客户端）是一个开源的影视聚合客户端，本身不含任何内容，需要填入一个「配置地址」才能用。

这个仓库就是那个配置地址的提供方：

- `tvbox.json` —— 配置主文件，告诉客户端去哪些站点找片
- `custom_spider.jar` —— 爬虫包，配置里 16 个 `csp_` 站点全靠它工作

两点说明：

- 配置里的 `spider` 用**相对路径** `./custom_spider.jar`，由客户端按配置地址自动解析，所以不用改用户名和仓库名
- 配置里登记了 jar 的 **MD5**，下载损坏会直接报错

## 🚀 用法

复制下面任一地址，填进客户端的「**配置地址 / 订阅 / 接口**」，回首页等待加载即可：

```
https://raw.githubusercontent.com/lzlzlzhh/yunbox/main/tvbox.json
```

如果 raw 访问慢，用镜像：

```
https://ghproxy.net/https://raw.githubusercontent.com/lzlzlzhh/yunbox/main/tvbox.json
```


## ⚠️ 免责声明

- 本项目**仅做配置与 jar 的搬运和固化**，不生产、不存储、不分发任何影视内容。
- 所有内容均来自互联网，版权归原作者所有，**仅供技术学习与测试使用**。
- 请勿用于商业用途或任何违法场景；请于下载后 24 小时内删除。
- 使用本仓库所产生的一切后果由使用者自行承担。
- 如有侵权，请联系删除。

## 🙏 致谢

- 配置与 spider 的原始整理者（源站维护者）
- [FongMi/CatVodSpider](https://github.com/FongMi/CatVodSpider) —— `spider` 机制的开源实现
- 所有为 TVBox 生态做出贡献的开发者

---

<div align="center">
<sub>如果这个仓库帮到了你，欢迎点个 ⭐ Star</sub>
</div>
