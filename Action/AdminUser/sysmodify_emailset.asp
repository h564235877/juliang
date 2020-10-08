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


if($('#EmailSendPort').val()==""){
 alert('请填写发送邮件的服务器端口', '', function () {$("#EmailSendPort").focus();});
 return false;
}
if($('#EmailServerAddress').val()==""){
 alert('请填写发送邮件的服务器地址', '', function () {$("#EmailServerAddress").focus();});
 return false;
}
if($('#EmailUser').val()==""){
 alert('请填写发送邮件的Email地址', '', function () {$("#EmailUser").focus();});
 return false;
}
if(!isValidEmail($('#EmailUser').val())){
 alert('发送邮件的Email地址格式填写不正确', '', function () {$("#EmailUser").focus();});
 return false;
}
if($('#EmailPassword').val()==""){
 alert('请填写发送邮件的Email密码', '', function () {$("#EmailPassword").focus();});
 return false;
}

if($('#EmailAdmin').val()==""){
 alert('请填写管理员收信的Email地址', '', function () {$("#EmailAdmin").focus();});
 return false;
}
if(!isValidEmail($('#EmailAdmin').val())){
 alert('管理员收信的Email地址格式填写不正确', '', function () {$("#EmailAdmin").focus();});
 return false;
}

});


$("#emailallopen").click(function(){
 $("input[name^='Email_'][value='1']").prop("checked", "checked");
});


$("#emailallclose").click(function(){
 $("input[name^='Email_'][value='0']").prop("checked", "checked");
});


});


</script> 

<table class="tb_1">
<form name="form2" method="post" action="../../AdminUser.aspx?Action=sysmodifysave&Label=<%=Label%>">
<tr class="tr_1"> 
<td colspan="2">邮件发送组件设置</td>
</tr>

<tr> 
<td width="180" class="td_r">发送邮件组件：</td>
<td>
<input type="radio" name="emailsendtype" id="emailsendtype_1"  value="1"<%if rs("emailsendtype")=1 then Response.write " checked"%>>
ASP.NET自带组件(不需安装,推荐使用)
<input type="radio" name="emailsendtype" id="emailsendtype_2" value="2"<%if rs("emailsendtype")=2 then Response.write " checked"%>>
ASPEMAIL组件<%
on error resume next
set TestObj=server.CreateObject ("Persits.MailSender")
If -2147221005 <> Err then
 Response.write "(已安装,版本:"&TestObj.version&")"
Else
  Response.write "(未安装)"
End If
%></td>
    </tr>

    <tr id="t_EmailSendPort"> 
      <td class="td_r">发送邮件的服务器的端口：</td>
      <td><input name="EmailSendPort" id="EmailSendPort" type="text" value="<%=rs("EmailSendPort")%>">(普通发送使用25固定端口，加密发送一般使用465或587端口)</td>
    </tr>
    
    <tr id="t_EmailServerAddress"> 
      <td class="td_r">发送邮件的服务器地址：</td>
      <td><input name="EmailServerAddress" id="EmailServerAddress" type="text" value="<%=rs("EmailServerAddress")%>"></td>
    </tr>
    
    <tr id="t_EmailUser"> 
      <td class="td_r">发送邮件的Email地址：</td>
      <td><input name="EmailUser" id="EmailUser" type="text" value="<%=rs("EmailUser")%>"></td>
    </tr>
    
    <tr id="t_EmailPassword"> 
      <td class="td_r">发送邮件的Email密码：</td>
      <td><input name="EmailPassword" id="EmailPassword" type="password" value="<%=rs("EmailPassword")%>">
<br>如:你有一个qq邮件名为a@qq.com,邮箱的授权码或密码为b
<br>则发信服务器地址填写:smtp.qq.com
发送邮件帐号名称填写a@qq.com,发送邮件帐号的密码填写b,其它邮件类似</td>
    </tr>
  
  
<tr class="tr_1"> 
<td colspan="2">管理员收件Email地址</td>
</tr>

    <tr> 
      <td class="td_r">管理员收件Email地址：</td>
      <td><input name="EmailAdmin" id="EmailAdmin" type="text" value="<%=rs("EmailAdmin")%>">(<a href="../../AdminUser.aspx?Action=emailtest">点击测试此邮件是否可能收到上面的设置的邮件发送的邮件，请保存设置后再测试</a>)</td>
    </tr>
    


<tr class="tr_1"> 
<td colspan="2">邮件模板</td>
</tr>
    <tr>
      <td class="td_r">邮件模板：</td>
      <td><textarea name="EmailTemplate" cols="80" rows="8"><%=Rs("EmailTemplate")%></textarea>
