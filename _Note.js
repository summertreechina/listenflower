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