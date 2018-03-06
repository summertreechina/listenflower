<?php
namespace app\TorenAdmin\controller;
use think\Db;
use think\Controller;
use app\Common\Controller\AuthController;

/**
* 后台用户管理控制器
*/
class UserController extends AuthController
{
	
	/**
	 * 用户列表页视图
	 * @return [type] [description]
	 */
	public function index() {
		$list = Db::name('truser')->paginate(4);
		$this->assign([
			'list' => $list,
		]);
		return $this->fetch();
	}

	/**
	 * 显示一个公司的用户
	 * $cid corp公司的id
	 * @return [type] [description]
	 */
	public function corpuser($id) {
		$id = intval($id);
		
		$list = Db::name('truser')->where('corpid', $id)->paginate(1);
		$this->assign([
			'list' => $list,
		]);
		return $this->fetch();
	}

	/**
	 * 新增用户视图
	 */
	public function addView() {
		return $this->fetch();
	}

	/**
	 * 新增用户方法
	 */
	public function add() {
		$data = input('param.', '','strip_tags');
			// print_r($data);die;
		$userinfo = [
			'uname' => $data['name'],
			'mobile' => $data['umobile'],
			'password' => $data['upwd'],
			'corpid' => $data['corpid'],
			'role' => $data['urole'],
			'idcard' => $data['idcard'],
			'other' => $data['other'],
			'create_time' => time(),
		];
		// 检测该单位是否已经存在
		$isexist = Db::name('truser')->where('mobile', $userinfo['mobile'])->find();
		if ($isexist) {
			$this->error('新增的用户已经存在，请检查录入信息');
		}

		// db('user')->insert($data); 助手函数
		$uid = Db::name('truser')->insertGetId($userinfo);
		if ($uid) {
			// 显示该条数据的效果 
			$this->success('新增成功', url('user/showauser', ['id'=>$uid]));
		} else {
			// 显示客户错误信息
			$this->error('新增失败，请检查录入信息再次尝试，或者联系管理员');
		}
	}

	/**
	 * 显示一位用户的详细信息
	 * @param  integer $id [description]
	 * @return [type]      [description]
	 */
	public function showauser($id = 1) {
		$id = intval($id);
		$info = Db::name('truser')->find($id);
		$this->assign([
			'userinfo' => $info,
		]);
		return $this->fetch();
	}

	/**
	 * 编辑用户信息的视图
	 * @param  [type] $id [description]
	 * @return [type]     [description]
	 */
	public function editview($id) {
		$id = intval($id);
		$info = Db::name('trcorp')->find($id);
		$this->assign([
			'corpinfo' => $info,
		]);
		return $this->fetch();
	}

	/**
	 * 编辑一家公司信息的方法
	 * @param  [type] $id 被编辑公司的唯一标识
	 * @return [type]     编辑的结果 成功或失败
	 *                    成功跳转到信息展示页面 失败调转到编辑页面
	 */
	public function edit($id) {
		$id = intval($id);
		$data = input('param.', '','strip_tags');
		$corpinfo = [
			'corpname' => $data['corpname'],
			'nickname' => $data['nickname'],
			'address' => $data['address'],
			'corpuser' => $data['corpuser'],
			'contact' => $data['contact'],
			'other' => $data['other'],
			'uppercorpid' => $data['uppercorp'],
			// 'update_time' => time(),
		];
		$r = Db::name('trcorp')->where('id', $id)->update($corpinfo);
		if (!$r) {
			$this->error('您未更改任何信息，请确认是否需要继续编辑');
		} else {
			$this->success('编辑成功', url('corp/showacorp', ['id'=>$id]));
		}
	}

	public function userlist() {
		$list = Db::name('trcorp')->where('isactive', 1)->select();
		return $list;
	}

	/**
	 * 切换用户状态
	 * @param  [type] $status [0或1]
	 * @return [type]         [切换结果]
	 */
	public function togglestatus($status, $uid) {
		// echo $status;die;
		// echo $uid;die;
		if (!$status) {
			# 如果是0 就激活
			$this->outtrash($uid);
		} else {
			# 如果是1 就放入回收站
			$this->intrash($uid);
		}
		
	}

	/**
	 * 将用户放入回收站
	 * @param  [type] $id [description]
	 * @return [type]     [description]
	 */
	private function intrash($id) {
		$id = intval($id);
		$r = Db::name('truser')->where('id', $id)->update(['isActive' => 0]);
		if (!$r) {
			$this->error('将该会员放入回收站的操作失败，请联系管理员');
		} else {
			$this->success('操作成功，您可以从回收站内找到该会员', url('user/index'));
		}
	}

	/**
	 * 将用户从回收站中取出
	 * @param  [type] $id [description]
	 * @return [type]     [description]
	 */
	private function outtrash($id) {
		$id = intval($id);
		$r = Db::name('truser')->where('id', $id)->update(['isActive' => 1]);
		if (!$r) {
			$this->error('将该会员从回收站取出的操作失败，请联系管理员');
		} else {
			$this->success('操作成功，该会员已从回收站取出');
		}
	}

	/**
	 * 回收站里用户列表
	 * @return [type] [description]
	 */
	public function trashlist() {
		$r = Db::name('truser')->where('isactive', 0)->select();
		return $r;
	}

	/**
	 * 
	 * @return [type] [description]
	 */
	public function trashview() {
		$list = Db::name('truser')->where('isactive', 0)->paginate(2);
		$this->assign([
			'list' => $list,
		]);
		return $this->fetch();
	}

}