<?php
namespace app\Common\model;
use think\Model;

class AskModel extends Model {

	protected $autoWriteTimestamp = true;

	public function addQuestion($data) {
		$this->save($data);
		return $this;
	}

	public function getQuestion($id) {

	}
}
?>
