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

if($('#ad_id').val()==""){
 alert('������ѡ��', '', function () {$("#ad_id").focus();});
 return false;
}

if($('#cpainfo').val()==""){
 alert('CPA��Ϣ������д', '', function () {$("#cpainfo").focus();});
 return false;
}


});

});

</script>
<form action="../../AdUser.aspx?Action=upunioncpastep" method="post" name="form2" target="_blank" onsubmit="return upunioncpaincheck()">
<table class="tb_1"><tr class="tr_1"> 
<td colspan="2">���������ϼ�����CPA����</td>
</tr>
<tr>
<td class="td_r">ѡ��CPA��棺</td>
<td>
<select id='ad_id' name='ad_id'>
<option value="">ѡ����</option>
<%
Sql="Select AdName,ID,Unit_Cent From CFWztg_AD Where ClickState=3 And AdUserName='"&AdUserName&"' Order By ID"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("ID")&"'"
 Response.Write ">"&Rs("AdName")&"[���ID:"&Rs("ID")&"][��浥��:"&GetTurnCent(Rs("Unit_Cent"))&"Ԫ]</option>"
Rs.MoveNext
Wend
%>
</select>
</td>
</tr>
<tr>
<td class="td_r">����Ҫ��������ݣ�</td>
<td><textarea name="cpainfo" id="cpainfo" cols="80" rows="20"></textarea></td>
</tr>
<tr>
<td class="td_r">&nbsp;</td>
<td>���ݸ�ʽ������|�û�ID|����
<br>
ע��һ��һ�����ݣ��㵼���ϵͳ������֤������ȷ���ٵ��룬����һ�����ݸ�ʽ����ȷ�����ʾ�����޸���ȷ�ٵ���</td>
</tr>

<tr>
<td height="29">&nbsp;</td>
<td><input type="submit" name="submit" id="submit" value="����" class="btn btn-primary"></td>
</tr>
</table>
</form>
