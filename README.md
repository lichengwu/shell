日常shell工具整理：
====
## isvn
这是一个svn命令的工具包，主要提供以下功能：
* 切换到主干
* 切换到任意分支
* 分支列表
* 从任意分支(主干)创建新分支

*这个工具只适用与淘宝svn仓库，svn地址类似：http://svn.app.taobao.net/repos/xxx/trunk/xxx*

### 用法

```shell
isvn help
Usage: isvn [options]
Subversion utils.
	Options:
	bl - list all branches in current repository
	sb [branch] - switch to [branche], the [branche] can be a regexp. 
                  If it match more than one branches, a selector will display.
                  If the branch is trunk, it will create new branch from trunk.
	t - switch to trunk
	nb [from] [to] - create new branch [to] from [from]

Example:
    isvn bl
    isvn t
    isvn sb a.*
    isvn nb trunk test
    isvn help
```

## ping-range
这个工具用来检查一个ip范围是否可以ping通
### 用法

```shell
./ping-range 192.168.1 100 105
IP 192.168.1.100 is UP
IP 192.168.1.101 is DOWN
IP 192.168.1.102 is UP
IP 192.168.1.103 is UP
IP 192.168.1.104 is DOWN
IP 192.168.1.105 is DOWN

```




