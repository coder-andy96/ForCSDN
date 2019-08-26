1在linux下编辑一个.c文件
编辑这个.c文件的目的是为了后边测试makefile的使用。
1.1创建一个目录用于存放代码。
cd  /
mkdir usr2
cd usr2
mkdir ccode

1.2 创建一个hello.c文件
1.2.1 vim hello.c创建一个hello.c文件并且进入编辑模式
1.2.2 点击i进入输入模式，之后编写hello.c
1.2.3 完成之后点击esc退出输入模式，进入命令模式，点击shift+:
输入wq退出并且保存
1.3使用makefile编译hello.c文件
make命令执行的时候必须要有一个makefile文件，来告诉make命令需要怎样的去进行编译和链接程序。
2．makefile的书写和使用
2.1makefile的格式
makefile中的格式如下：target ：prerequisites
					  commond
target是要生成的目标文件
prerequisites是要生成这个目标文件需要的文件或者目标
commond是make需要执行的命令
注意：makefile的一个规则就是最终目标必须写在第一行。在使用编译器进行编译的时候必须要在前边添加一个tab，这个是设置的一种依赖关系，必须要添加tab，不能用空格补齐，否则无法识别。
2.2示例
下边是一个makefile简单的例子，只牵扯到了一个.c文件，就是使用到了上边编写的hello.c文件
hello:hello.o
	gcc –o hello hello.o
hello.o:hello.c
	gcc –c hello.o hello.c

clean:
	rm hello.o hello
关于上边文件的解释：
第一行的意思是最终输出一个hello文件，hello文件的生成是依赖于hello.o文件的
第二行的意思是使用gcc编译器编译hello.o文件生成hello文件
第三行的意思是hello.o文件的生成是依赖于hello.c文件的
第四行的意思是通过gcc编译器编译hello.c文件生成hello.o文件
最后添加clean的功能是通过 make clean指令实现删除hello和hello.o文件。
3其他
3.1关于包含多个.h和.c文件的时候
有两个.c文件需要编译的时候编译出来的任务总是会报no such file or directory这个错，暂时放下，有空了回来继续解决，但必须是在今天之内。
自己在写多个文档的时候没有理清楚c语言中程序执行的时候编译和链接的过程，编译的时候使用的是gcc –c a.c b.c 从而生成对应的a.o b.o文件，我在写的时候写成了gcc –c a.o b.o a.c b.c,这种格式是错误的，再者在对对应的.c文件进行编译的时候prerequisites只需要写对应的.c文件和.h文件即可。
进行链接的时候使用的是gcc –o main a.o b.o:在这块需要注意的是不需要添加.h文件，只需要把相应的.o文件添加进来就可以了。

文章最后因为是自己刚开始学习使用makefile，所以上述有什么错误欢迎大家批评指正。
