<?php
namespace app\Common\model;
use think\Model;

class AnsModel extends Model {

	protected $autoWriteTimestamp = true;

	public function addAnswers($data) {
		$r = $this->save($data);
		return $r;
	}

	public function getQuestion($id) {

	}
}
?>
