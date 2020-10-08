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
Sql="Select bindusername,PwdAsk From CFWztg_User Where UserName='"&SeUserName&"'"
Rs.Open Sql,Conn,1,1%>

<script>
$(function(){
	
$("#submit").click(function(){
	
if($("#bindusername").val()==""&&$("#couser_pwd").val()!=""){
 alert('请填写商务名称', '', function () {$("#bindusername").focus();});
 return false;
}

if($("#bindusername").val()!=""&&$("#couser_pwd").val()==""){
 alert('请填写商务密码', '', function () {$("#couser_pwd").focus();});
 return false;
}

if($("#pwdanswer").val()==""){
 alert('请填写密码回答答案', '', function () {$("#pwdanswer").focus();});
 return false;
}

});

});
</script>

<form name="form2" method="post" action="../../SeUser.aspx?Action=bindusermodifysave">
<table class="tb_1">
<tr class="tr_1"> 
      <td colspan="2">关联商务</td>
    </tr>
    <tr> 
      <td class="td_r" width="150">商务名：</td>
      <td><input name="bindusername" id="bindusername" type="text"  value="<%=Rs("bindusername")%>">(取消关联留空，关联后客服的推广链接推广网站主的同时可推广告主，广告主记录在此商务名下)</td>
    </tr>
    <tr>
      <td class="td_r">商务密码：</td>
      <td><input name="couser_pwd" id="couser_pwd" type="password"></td>
    </tr>
    <tr class="tr_1"> 
      <td colspan="2">请输入验证确认以上修改</td>
    </tr>
    <tr> 
      <td class="td_r">客服的密码提示问题：</td>
      <td><%=Rs("PwdAsk")%></td>
    </tr>
    <tr> 
      <td class="td_r">客服的密码回答答案：</td>
      <td align="left"><input name="pwdanswer" id="pwdanswer" type="text"> 
        <font color="#ff0000">*</font></td>
    </tr>
	<tr> 
      <td>&nbsp;</td>
      <td align="left"><input type="submit" name="submit" id="submit" value="修改" class="btn btn-primary"></td>
    </tr>
</table>
</form>
<%Rs.Close%>