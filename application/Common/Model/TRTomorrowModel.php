<?php
namespace app\Common\model;
use think\Model;

class TRTomorrowModel extends Model {

	protected $autoWriteTimestamp = true;
	protected $table = 'nn_trtomorrow';
	protected $type = [
	        'items'     =>  'array',
	        // 'use_time'  =>  'timestamp:Y/m/d',
	];

	public function getToday () {
		// return $this->whereTime('use_time', 'today')->field('items')->find();
		$r = $this->where(['id' => 3])->field('items')->find();
		return json_decode($r);
	}


}
?>