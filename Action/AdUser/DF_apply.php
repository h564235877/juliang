<?php
error_reporting(0);
header("Content-type: text/html; charset=utf-8");
//以下参数都必须填写
$url = 'https://open.dfpay.com/recharge/apply'; //请求地址，如有变动，请咨询客服
$appId = '1314182054472060929'; //商户号，请咨询客服
$appKey = '5e070cb78fa362e1c8a9660c203b8e11'; //key,请咨询客服
$outOrderNo = '1231233162aa'; //订单号
$amount = '100'; //金额，以元为单位
$notifyUrl = 'https://www.test.com/notifyUrl'; //异步回调地址，不能不填。注意，这里是您的网址！
$timestamp=time();

// 下面的代码不要动
$data = array();
$data['amount'] = $amount;
$data['outOrderNo'] = $outOrderNo;
$data['notifyUrl'] = $notifyUrl;
ksort($data);
$md5str = 'appId=' . $appId . '&timestamp=' . $timestamp;
foreach ($data as $key => $val) {
   $md5str = $md5str . "&" . $key . "=" . $val;
}
$md5str = $md5str . "&" . 'appKey=' . $appKey;
$headers = array();
array_push($headers,"appId:".$appId);
array_push($headers,"timestamp:".$timestamp);
array_push($headers,"sign:".md5($md5str));
$res = request_post($url, $data, $headers);
echo $res;
$json_res = json_decode($res, true);
if($json_res !=null && $json_res['code'] == 0){
	echo $json_res['data'];
    exit;
}else{
    echo $json_res['msg'];
    exit;
}

function request_post($url = '', $post_data = array(),$headers = array()) {

    if (empty($url) || empty($post_data)) {
        return false;
    }
	array_push($headers,"Content-Type: application/json");
    $postUrl = $url;
    $ch = curl_init();//初始化curl
    curl_setopt($ch, CURLOPT_URL, $postUrl);
    curl_setopt($ch, CURLOPT_HEADER, 0);
	curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_TIMEOUT, 30);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($post_data));

    $data = curl_exec($ch);//运行curl
    curl_close($ch);

    return $data;
}
?>