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

if($("#pwdanswer").val()==""){
 alert('请填写密码回答答案', '', function () {$("#pwdanswer").focus();});
 return false;
}

});

});
</script>

<form name="form2" method="post" action="../../User.aspx?Action=aduserbindmodifysave">
<table class="tb_1">
<tr class="tr_1"> 
      <td colspan="2">绑定广告主</td>
    </tr>
    <tr> 
      <td class="td_r">广告主用户名：</td>
      <td><input name="adusername" id="adusername" type="text"  value="<%=Rs("BindUserName")%>">
不绑定请把广告主的用户项留空，绑定后可以把资金此转入广告主用户名下发布自己的广告</td>
    </tr>
    <tr>
      <td class="td_r">广告主密码：</td>
      <td><input name="aduser_password" id="aduser_password" type="password"></td>
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