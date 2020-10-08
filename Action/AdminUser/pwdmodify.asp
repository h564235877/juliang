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

if($('#pwd').val()==""){
 alert('请填写新密码', '', function () {$("#pwd").focus();});
 return false;
}

if($('#pwd2').val()==""){
 alert('请确认新密码', '', function () {$("#pwd2").focus();});
 return false;
}

if($('#pwd2').val()!=$('#pwd').val()){
 alert('两次填写的密码不一样，请重新填写', '', function () {$("#pwd2").focus();});
 return false;
}

if($("#pwd_old").val()==""){
 alert('请填写原密码', '', function () {$("#pwd_old").focus();});
 return false;
}

});

});
</script>

<form name="form2" method="post" action="../../AdminUser.aspx?Action=pwdmodifysave">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">管理员修改密码</td>
</tr>

<tr> 
<td width="120" class="td_r">管理员：</td>
<td><%=GetStr(Session("CFWztgAdmin"),"AdminUserName")%></td>
</tr>

<tr> 
<td class="td_r">新密码：</td>
<td><input name="pwd" type="password" id="pwd"><font color="#ff0000">*</font></td>
</tr>

<tr> 
<td class="td_r">新密码确认： </td>
<td><input name="pwd2" type="password" id="pwd2"><font color="#ff0000">*</font></td>
</tr>
    
<tr class="tr_1">
<td colspan="2">请输入验证确认以上修改
</td>
</tr>
<tr>
<td class="td_r">请输入原密码：</td>
<td><input name="pwd_old" type="password" id="pwd_old"><font color="#ff0000">*</font></td>
</tr>

<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="submit" id="submit" value="修改" class="btn btn-primary">

</td>

</tr>
</table>
</form>