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



}



















