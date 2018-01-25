<?php
namespace app\Common\model;
use think\Model;

class TRUserScoreModel extends Model {

	protected $autoWriteTimestamp = 'datetime';
	protected $table = 'nn_truserscore';
	protected $updateTime = false;

	public function add($data) {
		$r = $this->save($data);
		return $r;
	}

	public function maxScore($uid) {
		$r = $this->where('user_id', $uid)->whereTime('create_time', 'd')->max('score');
		return $r;
	}


}
?>