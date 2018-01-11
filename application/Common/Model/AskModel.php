<?php
namespace app\Common\model;
use think\Model;

class AskModel extends Model {

	protected $autoWriteTimestamp = true;

	public function addQuestion($data) {
		$this->save($data);
		return $this->id;
	}

	public function getQuestion($id) {

	}

	public function QuestionIsExist($content) {
		$r = $this->where('content', $content)->find();
		if ($r) {
			return true;
		} else {
			return false;
		}
	}

}

?>
