<?php
namespace app\Toren\controller;

use think\Db;
use think\Controller;


class ExamController extends Controller
{
    /**
     * 考试页视图
     * @return [type] [description]
     */
    public function index() {
        return $this->fetch();
    }

    // 客户端通过ajax方法获得今日试题
    public function getQuestions() {
        // 因为mysql的join漏洞，所以采取这样麻烦且莫名其妙的办法，真能编啊
        // $list1 = Db::name('trcart')->whereTime('create_time', 'yesterday')->column('item');
        $list1 = Db::name('trcart')->whereTime('create_time', 'today')->column('item');
        // $list2 = Db::name('troldcart')->whereTime('create_time', 'yesterday')->column('item');
        $list2 = Db::name('troldcart')->whereTime('create_time', 'today')->column('item');
        $list = array_merge($list1, $list2);

        if (empty($list)) {
            return json(['msg'=>'管理员昨天懒癌发作了，没有出题。今天全员满分。']);
        }

        $asklist = array();
        foreach ($list as $k => $v) {
            $ask = Db::name('ask')->field('content, explain, author')->where('id', $v)->find();
            $asklist[$k]['id'] = $v;
            $asklist[$k]['content'] = $ask['content'];
            $asklist[$k]['explain'] = $ask['explain'];
            $asklist[$k]['author'] = $ask['author'];

            $asklist[$k]['answerList'] = Db::name('ans')->field('content')->where('ask_id', $v)->select();
        }

        return json($asklist);
    }

    /**
     * 保存某位的用户的分数
     * @return [type] [description]
     */
    public function saveScore() {
        $uid = input('post.uid/d');
        $score = input('post.score/d');
        $data = array(
            'user_id' => $uid,
            'score' => $score,
            'create_time' => time(),
        );
        $r = Db::name('truserscore')->insert($data);
        return json($r);
    }

    /**
     * 获得今日某位用户的最高分
     * @return [type] [description]
     */
    public function getMaxScore() {
        $uid = input('post.uid/d');
        $r = Db::name('truserscore')
                ->where('uid', $uid)
                ->whereTime('create_time', 'today')
                ->max('score');

        $this->update_max_score($uid, $r);

        return json($r);
    }

    /**
     * 优化存储最高分存储
     * @param  [int] $uid   [用户ID]
     * @param  [int] $score [最高分]
     * @return [type]        [description]
     */
    private function update_max_score($uid, $score) {
        $today_score = Db::name('trmaxscore')
            ->where('uid', $uid)
            ->whereTime('create_time', 'today')
            ->select();
        if (!$today_score) {
            $data = [
                'user_id' => $uid,
                'maxscore' => $score,
                'create_time' => time(),
            ];
            $r = Db::name('trmaxscore')->insert($data);
            if (!$r) {
                exit('maxscore存入发生错误');
            }
        } else {
            $r = Db::name('trmaxscore')
                ->where('id', $today_score['id'])
                ->update([
                    'maxscore' => $score,
                    'create_time' => time(),
                ]);

            if (!$r) {
                exit('maxscore更新时发生错误');
            }
        }
    }

    




}



















