<?php
namespace app\Toren\controller;
use think\Controller;
use app\Common\Model\AskModel;
use app\Common\Model\AnsModel;

class TRAdminController extends Controller {

	public function index() {
		return $this->fetch();
	}

	public function addUser() {

	}

	public function addCorp() {
		return $this->fetch();
	}

}
?>