<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<script>
$(function(){

$("#submit").click(function(){	


if($('#EmailSendPort').val()==""){
 alert('����д�����ʼ��ķ������˿�', '', function () {$("#EmailSendPort").focus();});
 return false;
}
if($('#EmailServerAddress').val()==""){
 alert('����д�����ʼ��ķ�������ַ', '', function () {$("#EmailServerAddress").focus();});
 return false;
}
if($('#EmailUser').val()==""){
 alert('����д�����ʼ���Email��ַ', '', function () {$("#EmailUser").focus();});
 return false;
}
if(!isValidEmail($('#EmailUser').val())){
 alert('�����ʼ���Email��ַ��ʽ��д����ȷ', '', function () {$("#EmailUser").focus();});
 return false;
}
if($('#EmailPassword').val()==""){
 alert('����д�����ʼ���Email����', '', function () {$("#EmailPassword").focus();});
 return false;
}

if($('#EmailAdmin').val()==""){
 alert('����д����Ա���ŵ�Email��ַ', '', function () {$("#EmailAdmin").focus();});
 return false;
}
if(!isValidEmail($('#EmailAdmin').val())){
 alert('����Ա���ŵ�Email��ַ��ʽ��д����ȷ', '', function () {$("#EmailAdmin").focus();});
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
<td colspan="2">�ʼ������������</td>
</tr>

<tr> 
<td width="180" class="td_r">�����ʼ������</td>
<td>
<input type="radio" name="emailsendtype" id="emailsendtype_1"  value="1"<%if rs("emailsendtype")=1 then Response.write " checked"%>>
ASP.NET�Դ����(���谲װ,�Ƽ�ʹ��)
<input type="radio" name="emailsendtype" id="emailsendtype_2" value="2"<%if rs("emailsendtype")=2 then Response.write " checked"%>>
ASPEMAIL���<%
on error resume next
set TestObj=server.CreateObject ("Persits.MailSender")
If -2147221005 <> Err then
 Response.write "(�Ѱ�װ,�汾:"&TestObj.version&")"
Else
  Response.write "(δ��װ)"
End If
%></td>
    </tr>

    <tr id="t_EmailSendPort"> 
      <td class="td_r">�����ʼ��ķ������Ķ˿ڣ�</td>
      <td><input name="EmailSendPort" id="EmailSendPort" type="text" value="<%=rs("EmailSendPort")%>">(��ͨ����ʹ��25�̶��˿ڣ����ܷ���һ��ʹ��465��587�˿�)</td>
    </tr>
    
    <tr id="t_EmailServerAddress"> 
      <td class="td_r">�����ʼ��ķ�������ַ��</td>
      <td><input name="EmailServerAddress" id="EmailServerAddress" type="text" value="<%=rs("EmailServerAddress")%>"></td>
    </tr>
    
    <tr id="t_EmailUser"> 
      <td class="td_r">�����ʼ���Email��ַ��</td>
      <td><input name="EmailUser" id="EmailUser" type="text" value="<%=rs("EmailUser")%>"></td>
    </tr>
    
    <tr id="t_EmailPassword"> 
      <td class="td_r">�����ʼ���Email���룺</td>
      <td><input name="EmailPassword" id="EmailPassword" type="password" value="<%=rs("EmailPassword")%>">
<br>��:����һ��qq�ʼ���Ϊa@qq.com,�������Ȩ�������Ϊb
<br>���ŷ�������ַ��д:smtp.qq.com
�����ʼ��ʺ�������дa@qq.com,�����ʼ��ʺŵ�������дb,�����ʼ�����</td>
    </tr>
  
  
<tr class="tr_1"> 
<td colspan="2">����Ա�ռ�Email��ַ</td>
</tr>

    <tr> 
      <td class="td_r">����Ա�ռ�Email��ַ��</td>
      <td><input name="EmailAdmin" id="EmailAdmin" type="text" value="<%=rs("EmailAdmin")%>">(<a href="../../AdminUser.aspx?Action=emailtest">������Դ��ʼ��Ƿ�����յ���������õ��ʼ����͵��ʼ����뱣�����ú��ٲ���</a>)</td>
    </tr>
    


<tr class="tr_1"> 
<td colspan="2">�ʼ�ģ��</td>
</tr>
    <tr>
      <td class="td_r">�ʼ�ģ�壺</td>
      <td><textarea name="EmailTemplate" cols="80" rows="8"><%=Rs("EmailTemplate")%></textarea>
<br />֧�ֱ�ǩ
{username}:�û���
{sysurl}:ϵͳ��ַ
{doresult}:��ʾ����
{sendtime}:����ʱ��

</td>
    </tr>

    

<tr class="tr_1"> 
<td colspan="2">�ʼ����Ϳ�������</td>
</tr>

<tr>
  <td class="td_r">&nbsp;</td>
  <td><a href="javascript:" id="emailallopen">ȫ������</a>&nbsp;&nbsp;<a href="javascript:" id="emailallclose">ȫ���ر�</a></td>
</tr>
<tr>
<td class="td_r">�û�ע��ɹ���</td>
<td>
<input name="Email_UserReg" type="radio" value="1"<%If Rs("Email_UserReg")=1 Then Response.Write " checked"%>>�� 
<input name="Email_UserReg" type="radio" value="0"<%If Rs("Email_UserReg")=0 Then Response.Write " checked"%>>��
</td>
</tr>

<tr>
<td class="td_r">�û�״̬�ı��</td>
<td>
<input name="Email_UserValid" type="radio" value="1"<%If Rs("Email_UserValid")=1 Then Response.Write " checked"%>>�� 
<input name="Email_UserValid" type="radio" value="0"<%If Rs("Email_UserValid")=0 Then Response.Write " checked"%>>��
</td>
</tr>

<tr>
<td class="td_r">�û����Ժ�(���ʼ�֪ͨ������Ա)��</td>
<td>
<input name="Email_GbookAdd" type="radio" value="1"<%If Rs("Email_GbookAdd")=1 Then Response.Write " checked"%>>�� 
<input name="Email_GbookAdd" type="radio" value="0"<%If Rs("Email_GbookAdd")=0 Then Response.Write " checked"%>>��
</td>
</tr>

<tr>
<td class="td_r">����Ա�ظ��û����ԣ�</td>
<td>
<input name="Email_GbookReply" type="radio" value="1"<%If Rs("Email_GbookReply")=1 Then Response.Write " checked"%>>�� 
<input name="Email_GbookReply" type="radio" value="0"<%If Rs("Email_GbookReply")=0 Then Response.Write " checked"%>>��
</td>
</tr>

<tr>
<td class="td_r">�û�����վ�����(���Զ�ͨ���������ʱ���ʼ�֪ͨ������Ա)��</td>
<td>
<input name="Email_UserSiteAdd" type="radio" value="1"<%If Rs("Email_UserSiteAdd")=1 Then Response.Write " checked"%>>�� 
<input name="Email_UserSiteAdd" type="radio" value="0"<%If Rs("Email_UserSiteAdd")=0 Then Response.Write " checked"%>>��
</td>
</tr>

<tr>
<td class="td_r">�û���վ��˳ɹ���</td>
<td>
<input name="Email_UserSiteCheck" type="radio" value="1"<%If Rs("Email_UserSiteCheck")=1 Then Response.Write " checked"%>>�� 
<input name="Email_UserSiteCheck" type="radio" value="0"<%If Rs("Email_UserSiteCheck")=0 Then Response.Write " checked"%>>��
</td>
</tr>


<tr>
<td class="td_r">�û���������ύʱ(���ʼ�֪ͨ������Ա)��</td>
<td>
<input name="Email_UserSpendAdd" type="radio" value="1"<%If Rs("Email_UserSpendAdd")=1 Then Response.Write " checked"%>>�� 
<input name="Email_UserSpendAdd" type="radio" value="0"<%If Rs("Email_UserSpendAdd")=0 Then Response.Write " checked"%>>��
</td>
</tr>

<tr>
<td class="td_r">�û�������˳ɹ���</td>
<td>
<input name="Email_UserSpendCheck" type="radio" value="1"<%If Rs("Email_UserSpendCheck")=1 Then Response.Write " checked"%>>�� 
<input name="Email_UserSpendCheck" type="radio" value="0"<%If Rs("Email_UserSpendCheck")=0 Then Response.Write " checked"%>>��
</td>
</tr>

<tr>
<td class="td_r">�û��޸�����ɹ���</td>
<td>
<input name="Email_UserPwdModify" type="radio" value="1"<%If Rs("Email_UserPwdModify")=1 Then Response.Write " checked"%>>�� 
<input name="Email_UserPwdModify" type="radio" value="0"<%If Rs("Email_UserPwdModify")=0 Then Response.Write " checked"%>>��
</td>
</tr>

<tr>
<td class="td_r">�û�Email�޸ĳɹ���</td>
<td>
<input name="Email_UserEmailModify" type="radio" value="1"<%If Rs("Email_UserEmailModify")=1 Then Response.Write " checked"%>>�� 
<input name="Email_UserEmailModify" type="radio" value="0"<%If Rs("Email_UserEmailModify")=0 Then Response.Write " checked"%>>��
</td>
</tr>

<tr>
<td class="td_r">�û��޸��ܱ��ɹ���</td>
<td>
<input name="Email_UserPwdAnswerModify" type="radio" value="1"<%If Rs("Email_UserPwdAnswerModify")=1 Then Response.Write " checked"%>>�� 
<input name="Email_UserPwdAnswerModify" type="radio" value="0"<%If Rs("Email_UserPwdAnswerModify")=0 Then Response.Write " checked"%>>��
</td>
</tr>

<tr>
<td class="td_r">�û��������ʱ(���ʼ�֪ͨ������Ա)��</td>
<td>
<input name="Email_AdUserAdAdd" type="radio" value="1"<%If Rs("Email_AdUserAdAdd")=1 Then Response.Write " checked"%>>�� 
<input name="Email_AdUserAdAdd" type="radio" value="0"<%If Rs("Email_AdUserAdAdd")=0 Then Response.Write " checked"%>>��
</td>
</tr>

<tr>
<td class="td_r">�û������ˣ�</td>
<td>
<input name="Email_AdUserAdCheck" type="radio" value="1"<%If Rs("Email_AdUserAdCheck")=1 Then Response.Write " checked"%>>�� 
<input name="Email_AdUserAdCheck" type="radio" value="0"<%If Rs("Email_AdUserAdCheck")=0 Then Response.Write " checked"%>>��
</td>
</tr>

<tr>
<td class="td_r">�û��޸Ĺ������(���ʼ�֪ͨ������Ա)��</td>
<td>
<input name="Email_AdUserAdModifyAdd" type="radio" value="1"<%If Rs("Email_AdUserAdModifyAdd")=1 Then Response.Write " checked"%>>�� 
<input name="Email_AdUserAdModifyAdd" type="radio" value="0"<%If Rs("Email_AdUserAdModifyAdd")=0 Then Response.Write " checked"%>>��
</td>
</tr>

<tr>
<td class="td_r">�û��޸Ĺ����ˣ�</td>
<td>
<input name="Email_AdUserAdModifyCheck" type="radio" value="1"<%If Rs("Email_AdUserAdModifyCheck")=1 Then Response.Write " checked"%>>�� 
<input name="Email_AdUserAdModifyCheck" type="radio" value="0"<%If Rs("Email_AdUserAdModifyCheck")=0 Then Response.Write " checked"%>>��
</td>
</tr>




<tr class="tr_1"> 
<td colspan="2">�����ʼ���ȫ��</td>
</tr>
    <tr>
      <td class="td_r">�����ʼ���ȫ�룺</td>
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
<a href="javascript:" onclick="$(function () { confirm('ȷ��Ҫʹ�����ֵ���������ֵ�������ύ������Ч?', '', function (isConfirm) {if (isConfirm) {document.getElementById('Email_JkCode').value=generateMixed(16);}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});">�������ȡ���ֵ</a>(������д����8λ������ĸ��������ϣ���ֹ���˲½��õģ������޸ĺ���Ч)<br />
�����Ǻͼ�����������ϣ���ϵͳ��CPU�����Զ�����IISʱ����վ��򲻿�ʱҲ���Է����ʼ�֪ͨ<br />
������CPU����ʱEmail֪ͨ�ӿڵ�ַ:<br />
<%
if AdScriptShowDomain="" Then
 EmailUrl=RootPath
Else
 EmailUrl=AdScriptShowDomain
End If
%>
<a href="<%=EmailUrl%>cf.aspx?action=servererroremail&servername=LianMeng&email_jkcode=<%=Rs("Email_JkCode")%>" target="_blank"><%=EmailUrl%>cf.aspx?action=servererroremail&servername=LianMeng&email_jkcode=<%=Rs("Email_JkCode")%></a><br />
WEBվ�����ʱEmail֪ͨ�ӿڵ�ַ:<br />
<a href="<%=EmailUrl%>cf.aspx?action=weberroremail&webname=LianMeng&email_jkcode=<%=Rs("Email_JkCode")%>" target="_blank"><%=EmailUrl%>cf.aspx?action=weberroremail&webname=LianMeng&email_jkcode=<%=Rs("Email_JkCode")%></a>
</td>
    </tr>
    <tr> 
	<td></td>
      <td>  
          <input type="submit" name="submit" id="submit" value="�޸�" class="btn btn-primary">
          ���� 

      </td>
    </tr>

  </form>


</table>
