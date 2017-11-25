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
	flex-direction
	flex-wrap
	flex-flow
	justify-content
	align-items
	align-content

6个属性设置在项目上
	order
	flex-grow
	flex-shrink
	flex-basis
	flex
	align-self



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
		















