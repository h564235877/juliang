<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<SCRIPT>
$(function(){

$("#planaddsave").click(function(){

if($('#PlanName').val()==""){
 alert('��������ƻ�����', '', function () {$("#PlanName").focus();});
 return false;
}

if($('#TotalClick_Cent').val()==""){
 alert('������Ͷ���ܶ�', '', function () {$("#TotalClick_Cent").focus();});
 return false;
}
<%
Sql = "Select Spare_Cent From CFWztg_User Where UserName='" & AdUserName & "'"
Set Rs = Conn.Execute(Sql)
Spare_Cent = CDbl(Rs("Spare_Cent"))
Rs.Close
%>
if($('#TotalClick_Cent').val() > <%=Spare_Cent%>){
 alert('ʣ�����֧�������ļƻ�����', '', function () {$("#TotalClick_Cent").focus();});
 return false;
}

});

});

</script>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<form method="post" action="../../AdUser.aspx?Action=planaddsave" name=form_planadd id=form_planadd>
<table class="tb_1" id='tbu'>
<tr class="tr_1">
<td colspan="2">���ƻ�����</td>
</tr>

<tr>
<td width="120" class="td_r">���ƻ����ƣ�</td>
<td>
<input name="PlanName" id="PlanName" type="text" size="40" style="width:300px">*<a href="javascript:" onclick="{if(confirm('ȷ��Ҫʹ�����ֵ���������ֵ�������ύ������Ч ?')){document.getElementById('PlanName').value='������'+getNowFormatDate();return true;}return false;};">�������ȡ��ǰʱ���������ƻ�</a></td>
</tr>

<TR>
<TD class="td_r">Ͷ���ܶ</TD>
<TD><input name="TotalClick_Cent" id="TotalClick_Cent" type="text" size="40" style="width:100px">Ԫ*
<%
Response.write "(�˻����:"&Int(Spare_Cent*100/100)&"Ԫ)"
%>


</TD>
</TR>

<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="submit" id="planaddsave" value="�����¼ƻ�" class="btn btn-primary">
</td>
</tr>

</table>
</form>
