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
AdUserName=ChkStr(Request("AdUserName"),1)

If AdUserName="" Then RefUrl=Server.URLEncode(Request.ServerVariables("Http_Referer")) Else RefUrl=Server.URLEncode(Request("RefUrl"))
%>

<SCRIPT>
$(function(){

$("#planaddsave").click(function(){

 if($("#AdUserName option:selected").val()==""){
  alert('��ѡ��һ�������', '', function () {$("#AdUserName").focus();});
  return false;
 }
 
if($('#PlanName').val()==""){
 alert('���������Ա����', '', function () {$("#PlanName").focus();});
 return false;
}

if($('#TotalClick_Cent').val()==""){
 alert('������Ͷ���ܶ�', '', function () {$("#TotalClick_Cent").focus();});
 return false;
}
<%
If AdUserName<>"" Then
Sql = "Select Spare_Cent From CFWztg_User Where UserName='" & AdUserName & "'"
Set Rs = Conn.Execute(Sql)
Spare_Cent = CDbl(Rs("Spare_Cent"))
Rs.Close
%>
if($('#TotalClick_Cent').val() > <%=Spare_Cent%>){
 alert('ʣ�����֧�������ļƻ�����', '', function () {$("#TotalClick_Cent").focus();});
 return false;
}
<%End If%>

});

});


</script>

<a href="<%=URLDecode(RefUrl)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<form method="post" action="../../AdminUser.aspx?Action=planaddsave" name=form_planadd id=form_planadd>
<table class="tb_1" id='tbu'>
<tr class="tr_1">
<td colspan="2">���ƻ�����</td>
</tr>
<tr> 
<td width="120" class="td_r">������û�����</td>
<td>
<select name='AdUserName' id='AdUserName' onChange="window.location='?Action=planadd&AdUserName='+document.getElementById('AdUserName').options[document.getElementById('AdUserName').selectedIndex].value+'&RefUrl=<%=RefUrl%>'">
<option value=''>��ѡ������</option>
<%
Sql="Select UserName From CFWztg_User Where UserType=2 And UserState=1 Order By UserName"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("UserName")&"'"
 If AdUserName=Rs("UserName") Then Response.write " selected"
 Response.Write ">"&Rs("UserName")&"</option>"
Rs.MoveNext
Wend
Rs.Close
%>
</select>*
</td>
</tr>

<tr>
<td class="td_r">���ƻ����ƣ�</td>
<td>
<input name="PlanName" id="PlanName" type="text" size="40" style="width:300px">*<a href="javascript:" onclick="document.getElementById('PlanName').value='������'+getNowFormatDate();">�������ȡ��ǰʱ���������ƻ�</a></td>
</tr>

<TR>
<TD class="td_r">Ͷ���ܶ</TD>
<TD><input name="TotalClick_Cent" id="TotalClick_Cent" type="text" size="40" style="width:100px">Ԫ*<%
If AdUserName<>"" Then Response.write " (�����"&AdUserName&"�˻����:"&Int(Spare_Cent*100/100)&"Ԫ)"
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
