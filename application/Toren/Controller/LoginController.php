<?php
namespace app\TorenAdmin\controller;

use think\Db;
use think\Controller;

class QuesController extends Controller
{

	protected $timer = 60 * 3 * 1000;

	protected $init_timer;


	/**
	 * 用户登录处理
	 * @return [type] [description]
	 */
	public function login() {
		if (request()->isAjax()) {
		    return json('非法访问');
		}
		$data['mobile'] = input('post.mobile/d');
		$data['password'] = md5(input('post.password/s'));

		$user = Db::name('truser')->where('mobile', $data['mobile'])->find();
		if (!$user) {
		    $res = array('status'=>0, 'msg'=>'用户不存在' );
		    return json($res);
		};
		if ($data['password'] != $user['password']) {
		    $res = array('status'=>0, 'msg'=>'密码错误');
		    return json($res);
		};
		if (!$user['isActive']) {
		    $res = array('status'=>0, 'msg'=>'账户被锁定，请联系管理员');
		    return json($res);
		}
		$showUserinfo = array(
		    'id' => $user->id,
		    'uname' => $user->uname,
		    'mobile' => $user->mobile,
		);
		session('TRUser', $showUserinfo, 'Toren');
		return json([ 'status'=>1, 'msg'=>'登录成功', 'username'=>$user['uname'] ]);
	}


	/**
	 * 用户退出登录操作
	 * @return [type] [description]
	 */
	public function logout() {
	    session(null, 'Toren');
	    return json(true);
	}


	/**
	 * 验证用户是否登录
	 * @return boolean [description]
	 */
	public function isLogin() {
	    $user = session('TRUser', '', 'Toren');
	    if ($user && $user['id']) {
	        return json($user);
	    }
	    return json(null);
	}

}