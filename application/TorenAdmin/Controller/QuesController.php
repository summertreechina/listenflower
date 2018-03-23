<?php
namespace app\TorenAdmin\controller;

use think\Db;
use think\Controller;
use app\Common\Model\AnsModel;
use app\Common\Controller\AuthController;

class QuesController extends AuthController
{
    // 旧题购物车是否清空
    private $isemptyoldcart = false;

    protected function _initialize() {
        $this->emptyoldcart();
    }

    // +----------------------------------------------------------------------
    // | 视图区
    // +----------------------------------------------------------------------

    /**
     * 后台所有试题列表
     * @return [type] [description]
     * 还要查询出哪些题放入了明日考试题库
     */
    public function index() {
        $list = Db::table('nn_ask')
                    ->join('nn_trcart', 'nn_ask.id = nn_trcart.item', 'left')
                    ->field( 'nn_ask.id, item, content, author' )
                    ->where('status', 1)
                    ->paginate(8); 
                    // ->select();->fetchSql()
                    // `content`,->fetchSql()
                    // print_r($list);
                    // exit();

        $this->assign([
            'list' => $list,
        ]);
        return $this->fetch();
    }

    /**
     * 将试题加入明日题库
     * @return [type] [description]
     */
    public function addcart($id) {
        if (!$this->isemptyoldcart) {
            $this->emptyoldcart();
        }

        $id = intval($id);
        $isset = Db::name('trcart')
                    ->whereTime('create_time', 'today')
                    ->where('item', $id)
                    ->find();
        if ($isset) {
            $this->error('加入失败，本试题已经存在明日题库中');
        } else {
            $data = [
                'item' => $id,
                'create_time' => time(),
            ];

            $r = Db::name('trcart')->insertGetId($data);
            if ($r) {
                $this->success('操作成功，已加入明日题库');
            } else {
                $this->error('加入失败，请联系管理员');
            }
        }
    }

    /**
     * 将某试题从明日题库中移出
     * @param  integer $id [description]
     * @return [type]      [description]
     */
    public function outcart($id) {
        $id = intval($id);
        $r = Db::name('trcart')->where('item', $id)->delete();
        if ($r) {
            $this->success('操作成功，已从题库中移出');
        } else {
            $this->error('移出失败，请联系管理员');
        }
    }

    /**
     * 显示某个试题
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    Public function showone($id) {
        $id = intval($id);
        $ask = Db::name('ask')->where('id', $id)->find();
        $anslist = Db::name('ans')->where('ask_id', $id)->select();

        $this->assign([
            'ask' => $ask,
            'anslist' => $anslist,
        ]);
        return $this->fetch();
    }

    /**
     * 清除购物车中今天之前的内容 旧内容转移到旧购物车中
     * 各项操作完成后将isemptyoldcart赋值为true
     * @return [type] [description]
     */
    private function emptyoldcart() {
        // 删除之前将内容存储到另一张表中
        $oldcart = Db::name('trcart')
            ->field('item, create_time')
            ->whereTime('create_time', '<', 'today')
            ->select();
        $r = Db::name('troldcart')
            ->insertAll($oldcart);

        $re = Db::name('trcart')
            ->whereTime('create_time', '<', 'today')
            ->delete();

        if ($re) {
            $this->isemptyoldcart = true;
            return true;
        }
    }



    /**
     * 后台明日题库图视
     * @return [type] [description]
     */
    Public function cartlist() {

        $list = Db::table('nn_ask')
                 ->join('nn_trcart', 'nn_ask.id = nn_trcart.item')
                 ->field( 'nn_ask.id, item, content, author' )
                 ->where('status', 1)
                 ->paginate(20); 
        $count = Db::name('trcart')->count();

        $this->assign([
            'list' => $list,
            'count' => $count,
        ]);
        return $this->fetch();
    }

    /**
     * 后台录入试题视图
     * @return [type] [description]
     */
    public function add() {
        return $this->fetch();
    }

    /**
     * 后台录入试题操作
     * @return [type] [description]
     */
    public function addask() {
        $rawdata = input('post.');

        // TP报错未定义索引'askContent' 莫名其妙 但不影响程序继续执行
        $data = [
            'content' => $rawdata['askContent']['cont'],
            'status' => 1,
            'explain' => $rawdata['explain'],
            'author' => $rawdata['author'],
            'create_time' => time(),
        ];

        $isExist = DB::name('ask')->where('content', $data['content'])->find();

        if ($isExist) {
            return json(['status' => '0', 'info' => '题目已经提交过']);
        } else {
            $id = Db::name('ask')->insertGetId($data);
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

        return json(['status' => '1', 'info' => '提交成功']);
    }



}