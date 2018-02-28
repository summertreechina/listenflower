<?php
namespace app\TorenAdmin\controller;
use think\Db;
use think\Controller;
use app\Common\Controller\AuthController;

/**
* 后台公司管理页
*/
class CorpController extends AuthController
{
	
	/**
	 * 公司列表页视图
	 * @return [type] [description]
	 */
	public function index() {
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
		print_r($data);
		$corpinfo = [
			'corpname' => $data['corpname'],
			'nickname' => $data['nickname'],
			'address' => $data['address'],
			'corpuser' => $data['corpuser'],
			'contact' => $data['contact'],
			'other' => $data['other'],
			'uppercorpid' => $data['uppercorp'],
			'create_time' => time(),
		];
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

	public function showacorp($id = 1) {
		return $this->fetch();

	}




}