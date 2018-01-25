<?php
namespace app\Common\model;
use think\Model;

class TRuserModel extends Model {

	protected $autoWriteTimestamp = true;
	protected $table = 'nn_truser';

	public function add($data) {
		$r = $this->save($data);
		return $r;
	}

	public function getByMobile($mobile) {
		$r = $this->where('mobile', $mobile)->find();
		return $r;
	}

}
?>