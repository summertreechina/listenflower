<?php
namespace app\Common\model;
use think\Model;

class TRTomorrowModel extends Model {

	protected $autoWriteTimestamp = 'datetime';
	protected $table = 'nn_trtomorrow';
	protected $type = [
	        'items'     =>  'array',
	];

	public function getToday ($timestamp) {
		$date1 = date('Y-m-d', round($timestamp/1000));
		$date2 = date('Y-m-d', round($timestamp/1000 + 60*60*24));

		$r = $this->whereTime('use_time', 'between', [$date1, $date2])
		->field('items')
		->order('id', 'desc')
		// ->fetchSql(true)
		->find();

		if (!$r) {
			return null;
		}

		$checkedId = json_decode($r)->items;
		return $checkedId;
	}

	public function saveCheckedList() {

	}
}
?>