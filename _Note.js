任何一个容器都可以指定为 Flex 布局
.box{
  display: flex;
}
.box{
	// 行内元素
  display: inline-flex;
}

采用 Flex 布局的元素，称为 Flex 容器（flex container），简称"容器"。
所有子元素自动成为容器成员，称为 Flex 项目（flex item），简称"项目"。

6个属性设置在容器上。
	flex-direction 内部项目排列方向  row | row-reverse | column | column-reverse;
	flex-wrap			内部项目是否换行   nowrap | wrap | wrap-reverse;
	flex-flow			以上两项综合	      <‘flex-direction’> || <‘flex-wrap’>;
	justify-content		内部项目水平对齐方式    flex-start | flex-end | center | space-between | space-around; 如水平居中
	align-items				内部项目竖向对齐方式    flex-start | flex-end | center | baseline | stretch; 如垂直居中
	align-content			flex-start | flex-end | center | space-between | space-around | stretch;
	'当我们把容器的flex-warp的值设置为warp或者warp-reverse时，若项目不能在一根主轴上显示，容器便会出现多根主轴。此时便需要一个值来定义多根平行轴线的对齐方式，这个值便是align-content。'

6个属性设置在项目上
	order					项目本身的排序  默认值为0。
	flex-grow			项目自身的放大
	flex-shrink		项目自身的缩小
	flex-basis		项目自身在父元素主轴还有剩余空间时，定义自身所占的空间。
	flex          none | [ <'flex-grow'> <'flex-shrink'>? || <'flex-basis'> ]
	align-self		项目自身采取不一样的对齐方式

'flex布局踩过的那些坑 https://segmentfault.com/a/1190000006559564'
`http://flexboxfroggy.com/`

关于 less
	1 建立的一文件夹，如less、source，在其内部创立一个less文件
	2 将文件夹拖入Koala中
	3 右键设置输出路径...
	4 点击koala中的项目，选择“执行编译”
	5 // 这是不会编译的注释   /* 这是会被编译掉的注释 */
	6 变量
		定义变量
			@test_width: 300px;
			// @变量名:值;
		使用变量
			nav { width: @test_width; }
	7 混合
		将已经定义的样式块放置于其他样式中，组成一个大的样式块
		如： .nav { color: #333; .flagStyle;}

	8 带参数的混合
		定义与使用
			.border_02(@border_width){
				border: solid yellow @border_width;
			}
			.test_Mixins{
				.border_02(30px);
			}
			// 也可以默认带值，所以使用的时候就可以不必赋值了
				.border_03(@border_width:10px;){
					border: solid yellow @border_width;
				}
				.test_Mixins_03{
					.border_03();
				}
		9 匹配模式
			--近似与JS中的if
			--个人感觉更像混合模式的进一步应用
			--定义与应用
				--定义
					.pos(r){
						position: relative;
					}
					.pos(a){
						position: absolute;
					}
					.pos(f){
						position: fixed;
					}
				--使用
					nav {
						.pos(a);
						// 在 https://www.imooc.com/video/4832 有更深入的讲解，画一个三角形
					}
		10 运算
			--定义
				@value: 300px;
			--使用
				.test_box {
					width: @value;
					height: @value * 2;
					line-height: (@value - 10) / 4;
					// px 单位没有强制要求
				}
		11 嵌套规则
			正是我想要的，有组织管理的作用，具体用法太复杂，详见'https://www.imooc.com/video/4834'
		12 @arguments变量
			原来
				.border_arg(@w:30px, @c:red, @x:solid){
					border: @w:30px, @c:red, @x:solid;
				}
			简写
				.border_arg(@w:30px, @c:red, @x:solid){
					border: @arguments;
					// @arguments 是less的保留词
				}
			应用
				.test_arg{
					.border_arg();
				}
			拓展应用
				.test_arg{
					.border_arg(40);
				}
			总结
				表面上有些复杂，其实都是嵌套的延伸应用
		13 避免编译、!important以及总结
			有时候我们需要输出一些不正确的CSS语法或者使用一些LESS不认识的专有语法。
			要输出这样的值我们可以在字符串前加上一个 ~
			例如：
			width:~'calc(100%-35)';
			height:~'calc(300px-20px)';
			编译后(.css文件):
			width: calc(100%-35);
			height: calc(300px-20px);
			!important关键字
			会为所有混合所带来的样式,添加上!important
		14 导入另外一个less文件
			@import "不带扩展名的文件名";
			@import "style.css";  // 原样导入
			@import (less) "style.css";  // 导入并转化成less文件
			
			`https://www.cnblogs.com/hubl/p/5742573.html`
