<br />支持标签
{username}:用户名
{sysurl}:系统网址
{doresult}:显示内容
{sendtime}:发送时间

</td>
    </tr>

    

<tr class="tr_1"> 
<td colspan="2">邮件发送开关设置</td>
</tr>

<tr>
  <td class="td_r">&nbsp;</td>
  <td><a href="javascript:" id="emailallopen">全部开启</a>&nbsp;&nbsp;<a href="javascript:" id="emailallclose">全部关闭</a></td>
</tr>
<tr>
<td class="td_r">用户注册成功后：</td>
<td>
<input name="Email_UserReg" type="radio" value="1"<%If Rs("Email_UserReg")=1 Then Response.Write " checked"%>>是 
<input name="Email_UserReg" type="radio" value="0"<%If Rs("Email_UserReg")=0 Then Response.Write " checked"%>>否
</td>
</tr>

<tr>
<td class="td_r">用户状态改变后：</td>
<td>
<input name="Email_UserValid" type="radio" value="1"<%If Rs("Email_UserValid")=1 Then Response.Write " checked"%>>是 
<input name="Email_UserValid" type="radio" value="0"<%If Rs("Email_UserValid")=0 Then Response.Write " checked"%>>否
</td>
</tr>

<tr>
<td class="td_r">用户留言后(发邮件通知给管理员)：</td>
<td>
<input name="Email_GbookAdd" type="radio" value="1"<%If Rs("Email_GbookAdd")=1 Then Response.Write " checked"%>>是 
<input name="Email_GbookAdd" type="radio" value="0"<%If Rs("Email_GbookAdd")=0 Then Response.Write " checked"%>>否
</td>
</tr>

<tr>
<td class="td_r">管理员回复用户留言：</td>
<td>
<input name="Email_GbookReply" type="radio" value="1"<%If Rs("Email_GbookReply")=1 Then Response.Write " checked"%>>是 
<input name="Email_GbookReply" type="radio" value="0"<%If Rs("Email_GbookReply")=0 Then Response.Write " checked"%>>否
</td>
</tr>

<tr>
<td class="td_r">用户新增站点审核(非自动通过审核设置时发邮件通知给管理员)：</td>
<td>
<input name="Email_UserSiteAdd" type="radio" value="1"<%If Rs("Email_UserSiteAdd")=1 Then Response.Write " checked"%>>是 
<input name="Email_UserSiteAdd" type="radio" value="0"<%If Rs("Email_UserSiteAdd")=0 Then Response.Write " checked"%>>否
</td>
</tr>

<tr>
<td class="td_r">用户网站审核成功后：</td>
<td>
<input name="Email_UserSiteCheck" type="radio" value="1"<%If Rs("Email_UserSiteCheck")=1 Then Response.Write " checked"%>>是 
<input name="Email_UserSiteCheck" type="radio" value="0"<%If Rs("Email_UserSiteCheck")=0 Then Response.Write " checked"%>>否
</td>
</tr>


<tr>
<td class="td_r">用户结算审核提交时(发邮件通知给管理员)：</td>
<td>
<input name="Email_UserSpendAdd" type="radio" value="1"<%If Rs("Email_UserSpendAdd")=1 Then Response.Write " checked"%>>是 
<input name="Email_UserSpendAdd" type="radio" value="0"<%If Rs("Email_UserSpendAdd")=0 Then Response.Write " checked"%>>否
</td>
</tr>

<tr>
<td class="td_r">用户结算审核成功后：</td>
<td>
<input name="Email_UserSpendCheck" type="radio" value="1"<%If Rs("Email_UserSpendCheck")=1 Then Response.Write " checked"%>>是 
<input name="Email_UserSpendCheck" type="radio" value="0"<%If Rs("Email_UserSpendCheck")=0 Then Response.Write " checked"%>>否
</td>
</tr>

<tr>
<td class="td_r">用户修改密码成功后：</td>
<td>
<input name="Email_UserPwdModify" type="radio" value="1"<%If Rs("Email_UserPwdModify")=1 Then Response.Write " checked"%>>是 
<input name="Email_UserPwdModify" type="radio" value="0"<%If Rs("Email_UserPwdModify")=0 Then Response.Write " checked"%>>否
</td>
</tr>

<tr>
<td class="td_r">用户Email修改成功后：</td>
<td>
<input name="Email_UserEmailModify" type="radio" value="1"<%If Rs("Email_UserEmailModify")=1 Then Response.Write " checked"%>>是 
<input name="Email_UserEmailModify" type="radio" value="0"<%If Rs("Email_UserEmailModify")=0 Then Response.Write " checked"%>>否
</td>
</tr>

