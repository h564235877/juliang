<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>
<%If RsSet("RegType")=1 Then%>

<script>
$(function(){
	
$("#submit").click(function(){

if($('#pwd').val()==""){
 alert('����д������', '', function () {$("#pwd").focus();});
 return false;
}

if($('#pwd2').val()==""){
 alert('��ȷ��������', '', function () {$("#pwd2").focus();});
 return false;
}

if($('#pwd2').val()!=$('#pwd').val()){
 alert('������д�����벻һ������������д', '', function () {$("#pwd2").focus();});
 return false;
}

if($("#pwd_old").val()==""){
 alert('����дԭ����', '', function () {$("#pwd_old").focus();});
 return false;
}

});

});
</script>

<form name="form3" method="post" action="../../CoUser.aspx?Action=pwdmodifysave">
<table class="tb_1"><tr class="tr_1">
<td colspan="2"> �޸�����(��*Ϊ�����</td>
</tr>

<tr> 
<td class="td_r">�����룺</td>
<td>
<input name="pwd" id="pwd" type="password">
<font color="#ff0000">*</font></td>
</tr>
<tr> 
<td class="td_r">ȷ�������룺</td>
<td>
<input name="pwd2" id="pwd2" type="password">
<font color="#ff0000">*</font></td>
</tr>

<tr class="tr_1">
<td colspan="2">��������֤ȷ�������޸�
</td>
</tr>
<tr>
<td width="90" class="td_r">ԭ���룺</td>
<td>
<input name="pwd_old" id="pwd_old" type="password">
<font color="#ff0000">*</font></td>
</tr>


<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="submit" id="submit" value="�޸�" class="btn btn-primary">
</td>
</tr>
</table>
</form>
<%Else%>

<table class="tb_1">
<tr class="tr_1"> 
<td>
<div align="center">
<a href="<%=RsSet("LoginUrl")%>" target="_blank" class="btn btn-sm btn-primary">�뵽��վ��½���޸�����</a>
</div></td>
</tr>
</table>

<%End If%>