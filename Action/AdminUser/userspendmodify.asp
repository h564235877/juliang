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
ID=ChkStr(Request("ID"),2)

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_Spend where ID="&ID
Rs.open Sql,Conn,1,1

Set Rs2= Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_User where UserName='"&Rs("UserName")&"'"
Rs2.open Sql,Conn,1,1
If Rs2.Eof Then AlertRef("�û�������")


%>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">�޸Ľ���</td>
</tr>
<form name="form4" method="post" action="../../AdminUser.aspx?Action=userspendmodifysave&ID=<%=ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<tr> 
<td width="180" class="td_r">�û���</td>
<td><%=Rs("UserName")%></td>
</tr>

<tr> 
<td class="td_r">�û����ͣ�</td>
<td>
<%
If Rs("UserType")=1 Then
 Response.write "��վ��"
ElseIf Rs("UserType")=3 Then
 Response.write "�ͷ�"
ElseIf Rs("UserType")=4 Then
 Response.write "����"
End If
%>
</td>
</tr>

<tr> 
<td class="td_r">�����룺</td>
<td><%=GetTurnCent(Rs2("Total_Cent"))%>Ԫ</td>
</tr>
<tr> 
<td class="td_r">�ѽ��㣺</td>
<td><%=GetTurnCent(Rs2("Spend_Cent"))%>Ԫ</td>
</tr>
<tr> 
<td class="td_r">δ���㣺</td>
<td><%=GetTurnCent(Rs2("Spare_Cent"))%>Ԫ</td>
</tr>
<tr> 
<td class="td_r">�˴ν��㣺</td>
<td style="font-size:18px;font-weight:bold;"><%=GetTurnCent(Rs("Spend_Cent"))%>Ԫ</td>
</tr>
<tr> 
<td class="td_r">״̬��</td>
<td>
<%If Rs("AdminCheck")=0 Then%> <select name="SpendState" id="SpendState">
<option value="2"<%If Rs("SpendState")=2 Then Response.Write" selected"%>>ͨ�����</option>
<option value="3"<%If Rs("SpendState")=3 Then Response.Write" selected"%>>�ܾ����</option>
</select>
<input name="AdminCheck" type="hidden" value="0">
<%Else%>
<input name="AdminCheck" type="hidden" value="1">
<%
If Rs("SpendState")=2 Then
Response.Write"�Ѿ�ͨ�����"
ElseIf Rs("SpendState")=3 Then
Response.Write"�Ѿ��ܾ����"
End If
%>
<%End If%>
</td>
</tr>

<tr> 
<td class="td_r">����Ա˵����</td>
<td>
<textarea name="AdminDesc" id="AdminDesc" cols="60" rows="3"><%=Rs("AdminDesc")%></textarea>
<%If Rs("SpendType")=0 Then%>
<br /><input type="radio" name="radio1" value="1" onclick="document.getElementById('AdminDesc').value='�Ѹ�������';document.getElementById('SpendState').value=2;">�Ѹ�������
<br /><input type="radio" name="radio1" value="2" onclick="document.getElementById('AdminDesc').value='��ֹ���ף��ܾ�֧��';document.getElementById('SpendState').value=3;">��ֹ���ף��ܾ�֧��
<%End If%>
</td>
</tr>
	
<tr> 
<td class="td_r">����ʱ�䣺</td>
<td>
<input name="AdminSpendTime" type="text" id="AdminSpendTime" value="<%If Rs("AdminSpendTime")="" or isnull(Rs("AdminSpendTime")) Then
 Response.write Now()
Else
Response.write Rs("AdminSpendTime")
 End If%>">
</td>
</tr>
	
<tr> 
<td></td>
<td><input type="submit" name="submit" value="�޸�" class="btn btn-primary"></td>
</tr>
</form>
	
