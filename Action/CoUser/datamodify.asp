<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
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
 alert('����д�س�', '', function () {$("#usernick").focus();});
 return false;
}

if($('#email').val()==""){
 alert('����дemail��ַ', '', function () {$("#email").focus();});
 return false;
}

if(!isValidEmail($('#email').val())){
 alert('email��ַ��ʽ��д����ȷ', '', function () {$("#email").focus();});
 return false;
}

if($("#pwdanswer").val()==""){
 alert('����д����ش��', '', function () {$("#pwdanswer").focus();});
 return false;
}

});


});
</script>

<form name="form2" method="post" action="../../CoUser.aspx?Action=datamodifysave">
<table class="tb_1">
    <tr class="tr_1"> 
      <td  colspan="2">�޸�ע������(��*Ϊ�����</td>
    </tr>
    <tr> 
      <td width="120" class="td_r">�û�����</td>
      <td><%=Rs("UserName")%></td>
    </tr>
	
    <tr> 
      <td class="td_r">�ڱ�ϵͳ����ID��</td>
      <td><%=Rs("ID")%></td>
    </tr>

<tr> 
<td class="td_r">������Ȩ�ޣ�</td>
<td><%If Rs("AgentPower")=2 Then
Response.write "��"
Else
Response.write "��"
End If%></td>
</tr>


	<tr> 
      <td class="td_r">�سƣ�</td>
      <td> <input name="usernick" id="usernick" type="text"  value="<%=Rs("usernick")%>"> 
        <font color="#ff0000">*</font></td>
    </tr>
	<tr> 
      <td class="td_r">Email��</td>
      <td> <input name="email" id="email" type="text"  value="<%=Rs("email")%>"> 
        <font color="#ff0000">*</font></td>
    </tr>
    <tr> 
      <td class="td_r">QQ���룺</td>
      <td> <input name="qq" id="qq"type="text" value="<%=Rs("QQ")%>"> 
      </td>
    </tr>
    <tr> 
      <td class="td_r">��ϵ�绰��</td>
      <td><input name="phone" id="phone"type="text"  value="<%=Rs("phone")%>"></td>
    </tr>
    
    <tr class="tr_1"> 
      <td colspan="2">��������֤ȷ�������޸�</td>
    </tr>
    <tr> 
      <td class="td_r">������ʾ���⣺</td>
      <td><%=Rs("PwdAsk")%></td>
    </tr>
    <tr> 
      <td class="td_r">����ش�𰸣�</td>
      <td align="left"><input name="pwdanswer" id="pwdanswer" type="text"> 
        <font color="#ff0000">*</font></td>
    </tr>

    <tr> 
      <td>&nbsp;</td>
      <td align="left"><input type="submit" name="submit" id="submit" value="�޸�" class="btn btn-primary"></td>
    </tr>
</table>
</form>
