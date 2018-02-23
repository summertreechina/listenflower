<?php
namespace app\Common\controller;
use think\Controller;
use \think\Request;
use TP\Auth;

class AuthController extends Controller
{
    protected function _initialize() {
    	$sess_auth = session('TRUser', '', 'Toren');
    	if (!$sess_auth) {
    		$this->error('没有登录，正在返回');
    	}

    	if ($sess_auth['id'] == 3) {
    		// 3是总管理员的ID
    		return true;
    	}
    	
			$auth       = new Auth();
			$request    = Request::instance();
			$module     = $request->module();
			$controller = $request->controller();
			$action     = $request->action();
			
    	if (!$auth->check( $module.'/'.$controller.'/'.$action, $sess_auth['id'])) {
    		$this->error('没有权限，正在返回');
    	} else {
    		return true;
    	}
    }
}