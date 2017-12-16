<?php
namespace app\Common\model;
use think\Model;

/**
* 管理类角色名称
*/
class ManagerRoleModel extends Model
{
	// 方法的命名使用驼峰法（首字母小写）
	public function getAvailableManagerRole() {
		return $this->where('status', 1)->order('id', 'asc')->select();
	}

	public function getAllManagerRole() {
		return $this->order('id', 'asc')->select();
	}

}





?>