<?php
namespace app\Toren\controller;
use think\Controller;
use app\Common\Model\AskModel;
use app\Common\Model\AnsModel;
use app\Common\Model\TRTomorrowModel;

class IndexController extends Controller
{
// 同人试题
    public function index() {
      return $this->fetch();
    }

// 添加题目和答案
    // public function addQueAc() {
    // 	$obj = input('post.');
    // 	$data = [
    // 		'content' => $obj['askContent']['cont'],
    // 		'status' => 1,
    // 		'explain' => $obj['explain'],
    // 		'author' => $obj['author']
    // 	];

    //     $askModel = new askModel();
    //     $isExist = $askModel->QuestionIsExist($data['content']);
    //     if ($isExist) {
    //         return json(['status' => '0', 'info' => '题目已经提交过']);
    //     } else {
    //     	$id = model('Ask')->addQuestion($data);
    //     }

    // 	if ($id) {
    //         foreach ($obj['ansList'] as $v) {
    //             $AnsModel = new AnsModel();
    //             $isRight = $v['isRight'] || 0;
    //             $content = [
    //                 'content' => $v['ans'],
    //                 'ask_id' => $id,
    //                 'isRight' => $isRight
    //             ];
    //             $r = $AnsModel->addAnswers($content);
    //         }
    // 	}
    //     return json(['status' => '1', 'info' => '提交成功']);
    // }

// 显示一个试题
    // public function showQuestion() {
    //     $questionId = input('get.id/d');
    //     $questionId = 2;
    //     $question = model('Ask')->getQuestion($questionId);
    //     $ansList = model('Ans')->getAnswers($questionId);

    //     $this->assign('question', $question);
    //     $this->assign('ansList', $ansList);

    //     return $this->fetch();
    // }

// 考试页显示
    public function exam() {
       return $this->fetch();
    }

// 存入每日试题
    // $how 时间调节 1今天 0昨天 2明天 3后天...
    // public function tomorrow($how=1) {
    //     $data = input('post.', '', 'strip_tags,htmlspecialchars');
    //     $checked = $data['checkedList'];
    //     $tomorrow = new TRTomorrowModel;
    //     $res = $tomorrow->save([
    //         'items' => $checked,
    //         'use_time' => date('Y-m-d', (time() + 60*60*24*$how))
    //     ]);
    //     // echo $tomorrow->use_time;
    //     if ($res) {
    //         $msg = ['res'=> true, 'info'=>'题目已经放入明日题库！'];
    //     } else {
    //         $msg = ['res'=> false, 'info'=>'数据保存失败，请联系管理员'];
    //     }
    //     return json($msg);
    // }

// 从后台取得今日试题(返回试题ID)
    // public function todayQuestions($timestamp) {

    //     $tomorrow = new TRTomorrowModel;
    //     $todayQuestions = $tomorrow->getToday($timestamp);
    //     return $todayQuestions;
    // }
// 客户端通过ajax方法获得今日试题
    // public function getQuestions() {
    //     $timestamp = input('get.timestamp/d');
    //     $questions = $this->todayQuestions($timestamp);
    //     if (!$questions) {
    //         return json(['msg'=>'昨天管理员懒癌发作了，没有出题。今天全员满分。']);
    //     }

    //     $allQeustion = array();
    //     foreach ($questions as $k => $v) {
    //         $askModel = new askModel();
    //         $ansModel = new ansModel();
    //         $question = $askModel->getQuestion($v);
    //         $allQeustion[$k]['id'] = $v;
    //         $allQeustion[$k]['content'] = $question['content'];
    //         $allQeustion[$k]['explain'] = $question['explain'];
    //         $allQeustion[$k]['author'] = $question['author'];
    //         $answerList = $ansModel->getAnswers($v);
    //         // 在这里偷懒了😂
    //         $allQeustion[$k]['answerList'] = $answerList;
    //     }
    //     return json($allQeustion);
    // }

// 
    public function checkIsRight() {
        $data = input('post.');
        $msg = '';
        $AnsList =  model('Ans')->getRightAnswers($data['id']);

        if ($data['checkedAnswers'] == $AnsList) {
            // 初检
            $msg = 'right';
            return json($msg);
        } else {
            // 碰撞检测
            $num = count($AnsList);
            $count = 0;
            foreach ($data['checkedAnswers'] as $v) {
                if (in_array($v, $AnsList)) {
                    $count++;
                } else {
                    $msg = 'mistake';
                    return json($msg);
                }
            }
            if ($num === $count) {
                $msg = 'right';
                return json($msg);
            } else {
                $msg = 'mistake';
                return json($msg);
            }
        }
    }

// 显示所有试题
    // 因为每天所有人都是做这几道题，所以将来需要把它放在缓存里，降低服务器的计算量
    public function QuestionList() {
        return $this->fetch();
    }

    public function list() {
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
// 用户登录
    public function login() {
        if (request()->isAjax()) {
            return json('非法访问');
        }
        $data['mobile'] = input('post.mobile/d');
        $data['password'] = md5(input('post.password/s'));

        $user = model('Truser')->getByMobile($data['mobile']);
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
    public function logout() {
        session(null, 'Toren');
        return json(true);
    }

    public function isLogin() {
        $user = $this->getLoginUser();
        if ($user && $user['id']) {
            return json($user);
        }
        return json(null);
    }

    // private
    private function getLoginUser() {
        $account = session('TRUser', '', 'Toren');
        return $account;
    }

    public function saveScore() {
        $uid = input('post.uid/d');
        $score = input('post.score/d');
        $data = array(
            'user_id' => $uid,
            'score' => $score
        );
        // return json($data);
        $r = model('TRUserScore')->add($data);
        return json($r);
    }

    public function getMaxScore() {
        $uid = input('post.uid/d');
        $r = model('TRUserScore')->maxScore($uid);
        return json($r);
    }



}



















