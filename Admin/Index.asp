<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>
<!--#Include File="../Conn.asp"-->
<!--#Include File="../Include/MyFunction.asp"-->
<!--#Include File="../Include/Md5.asp"-->
<!--#Include File="../Include/GetCookie.asp"-->
<%
Action=ChkStr(Request("Action"),1)
%>
<!--#Include File="../Include/CF_Do.asp"-->
<%
If Session("CFWztgAdmin")<>"" Then Response.Redirect "../"&AdminUserManagePath
%>

<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="gbk">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title><%=SysTitle%> | 管理员登录</title>
<link rel="icon" href="../images/favicon.ico" type="image/ico">
<link rel="stylesheet" href="../css/BeAlert.css">
<script src="../js/jquery.min.js"></script>
<script src="../js/BeAlert.js"></script>
<script>
$(function(){
	
 $("#ccimg").click(function(){
  $("#ccimg").prop('src',"../include/checkcode.asp?ranstr=" + Math.random());
 });

 $("#submit").click(function(){
  var adminusername = $("#adminusername").val();
  var pwd = $("#pwd").val();
  var checkcode = $("#checkcode").val();

 if(adminusername==""||adminusername=="用户名"){
  alert('请输入管理员名称', '', function () {$("#adminusername").focus();});
  return false;
 }

 if(pwd==""||pwd=="密码"){
  alert('请输入管理员密码', '', function () {$("#pwd").focus();});
  return false;
 }
 
 if(checkcode==""||checkcode=="验证码"){
  alert('请输入验证码', '', function () {$("#checkcode").focus();});
  return false;
 }
 
 });
});
</script>


<style type="text/css">
* { font: 13px/1.5 '微软雅黑'; -webkit-box-sizing: border-box; -moz-box-sizing: border-box; -box-sizing: border-box; padding:0; margin:0; list-style:none; box-sizing: border-box; }
body, html { height:100%; overflow:hidden; }
body { background:#93defe; background-size: cover; }
a { color:#27A9E3; text-decoration:none; cursor:pointer; }
img{ border:none;}

.login_box{ width:400px; margin:60px auto 0;}
.login_box .login_l_img{ float:left; width:432px; height:440px; margin-left:50px;}
.login_box .login_l_img img{width:500px; height:440px; }
.login {height:440px; width:400px; padding:50px; background-color: #ffffff;border-radius:6px;box-sizing: border-box; float:right; margin-right:50px; position:relative; margin-top:50px;}
.login_logo{ width:120px; height:120px; border:5px solid #93defe;border-radius:100px; background:#fff; text-align:center; line-height:110px; position:absolute; top:-60px; right:140px;}
.login_name{ width:100%; float:left; text-align:center; margin-top:20px;}
.login_name a{color:#444;font-size: 18px;}
.login_name p{ width:100%; text-align:center; font-size:18px; color:#444; padding:10px 0 20px;}
.login_logo img{ width:60px; height:60px;display: inline-block; vertical-align: middle;}
input[type=text], input[type=file], input[type=password], input[type=email], select { border: 1px solid #DCDEE0; vertical-align: middle; border-radius: 3px; height: 50px; padding: 0px 16px; font-size: 14px; color: #555555; outline:none; width:100%;margin-bottom: 15px;line-height:50px; color:#888;}
input[type=text]:focus, input[type=file]:focus, input[type=password]:focus, input[type=email]:focus, select:focus { border: 1px solid #27A9E3; }
input[type=submit], input[type=button] { display: inline-block; vertical-align: middle; padding: 12px 24px; margin: 0px; font-size:16px; line-height: 24px; text-align: center; white-space: nowrap; vertical-align: middle; cursor: pointer; color: #ffffff; background-color: #27A9E3; border-radius: 3px; border: none; -webkit-appearance: none; outline:none; width:100%; }
.copyright { font-size:14px; color:#fff; display:block;width:100%; float:left; text-align:center; margin-top:60px;}


.adminusername{
    border: 1px #ddd solid;
    border-radius: 4px;
    width: 300px;
    height: 52px;
    line-height: 38px;
    position: relative;
    background: #fff;
	float:left;	
}
.adminusername i {
    background: url(../images/username_bg.png) no-repeat;
    display: block;
    width: 24px;
    height: 24px;
    position: absolute;
    left: 5px;
    top: 10px;
}
#adminusername{border: 0;width: 278px;margin-left:20px;}

.pwd{
    border: 1px #ddd solid;
    border-radius: 4px;
    width: 300px;
    height: 52px;
    line-height: 38px;
    position: relative;
    background: #fff;
	float:left;	
	margin-top:15px;
}
.pwd i {
    background: url(../images/password_bg.png) no-repeat;
    display: block;
    width: 24px;
    height: 24px;
    position: absolute;
    left: 5px;
    top: 10px;
}
#pwd{border: 0;width: 278px;margin-left:20px;}


.checkcode{
    border: 1px #ddd solid;
    border-radius: 4px;
    width: 150px;
    height: 52px;
    line-height: 38px;
    position: relative;
    background: #fff;
	float:left;	
	margin-top:15px;
}
.checkcode i {
    background: url(../images/yzm_bg.png) no-repeat;
    display: block;
    width: 24px;
    height: 24px;
    position: absolute;
    left: 5px;
    top: 10px;
}
#checkcode{border: 0;width: 118px;display:block;margin-left:20px;}
</style>


</head>

<body>
<div class="login_box">
      <div class="login">
          <div class="login_logo"><img src="../images/admin_loginlogo.png" /></div>
          <div class="login_name">
               <p><a href="../"><%=SysTitle%></a> | 管理员登录</p>
          </div>
<form name="form1" method="post" action="?Action=adminlogin">

<div class="adminusername">
<i></i>
<input name="adminusername" id="adminusername" type="text" value="" placeholder="登录账号">
</div>

<div class="pwd">
<i></i>		
<input name="pwd" id="pwd"  type="password" value="" placeholder="登录密码">
</div>


<div class="checkcode">
<i></i>	
<input name="checkcode" id="checkcode" type="text"  value="" placeholder="验证码">
</div>
<%
Response.write "<a href='javascript:;'><IMG id='ccimg' src='../include/CheckCode.asp?RanStr="&DateDiff("s","1970-1-1",now)&"' border='0' title='看不清楚？换一个！' style='margin-left:10px;margin-top:20px;width:80px;height:40px;'></a>"
%>

<div style="width:100%;margin-top:10px;margin-bottom:10px;clear:both;">		 
<input name="cookies_time" type="checkbox" id="cookies_time" style="width: 25px; vertical-align: middle" value="43200">
<label for="remember" style="font-size: 14px">记住我</label>
</div>


<input value="登录" style="width:100%;" type="submit" name="submit" id="submit">
</form>

</div>

</div>



</body>
</html>
