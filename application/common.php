<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件


//	超级打印 
function P($var, $isDump = true, $break = true){
	$print = $isDump ? 'var_dump' : 'print_r';
	if (empty($var)) {
		echo 'null';
		if ($break) {
			// die;
		}
	} else if (is_array($var) || is_object($var)) {
		echo '<pre style="color:#4CAF50">';
		$print($var);
		echo '</pre>';
		if ($break) {
			// die;
		}
	} else {
		var_dump($var);
		if ($break) {
			// die;
		}
	}
}

// 
function status($status) {
	switch ($status) {
		case '1':
			$str = '<span class="label label-success radius">正常</span>';
			break;
		case '0':
			$str = '<span class="label label-danger radius">等待审核</span>';
			break;
		case '-1':
			$str = '<span class="label label-danger radius">删除</span>';
			break;
		default:
			$str = '<span class="label label-info radius">请检查</span>';
			break;
	}

	return $str;
}

/**
 * [获取url中的内容]
 * @param  [type]  $url  [description]
 * @param  integer $type [0 get, 1 post]
 * @param  array   $data [description]
 * @return [type]        [description]
 */
function doCurl($url, $type=0, $data=[]) {
	$ch = curl_init();	// 初始化
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_HEADER, 0);

	if ($type == 1) {
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
	}

	$output = curl_exec($ch);

	curl_close($ch);
	
	return $output;
}

// 商户入驻申请的文案
// 晕的很，老师的函数名称很马虎 
function bisRegister() {
	switch ($status) {
		case '1':
			$str = '入驻申请成功';
			break;
		case '0':
			$str = '审核通过后将以邮件的形式通知您，请关注您的邮件';
			break;
		case '2':
			$str = '抱歉，您提交的材料审核未通过';
			break;
		default:
			$str = '该审核材料已经被删除';
			break;
	}

	return $str;
}

/**
 * 通用的分页样式
 * @param $obj
 */
function pagination($obj) {
    if(!$obj) {
        return '';
    }
    // 优化的方案
    $params = request()->param();
    return '<div class="cl pd-5 bg-1 bk-gray mt-20 tp5-o2o">'.$obj->appends($params)->render().'</div>';

    // 在模版中的调用方式
    // '{:pagination($bis)}'
}




