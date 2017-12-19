<?php
namespace app\Common\model;
use think\Model;

class CatesModel extends Model {

	protected $autoWriteTimestamp = true;

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
		// P($data);die;
		if ($this->isExist($data)) {
			return false;
			// return exit('城市已存在，请检查录入');
		}
		$this->save($data);
		return $this->id;
	}

	public function isExist($data) {
		return $this->where(['pid'=> $data['pid'], 'c_name' => $data['c_name']])->find();
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