<tr class="tr_1"> 
<td colspan="2">�û��Ļ�ʽ����</td>
</tr>
<%
If Rs2("UserState")=0 Then
%>
<tr> 
<td class="td_r"></td>
<td>�û�������ʱ�޷��鿴�����Ϣ</td>
</tr>
<%Else%>
<tr> 
<td class="td_r">��ʵ������</td>
<td>
<%=Rs2("Pay_RealName")%>
<%If Rs2("UserType")=3 Then Response.write "&nbsp;&nbsp;[�����Ǳ�վ�ͷ���Ա:"&Rs2("UserNick")&"]"%>
<%If Rs2("UserType")=4 Then Response.write "&nbsp;&nbsp;[�����Ǳ�վ������Ա:"&Rs2("UserNick")&"]"%>
</td>
</tr>
	
<%if Rs2("Pay_Type")="" Then%>
<tr> 
<td class="td_r"></td>
<td>û����д��ʽ</td>
</tr>
<%Else%>
<tr> 
<td class="td_r">�տʽ</td>
<td>
<%
If Rs2("pay_type")="alipay" Then
 Response.write "֧����"
ElseIf Rs2("pay_type")="tenpay" Then
 Response.write "�Ƹ�ͨ"
ElseIf Rs2("pay_type")="boc" Then
 Response.write "�й�����"
ElseIf Rs2("pay_type")="abc" Then
 Response.write "ũҵ����"
ElseIf Rs2("pay_type")="icbc" Then
 Response.write "��������"
ElseIf Rs2("pay_type")="ccb" Then
 Response.write "��������"
ElseIf Rs2("pay_type")="cmb" Then
 Response.write "��������"
ElseIf Rs2("pay_type")="otherbank" Then
 Response.write "��������"
End If


%>
</td>
</tr>

<tr> 
<td class="td_r">�ʺţ�</td>
<td><%=Rs2("pay_account")%></td>
</tr>

<%If Not(Rs2("pay_type")="alipay" Or Rs2("pay_type")="alipay") Then%>
<tr> 
<td class="td_r">�������У�</td>
<td><%=Rs2("pay_bankaddress")%></td>
</tr>
<%End If%>
<%End If%>	
<%End If%>
<tr> 
<td class="td_r">�û��˴ν�����д��˵����</td>
<td><%=Rs("SpendDesc")%></td>
</tr>
</table>

<div class='explain'>ע�����û����10�ʽ���</div>
<table class="tb_1">
  <tr class="tr_1"> 
    <td>����ID</a></td>
    <td>������</td>
    <td>����˵��</td>
    <td>����ʱ��</td>
    <td>����״̬</td>
    <td>��������</td>
    <td>����Ա˵��</td>
    <td>����ʱ��</td>
  </tr>
<%
Sql = "Select Top 10 * From CFWztg_Spend Where UserName='"&Rs2("UserName")&"'"

Sql=Sql&" And SpendType=0"

Sql=Sql&" Order By ID Desc"

Set Rs = Server.CreateObject("Adodb.RecordSet")
Rs.Open Sql,Conn,1,1

While Not Rs.Eof
%>
  <tr class="tr_2"> 
    <td><%=Rs("ID")%></td>
    <td><%=GetTurnCent(Rs("Spend_Cent"))%>Ԫ</td>
    <td><%=Rs("SpendDesc")%></td>
    <td><%=Rs("SpendTime")%></td>
    <td><%
If Rs("SpendState")=1 Then
 Response.Write "���������"
ElseIf Rs("SpendState")=2 Then
 Response.Write "����ɹ�"
ElseIf Rs("SpendState")=3 Then
 Response.Write "����ʧ��,"&Rs("SpendAbortFeedBack")
End If%></td>
<td> 
<%
If Rs("SpendType")=0 Then
 Response.Write "�������"
ElseIf Rs("SpendType")=1 Then
 Response.Write "����Ƽ��û�����"
ElseIf Rs("SpendType")=2 Then
 Response.Write "������Ʒ����"
End If%></td>
<td ><%=rs("AdminDesc")%></td>
<td><%=rs("AdminSpendTime")%></td>
</tr>
<%
MyPageSize = MyPageSize-1
Rs.MoveNext
Wend

Rs.Close
Rs2.Close
%>
</table>