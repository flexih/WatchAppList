# WatchAppList
📱✋🤚⌚️

你是否想知道App Store排行榜上支持Apple Watch的应用有多少？

如果你的回答是肯定的，请继续阅读。

#### 前提

安装Google Chrome。

#### 使用

该工具使用Apple Script开发，有两种使用方式，推荐第一种。

1.在Terminal里执行
```/list.sh```

2.Script Editor
双击`list`，使用Script Editor运行。

#### 自定义参数

```
--七麦排行榜
set Link to "https://www.qimai.cn/rank/index/brand/free/country/cn/genre/5000/device/iphone"
--每页50个,默认显示Top100
set PageCount to 2
set AppCount to PageCount * 50
--加载等待时长
set Duration to 2
```



>数据来自七麦数据App Store排行榜。
