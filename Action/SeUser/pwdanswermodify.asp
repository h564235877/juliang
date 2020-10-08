<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<%Set Rs= Server.CreateObject("Adodb.RecordSet")
Sql="Select * From CFWztg_User Where UserName='"&SeUserName&"'"
Rs.Open Sql,Conn,1,1%>

<script>
$(function(){
	
$("#submit").click(function(){

if($('#pwdask_new').val()==""){
 alert('请填写新密码提示问题', '', function () {$("#pwdask_new").focus();});
 return false;
}

if($('#pwdanswer_new').val()==""){
 alert('请填写新密码回答答案', '', function () {$("#pwdanswer_new").focus();});
 return false;
}

if($("#pwdanswer_old").val()==""){
 alert('请填写原密码回答答案', '', function () {$("#pwdanswer_old").focus();});
 return false;
}

});

});
</script>

<form name="form3" method="post" action="../../SeUser.aspx?Action=pwdanswermodifysave">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">修改密码提示和答案(带*为必填项）</td>
</tr>


<tr> 
<td class="td_r">新密码提示问题：</td>
<td>
<input name="pwdask_new" type="text" id="pwdask_new">
<font color="#ff0000">*</font></td>
</tr>
<tr> 
<td class="td_r">新密码回答答案：</td>
<td>
<input name="pwdanswer_new" type="text" id="pwdanswer_new">
<font color="#ff0000">*</font></td>
</tr>

<tr class="tr_1">
<td colspan="2">请输入验证确认以上修改
</td>
</tr>
<tr> 
<td width="120" class="td_r">原密码提示问题：</td>
<td><%=Rs("pwdask")%></td>
</tr>
<tr> 
<td class="td_r">原密码回答答案：</td>
<td><input name="pwdanswer_old" type="text" id="pwdanswer_old">
<font color="#ff0000">*</font></td>
</tr>

<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="submit" id="submit" value="修改" class="btn btn-primary">
　 <a href="../../SeUser.aspx?Action=pwdanswersend" target="_blank"><font color="#0000FF">发到我的Email修改</font></a> (注：如果忘记原密码回答答案可发送到自己的Email内修改)</td>
</tr>
</table>
</form>