<?php
namespace app\Toren\controller;
use think\Controller;

class IndexController extends Controller
{
		// 后台首页
    public function index() {
      return $this->fetch();
    }

    public function addQueAc() {
    	$obj = input('post.data');
    	// print_r($obj);die;
    	$data = [
    		'content' => '盲人摸象，关键是不知道input(post.data)得到的什么',
    		'status' => 1,
    		'explain' => '解题说明',
    		'author' => '那个谁'
    	];
    	// return json_encode($data);
    	return model('Ask')->addQuestion($data);

    }

    public function showQueAc($id) {

    }

    public function QueListAc() {

    }

    public function editQueAc() {

    }

    public function softDelQueAc() {

    }


    
}