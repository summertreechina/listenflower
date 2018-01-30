<?php
namespace app\Common\model;
use think\Model;

class TRDayScoreModel extends Model {

	protected $autoWriteTimestamp = 'datetime';
	protected $table = 'nn_trdayscore';
	protected $updateTime = true;

	public function add($data) {
		$r = $this->save($data);
		return $r;
	}

	public function updateScore() {
		
	}


}
?>