<tr>
<td class="td_r">用户修改密保成功后：</td>
<td>
<input name="Email_UserPwdAnswerModify" type="radio" value="1"<%If Rs("Email_UserPwdAnswerModify")=1 Then Response.Write " checked"%>>是 
<input name="Email_UserPwdAnswerModify" type="radio" value="0"<%If Rs("Email_UserPwdAnswerModify")=0 Then Response.Write " checked"%>>否
</td>
</tr>

<tr>
<td class="td_r">用户新增广告时(发邮件通知给管理员)：</td>
<td>
<input name="Email_AdUserAdAdd" type="radio" value="1"<%If Rs("Email_AdUserAdAdd")=1 Then Response.Write " checked"%>>是 
<input name="Email_AdUserAdAdd" type="radio" value="0"<%If Rs("Email_AdUserAdAdd")=0 Then Response.Write " checked"%>>否
</td>
</tr>

<tr>
<td class="td_r">用户广告审核：</td>
<td>
<input name="Email_AdUserAdCheck" type="radio" value="1"<%If Rs("Email_AdUserAdCheck")=1 Then Response.Write " checked"%>>是 
<input name="Email_AdUserAdCheck" type="radio" value="0"<%If Rs("Email_AdUserAdCheck")=0 Then Response.Write " checked"%>>否
</td>
</tr>

<tr>
<td class="td_r">用户修改广告新增(发邮件通知给管理员)：</td>
<td>
<input name="Email_AdUserAdModifyAdd" type="radio" value="1"<%If Rs("Email_AdUserAdModifyAdd")=1 Then Response.Write " checked"%>>是 
<input name="Email_AdUserAdModifyAdd" type="radio" value="0"<%If Rs("Email_AdUserAdModifyAdd")=0 Then Response.Write " checked"%>>否
</td>
</tr>

<tr>
<td class="td_r">用户修改广告审核：</td>
<td>
<input name="Email_AdUserAdModifyCheck" type="radio" value="1"<%If Rs("Email_AdUserAdModifyCheck")=1 Then Response.Write " checked"%>>是 
<input name="Email_AdUserAdModifyCheck" type="radio" value="0"<%If Rs("Email_AdUserAdModifyCheck")=0 Then Response.Write " checked"%>>否
</td>
</tr>




<tr class="tr_1"> 
<td colspan="2">发送邮件安全码</td>
</tr>
    <tr>
      <td class="td_r">发送邮件安全码：</td>
      <td>
<script>
var chars = ['0','1','2','3','4','5','6','7','8','9','a','b','d','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','D','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];

function generateMixed(n) {
     var res = "";
     for(var i = 0; i < n ; i ++) {
         var id = Math.ceil(Math.random()*61);
         res += chars[id];
     }
     return res;
}
</script>

<input name="Email_JkCode" type="text" id="Email_JkCode" value="<%=Rs("Email_JkCode")%>">
<a href="javascript:" onclick="$(function () { confirm('确认要使用随机值吗，生成随机值后需再提交表单才生效?', '', function (isConfirm) {if (isConfirm) {document.getElementById('Email_JkCode').value=generateMixed(16);}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});">点击这里取随机值</a>(建议填写任意8位以上字母，数字组合，防止别人猜解用的，保存修改后生效)<br />
这里是和监控类的软件整合，当系统的CPU过高自动重启IIS时，或站点打不开时也可以发送邮件通知<br />
服务器CPU过高时Email通知接口地址:<br />
<%
if AdScriptShowDomain="" Then
 EmailUrl=RootPath
Else
 EmailUrl=AdScriptShowDomain
End If
%>
<a href="<%=EmailUrl%>cf.aspx?action=servererroremail&servername=LianMeng&email_jkcode=<%=Rs("Email_JkCode")%>" target="_blank"><%=EmailUrl%>cf.aspx?action=servererroremail&servername=LianMeng&email_jkcode=<%=Rs("Email_JkCode")%></a><br />
WEB站点故障时Email通知接口地址:<br />
<a href="<%=EmailUrl%>cf.aspx?action=weberroremail&webname=LianMeng&email_jkcode=<%=Rs("Email_JkCode")%>" target="_blank"><%=EmailUrl%>cf.aspx?action=weberroremail&webname=LianMeng&email_jkcode=<%=Rs("Email_JkCode")%></a>
</td>
    </tr>
    <tr> 
	<td></td>
      <td>  
          <input type="submit" name="submit" id="submit" value="修改" class="btn btn-primary">
          　　 

      </td>
    </tr>

  </form>


</table>
