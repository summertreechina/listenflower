<?php
namespace app\Toren\controller;
use think\Controller;
use app\Common\Model\AskModel;
use app\Common\Model\AnsModel;

class IndexController extends Controller
{
// 同人试题
    public function index() {
      return $this->fetch();
    }

// 
    public function addQueAc() {
    	$obj = input('post.');
    	$data = [
    		'content' => $obj['askContent']['cont'],
    		'status' => 1,
    		'explain' => '解题说明',
    		'author' => '那个谁'
    	];
        $askModel = new askModel();
        $isExist = $askModel->QuestionIsExist($data['content']);
        if ($isExist) {
            return json(['status' => '0', 'info' => '题目已经提交过']);
        } else {
        	$id = model('Ask')->addQuestion($data);
        }

    	if ($id) {
            foreach ($obj['ansList'] as $v) {
                $AnsModel = new AnsModel();
                $isRight = $v['isRight'] || 0;
                $content = [
                    'content' => $v['ans'],
                    'ask_id' => $id,
                    'isRight' => $isRight
                ];
                $r = $AnsModel->addAnswers($content);
            }
    	}
        return json(['status' => '1', 'info' => '成功']);
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