<?php
namespace app\admin\validate;
use think\Validate;

/**
* 针对Category的验证类
*/
class CategoryValidate extends Validate
{
	protected $rule = [
		['c_name', 'require|max:10'],
		['explain', 'require'],
		['pid', 'number'],
		['id', 'number'],
		['status', 'number|in:-1,0,1'],
		['list_order', 'number']
	];

	protected $message  =   [
		'c_name.require' => '分类名称必须传递',
		'c_name.max'     => '分类名称最多不能超过10个字符',
		'explain'     => '用于排序的城市分类拼音名称必须填写',
		// 'name.min'     => '分类名称最少不能小于3个字符',
		// ...
		// 'age.number'   => '年龄必须是数字',
		// 'age.between'  => '年龄只能在1-120之间',
		// 'email'        => '邮箱格式错误',
  ];

  // 场景设置
	protected $scene = [
		'add'        => ['c_name', 'pid', 'explain', 'status'],		// 添加时验证
		'list_order' => ['id', 'list_order'],		// 排序时验证
  ];

	
	function __construct()
	{
		// P($data);die;
	}


}




?>