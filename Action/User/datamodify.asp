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
Sql="Select * From CFWztg_User Where UserName='"&UserName&"'"
Rs.Open Sql,Conn,1,1%>

<script>
$(function(){
	
$("#submit").click(function(){

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

<form name="form2" method="post" action="../../User.aspx?Action=datamodifysave">
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
      <td  colspan="2">选择您的客服专员</td>
    </tr>
<tr> 
      <td class="td_r">您的客服专员：</td>
      <td>
<%
Sql="Select UserNick,QQ From CFWztg_User where UserType=3 And UserState=1 And UserName='"&Rs("UpUserName")&"'"
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
If Not Rs2.Eof Then
 Response.write Rs2("UserNick")
 Response.write "，QQ:"&Rs2("QQ")&"&nbsp;<a target='_blank' href='http://wpa.qq.com/msgrd?v=3&uin="&Rs2("QQ")&"&site=qq&menu=yes'><img border='0'  src='../../images/qqonline2.gif' alt='点击这里给我发消息' title='点击这里给我发消息'></a>"
Else
'--选择的客服专员失效时或为空时
Response.write "<select name='UpUserName' id='UpUserName'>"
Response.write "<option value=''"
If Rs("UpUserName")="" Then Response.write " selected"
Response.write ">暂时不选择客服专员</option>"


Sql="Select UserName,UserNick,QQ From CFWztg_User where UserType=3 And UserState=1"
Set Rs3 = Server.CreateObject("ADODB.Recordset")
Rs3.open Sql,Conn,1,1
While Not Rs3.Eof

Response.write "<option value='"&Rs3("UserName")&"'"


Response.write ">"&Rs3("UserNick")&"|QQ:"&Rs3("QQ")&"</option>"

Rs3.MoveNext
Wend
Response.write "</select>"
Rs3.Close

End If

Rs2.Close
%>
</td>
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
