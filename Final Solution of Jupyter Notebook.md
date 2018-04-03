# Final Solution of Jupyter Notebook
# 《Jupyter Notebook 的终极解决方案》

## 如何在远程服务器上使用JPT

首先，在服务器上，生成配置文件

	jupyter notebook --generate-config
	
然后修改配置文件

	vim ~/.jupyter/jupyter_notebook_config.py
	
以下是修改内容

	c.NotebookApp.ip = '0.0.0.0'      #支持其它IP访问，关键
	c.NotebookApp.port = 10000 #随便指定一个端口
	
然后为了方便，在 `.bashrc` 中加入快捷方式

	alias jpt="jupyter notebook --no-browser"
	
每次当你想使用JPT的时候，直接在服务器里输入 `jpt` 即可

然后在本地浏览器地址栏中输入：

	http://address_of_remote:10000
	
就可以看到jupyter的登陆界面，输入密码即可。

## 如何利用 JPT 操作文件

**导入代码**

	%load ./hello_world.py
	
**查看代码**

	%pycat ./hello_world.py  #新开一个窗口，查看代码
	
**写入代码**

	%%writefile ./hello_world.py
	
**运行代码**

	%run ./hello_world.py
	

##  如何利用 JPT Debug

**获取帮助文档**

在变量、函数前打问号即可

	?str.replace()
	
**画图**

一般两种模式：inline[就是呈现一张图]、interaction[会有可操作模块]

inline模式

	%matplotlib inline
	
interaction模式

	%matplotlib notebook
	
推荐后者


**查看变量**

不加任何参数， %who 命令可以列出所有的全局变量。加上参数 str 将只列出字符串型的全局变量。

	%who str
	
**计时**

有两种用于计时的jupyter magic命令： %%time 和 %timeit.当你有一些很耗时的代码，想要查清楚问题出在哪时，这两个命令非常给力。%%time 会告诉你cell内代码的单次运行时间信息。%%timeit 使用了Python的 timeit 模块，该模块运行某语句100，000次（默认值），然后提供最快的3次的平均值作为结果。

	import numpy 
    %timeit numpy.random.normal(size=100)
    
 %prun: 告诉你程序中每个函数消耗的时间

	%prun some_useless_slow_function()
 	
**调试程序**

	%pdb 
    def pick_and_take(): 
    	picked = numpy.random.randint(0, 1000) 
    	raise NotImplementedError() 

    pick_and_take()

































