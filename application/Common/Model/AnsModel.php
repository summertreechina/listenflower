<?php
namespace app\Common\model;
use think\Model;

class AnsModel extends Model {

	protected $autoWriteTimestamp = true;

	public function addAnswers($data) {
		$r = $this->save($data);
		return $r;
	}

	public function getAnswers($id) {
		$r = $this->where('ask_id', $id)->select();
		return $r;
	}

	public function getRightAnswers($id) {
		$r = $this->where(array('ask_id'=>$id, 'isRight'=>1))->column('content');
		return $r;
	}
}
?>
