<?php
namespace app\common\model;
use think\Model;

/**
* 
*/
class CategoryModel extends Model
{
	
	function __construct()
	{
	}

	public function add($data) {
		$data['status'] = 1;
		$data['create_time'] = time();
		return $this->save($data);
	}
}




































?>