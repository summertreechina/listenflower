<?php
namespace app\Common\model;
use think\Model;

/**
* 
*/
class RoleModel extends Model
{
	// 方法的命名使用驼峰法（首字母小写）
	public function getAvailableRole() {
		return $this->where('status', 1)->order('id', 'asc')->select();
	}

	public function getAllRole() {
		return $this->order('id', 'asc')->select();
	}

}














?>