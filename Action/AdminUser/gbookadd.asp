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
	
$("#submit").click(function(){

if($('#Content').val()==""){
 alert('请填写提问内容', '', function () {$("#Content").focus();});
 return false;
}

});

});
</script>

<a href="?Action=gbooklist" class="actionBtn" style="margin-top:10px;"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form name="form2" method="post" action="../../AdminUser.aspx?Action=gbookaddsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1"><tr class="tr_1"> 
<td colspan="2">给网站主留言提醒</td>
</tr>
  <tr>
    <td class="td_r">给哪个网站主提醒:</td>
    <td><input name="UserName" type="text" id="UserName" value="">(填写用户名)</td>
  </tr>
  <tr>
<td width="140" class="td_r">留言提醒内容：</td>
<td><textarea name="Reply" cols="60" rows="7" id="Reply"></textarea></td>
</tr>
<tr>
<td></td>
<td>
<input type="submit" name="submit" id="submit" value="留言提醒" class="btn btn-primary">(此留言内容会直接显示在网站主登录)
</td>
</tr>
</table>
</form>