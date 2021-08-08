# Github Hosts Autoupdate for mac

此轻量级小工具将在 mac 上自动定时更新 github hosts

- 默认情况下每小时更新一次。如需更改间隔请修改 githubhosts.plist 文件中的`StartInterval`。
- 使用的 host 源为 [JohyC/GithubHosts](https://github.com/JohyC/GithubHosts) 项目的 Gitee 源。如需更换默认源请在可修改 `hoststool` 里的 `github_hosts` 变量，或在[手动运行](#使用)时指定url。

## 安装

下载源代码并安装。

```shell
$ git clone https://github.com/Sansui233/mac-githubhosts-autoupdate.git && cd mac-githubhosts-autoupdate
$ sudo ./install.sh
```

成功安装后会立即运行一次。

此脚本使用 launchdaemon 定时运行，不会在后台长期挂起。可以使用 launchctl 查看其状态。

```shell
$ sudo launchctl list | grep hoststool
# 正常情况下的输出为。- 表示当前未运行，0 表示上次运行的状态正常。
-	0	hoststool 
```

查看 log 可以打开系统的日志程序 Console，右边选择 Log，搜索 hoststool 查看运行日志。

## 使用

安装完成之后将自动运行，无需其他配置。

如需手动运行：

```shell 
$ hoststool # 查看可选参数
$ hoststool -u # 更新 Github hosts
$ hoststool -u remote_url # 更新时指定 hosts 源
```

## Alfred Workflow

此工作流提供了手动运行 hoststool 的 Alfred 快捷方式。 workflow 使用的 hoststool 独立系统中安装的 hoststool。

下载并双击安装仓库中的 alfred workflow 即可，由于修改 host 需要管理员权限，安装时需要在 `ROOTPASSWORD` 中填入当前用户密码字段。

之后在 Alfred 中运行 `hoststool` 即可更新 hosts。

## 卸载

```shell
$ ./uninstall.sh
```

## Thanks

- [JohyC/GithubHosts](https://github.com/JohyC/GithubHosts)
- [Icon](https://icon-icons.com/zh/%E5%9B%BE%E6%A0%87/github/59223) © CC BY 4.0