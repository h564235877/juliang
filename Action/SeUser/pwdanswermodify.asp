<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<%Set Rs= Server.CreateObject("Adodb.RecordSet")
Sql="Select * From CFWztg_User Where UserName='"&SeUserName&"'"
Rs.Open Sql,Conn,1,1%>

<script>
$(function(){
	
$("#submit").click(function(){

if($('#pwdask_new').val()==""){
 alert('����д��������ʾ����', '', function () {$("#pwdask_new").focus();});
 return false;
}

if($('#pwdanswer_new').val()==""){
 alert('����д������ش��', '', function () {$("#pwdanswer_new").focus();});
 return false;
}

if($("#pwdanswer_old").val()==""){
 alert('����дԭ����ش��', '', function () {$("#pwdanswer_old").focus();});
 return false;
}

});

});
</script>

<form name="form3" method="post" action="../../SeUser.aspx?Action=pwdanswermodifysave">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">�޸�������ʾ�ʹ�(��*Ϊ�����</td>
</tr>


<tr> 
<td class="td_r">��������ʾ���⣺</td>
<td>
<input name="pwdask_new" type="text" id="pwdask_new">
<font color="#ff0000">*</font></td>
</tr>
<tr> 
<td class="td_r">������ش�𰸣�</td>
<td>
<input name="pwdanswer_new" type="text" id="pwdanswer_new">
<font color="#ff0000">*</font></td>
</tr>

<tr class="tr_1">
<td colspan="2">��������֤ȷ�������޸�
</td>
</tr>
<tr> 
<td width="120" class="td_r">ԭ������ʾ���⣺</td>
<td><%=Rs("pwdask")%></td>
</tr>
<tr> 
<td class="td_r">ԭ����ش�𰸣�</td>
<td><input name="pwdanswer_old" type="text" id="pwdanswer_old">
<font color="#ff0000">*</font></td>
</tr>

<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="submit" id="submit" value="�޸�" class="btn btn-primary">
�� <a href="../../SeUser.aspx?Action=pwdanswersend" target="_blank"><font color="#0000FF">�����ҵ�Email�޸�</font></a> (ע���������ԭ����ش�𰸿ɷ��͵��Լ���Email���޸�)</td>
</tr>
</table>
</form>