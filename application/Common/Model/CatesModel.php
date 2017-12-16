<?php
namespace app\Common\model;
use think\Model;

class CatesModel extends Model {

	public function _initialize() {
		
	}
	// 
	public function index() {

	}

	// 以城市为例
	public function getChildCate($pid=1) {
		$data = [
			'pid' => $pid,
		];
		return $this->where($data)->field('id,pid,c_name')->select();
	}

	public function addCate($data) {


	}

	public function editCate() {

	}

	public function editCateStatus() {

	}

	public function softDelCate() {

	}

	public function DelCateTure() {

	}



}






?>