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

<form name="form2" method="post" action="../../User.aspx?Action=gbookaddsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1"><tr class="tr_1"> 
<td colspan="2">提问</td>
</tr>
<tr>
<td width="80" class="td_r">提问内容：</td>
<td><textarea name="Content" cols="60" rows="7" id="Content"></textarea></td>
</tr>
<tr>
<td></td>
<td>
<input type="submit" name="submit" id="submit" value="提问" class="btn btn-primary">
</td>
</tr>
</table>
</form>