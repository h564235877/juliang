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
PageUrl = "?Action="&Action

Sql="Select * From CFWztg_AdUser_OnlinePay Order By ID Desc"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1
 Rs.pagesize=20
 TotalRs=Rs.RecordCount
 TotalPage=Rs.PageCount
 MyPageSize=Rs.PageSize
 FixedSize=Rs.PageSize
 Rs.AbsolutePage=Page
End If
%>
<table class="tb_2">
<tr>
<td><span class="title">��ֵ��¼</span><a href="?Action=aduserenoughadd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>Ϊ�������ֵ</span></a></td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td>�����˺�</td>
<td>��ֵ����</td>
<td>��ֵ���</td>
<td>��ֵʱ��</td>
<td>��֧��</td>
<td>��ֵ����</td>
<td>����</td>
</tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td><%=Rs("AdUserName")%></td>
<td><%=Rs("OrderCode")%></td>
<td><%=Rs("PayMoney")%></td>
<td><%=Rs("AddTime")%></td>
<td><%
If Rs("PayOk")=0 Then
 Response.write "��"
ElseIf Rs("PayOk")=1 Then
 Response.write "��"
End if
%></td>
    <td align="center"> <%
If Rs("EnoughType")=1 Then
 Response.write "����֧��"
ElseIf Rs("EnoughType")=2 Then
 Response.write "����Ա�˹���ֵ"
End if
%>
</td>
<td>
<a href="javascript:;" onclick="$(function () { confirm('ȷ��Ҫɾ�������ֵ������?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=aduserenoughdel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> ɾ��</a>
</td>
</tr>
<%
MyPageSize=MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>