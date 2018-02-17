<?php
namespace app\Common\controller;
use think\Controller;
use think\Env;
use TP\Auth;

class AuthController extends Controller
{
    protected function _initialize() {
    	$sess_auth = session('TRUser', '', 'Toren');
    	if (!$sess_auth) {
    		$this->error('没有登录，正在返回');
    	}
    	print_r($sess_auth);

    	// if ($sess_auth['id'] == 3) {
    	// 	return true;
    	// }

    	$auth = new Auth();
    	if (!$auth->check( Env::get('module_path').'/'.Env::get('controller_path').'/'.Env::get('action_path'), $sess_auth['id'])) {
    		$this->error('没有权限，正在返回');
    	}
    }
}