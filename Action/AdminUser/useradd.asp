<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<script>
$(function(){
	
$("#userreg").click(function(){

if($('#username').val()==""){
 alert('请填写用户名', '', function () {$("#username").focus();});
 return false;
}

if(!chkname($('#username').val())){
 alert('用户名不规则', '', function () {$("#username").focus();});
 return false;
}

if($('#pwd').val()==""){
 alert('请填写密码', '', function () {$("#pwd").focus();});
 return false;
}


});


});

</script>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form name="form2" method="post" action="../../AdminUser.aspx?Action=useraddsave&ID=<%=ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">网站主新增</td>
</tr>
<tr>
<td width="120" class="td_r">网站主用户名：</td>
<td><input name="username" type="text" id="username">*(必须为小写字母、数字或下划线)</td>
</tr>
<tr>
<td class="td_r">网站主密码：</td>
<td><input name="pwd" type="password" id="pwd" STYLE="ime-mode:inactive;">*</td>
</tr>
<td></td>
<td>
<input type="submit" name="userreg" id="userreg" value="新增" class="btn btn-primary">
</td>
</tr>
</table>
</form>