<?php
namespace app\admin\validate;
use think\Validate;

/**
* 针对Category的验证类
*/
class CategoryValidate extends Validate
{
	protected $rule = [
		['name', 'require|max:10'],
		['parent_id', 'number'],
		['id', 'number'],
		['status', 'number|in:-1,0,1'],
		['list_order', 'number']
	];

	protected $message  =   [
		'name.require' => '分类名称必须传递',
		'name.max'     => '分类名称最多不能超过10个字符',
		// 'name.min'     => '分类名称最少不能小于3个字符',
		// ...
		// 'age.number'   => '年龄必须是数字',
		// 'age.between'  => '年龄只能在1-120之间',
		// 'email'        => '邮箱格式错误',
  ];

  // 场景设置
	protected $scene = [
		'add'        => ['name', 'parent_id'],		// 添加时验证
		'list_order' => ['id', 'list_order'],		// 排序时验证
		// 'edit' =>  ['name','age'],
  ];

	
	function __construct()
	{
		return '运行构造函数';
	}


}




?>