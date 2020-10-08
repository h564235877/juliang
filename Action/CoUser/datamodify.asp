<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<%
Set Rs= Server.CreateObject("Adodb.RecordSet")
Sql="Select * From CFWztg_User Where UserName='"&CoUserName&"'"
Rs.Open Sql,Conn,1,1
%>

<script>
$(function(){
	
$("#submit").click(function(){
	
if($('#usernick').val()==""){
 alert('请填写呢称', '', function () {$("#usernick").focus();});
 return false;
}

if($('#email').val()==""){
 alert('请填写email地址', '', function () {$("#email").focus();});
 return false;
}

if(!isValidEmail($('#email').val())){
 alert('email地址格式填写不正确', '', function () {$("#email").focus();});
 return false;
}

if($("#pwdanswer").val()==""){
 alert('请填写密码回答答案', '', function () {$("#pwdanswer").focus();});
 return false;
}

});


});
</script>

<form name="form2" method="post" action="../../CoUser.aspx?Action=datamodifysave">
<table class="tb_1">
    <tr class="tr_1"> 
      <td  colspan="2">修改注册资料(带*为必填项）</td>
    </tr>
    <tr> 
      <td width="120" class="td_r">用户名：</td>
      <td><%=Rs("UserName")%></td>
    </tr>
	
    <tr> 
      <td class="td_r">在本系统数字ID：</td>
      <td><%=Rs("ID")%></td>
    </tr>

<tr> 
<td class="td_r">广告代理权限：</td>
<td><%If Rs("AgentPower")=2 Then
Response.write "有"
Else
Response.write "无"
End If%></td>
</tr>


	<tr> 
      <td class="td_r">呢称：</td>
      <td> <input name="usernick" id="usernick" type="text"  value="<%=Rs("usernick")%>"> 
        <font color="#ff0000">*</font></td>
    </tr>
	<tr> 
      <td class="td_r">Email：</td>
      <td> <input name="email" id="email" type="text"  value="<%=Rs("email")%>"> 
        <font color="#ff0000">*</font></td>
    </tr>
    <tr> 
      <td class="td_r">QQ号码：</td>
      <td> <input name="qq" id="qq"type="text" value="<%=Rs("QQ")%>"> 
      </td>
    </tr>
    <tr> 
      <td class="td_r">联系电话：</td>
      <td><input name="phone" id="phone"type="text"  value="<%=Rs("phone")%>"></td>
    </tr>
    
    <tr class="tr_1"> 
      <td colspan="2">请输入验证确认以上修改</td>
    </tr>
    <tr> 
      <td class="td_r">密码提示问题：</td>
      <td><%=Rs("PwdAsk")%></td>
    </tr>
    <tr> 
      <td class="td_r">密码回答答案：</td>
      <td align="left"><input name="pwdanswer" id="pwdanswer" type="text"> 
        <font color="#ff0000">*</font></td>
    </tr>

    <tr> 
      <td>&nbsp;</td>
      <td align="left"><input type="submit" name="submit" id="submit" value="修改" class="btn btn-primary"></td>
    </tr>
</table>
</form>
