<?php
namespace app\TorenAdmin\controller;

use think\Db;
use think\Request;
use think\Controller;
use app\Common\Controller\AuthController;

/**
* 后台公司管理控制器
*/
class CorpController extends AuthController
{
	
	/**
	 * 公司列表页视图
	 * @return [type] [description]
	 */
	public function index() {
		$list = Db::name('trcorp')->where('isactive', 1)->paginate(4);

		$this->assign([
			'corplist' => $list,
		]);
		return $this->fetch();
	}

	/**
	 * 新增公司页视图
	 */
	public function addView() {
		return $this->fetch();
	}

	/**
	 * 新增公司方法
	 */
	public function add() {
		$data = input('param.', '','strip_tags');
			// print_r($data);die;
		if (!$data['corpname'] || !$data['address'] || !$data['corpuser']) {
			$this->error('信息填写不完整，请检查后再次尝试');
		}
		$corpinfo = [
			'corpname' => $data['corpname'],
			'nickname' => $data['nickname'],
			'address' => $data['address'],
			'corpuser' => $data['corpuser'],
			'contact' => $data['contact'],
			'other' => $data['other'],
			'uppercorpid' => $data['upperid'],
			'create_time' => time(),
		];
		// 检测该单位是否已经存在
		$isexist = Db::name('trcorp')->where('corpname', $corpinfo['corpname'])->find();
		if ($isexist) {
			$this->error('提交的单位已经存在，请检查录入信息');
		}

		// db('user')->insert($data); 助手函数
		$cropid = Db::name('trcorp')->insertGetId($corpinfo);
		if ($cropid) {
			// 显示该条数据的效果 
			$this->success('新增成功', url('corp/showacorp', ['id'=>$cropid]));
		} else {
			// 显示客户错误信息
			$this->error('新增失败，请检查录入信息再次尝试，或者联系管理员');
		}
	}

	/**
	 * 显示一家公司的信息
	 * @param  integer $id [description]
	 * @return [type]      [description]
	 */
	public function showacorp($id = 1) {
		$id = intval($id);
		$info = Db::name('trcorp')->find($id);
		$this->assign([
			'corpinfo' => $info,
		]);
		return $this->fetch();
	}

	/**
	 * 编辑一家公司信息的视图
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

	/**
	 * 获取所有公司
	 * @return [type] [description]
	 */
	public function corplist() {
		$corplist = Db::name('trcorp')->where('isactive', 1)->select();
		return $corplist;
	}
	/**
	 * 根据关键字搜索单位
	 * @return [type] [description]
	 */
	public function ajax_corplist() {
		$keyword = input('param.name', '','strip_tags');
		if ($keyword) {
			$where = 'corpname LIKE "%'.$keyword.'%"';
			// return json($where);
			$corplist = Db::name('trcorp')->where($where)->select();
			return json($corplist);
		}

	}

	/**
	 * 将单位放入回收站
	 * @param  [type] $id [description]
	 * @return [type]     [description]
	 */
	public function intrash($id) {
		$id = intval($id);
		$r = Db::name('trcorp')->where('id', $id)->update(['isactive' => 0]);
		if (!$r) {
			$this->error('将该单位放入回收站的操作失败，请联系管理员');
		} else {
			$this->success('操作成功，您可以从回收站内找到该单位', url('corp/index'));
		}
	}

	/**
	 * 将单位从回收站中取出
	 * @param  [type] $id [description]
	 * @return [type]     [description]
	 */
	public function outtrash($id) {
		$id = intval($id);
		$r = Db::name('trcorp')->where('id', $id)->update(['isactive' => 1]);
		if (!$r) {
			$this->error('将该单位从回收站取出的操作失败，请联系管理员');
		} else {
			$this->success('操作成功，该单位已从回收站取出');
		}
	}

	public function trashlist() {
		$r = Db::name('trcorp')->where('isactive', 0)->select();
		return $r;
	}

	public function trashview() {
		$list = Db::name('trcorp')->where('isactive', 0)->paginate(4);
		$this->assign([
			'list' => $list,
		]);
		return $this->fetch();
	}

}