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
// 显示一个试题
    public function showQuestion() {
        $questionId = input('get.id/d');
        $questionId = 2;
        $question = model('Ask')->getQuestion($questionId);
        $ansList = model('Ans')->getAnswers($questionId);

        $this->assign('question', $question);
        $this->assign('ansList', $ansList);

        return $this->fetch();
    }
// 考试页显示
    public function exam() {
       return $this->fetch();
    }
// 从后台取得今日试题(返回试题ID)
    public function todayQuestions() {
        $todayQuestions = array(1,2,3,4,5);
        // $todayQuestions = array(1,2);
        return $todayQuestions;
    }
// 客户端通过ajax方法获得今日试题
    public function getQuestions() {
        $questions = $this->todayQuestions();
        $allQeustion = array();
        foreach ($questions as $k => $v) {
            $askModel = new askModel();
            $ansModel = new ansModel();
            $question = $askModel->getQuestion($v);
            $allQeustion[$k]['id'] = $v;
            $allQeustion[$k]['content'] = $question['content'];
            $allQeustion[$k]['explain'] = $question['explain'];
            $allQeustion[$k]['author'] = $question['author'];
            $answerList = $ansModel->getAnswers($v);
            // 在这里偷懒了😂
            $allQeustion[$k]['answerList'] = $answerList;
        }
        return json($allQeustion);
    }
    public function checkIsRight() {
        $data = input('post.');
        return json($data);
    }

// 显示所有试题
    public function QuestionList() {
        return $this->fetch();
    }
    public function getAllQuestion() {
        $list = model('ask')->getAll();
        return json($list);
    }
// 编辑试题
    public function editQuestion() {

    }
// 软删除试题
    public function softDelQuestion() {

    }


    
}