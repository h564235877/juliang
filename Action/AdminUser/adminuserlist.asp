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

Sql="Select * From CFWztg_AdminUser Order By PowerLevel"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1
 Rs.pagesize=50
 TotalRs=Rs.RecordCount
 TotalPage=Rs.PageCount
 MyPageSize=Rs.PageSize
 FixedSize=rs.pagesize
 Rs.AbsolutePage=Page
End If
%>


<a href="?Action=adminuseradd" class="actionBtn add" style="margin-top:10px;"><i class="mdi mdi-plus"></i><span>���ӹ���Ա</span></a>

<table class="tb_1">
<tr class="tr_1"> 
<td>����Ա�û���</td>
<td>����</td>
<td>����</td>
<td>�ϴε�¼IP</td>
<td>�ϴε�¼ʱ��</td>
<td>����¼IP</td>
<td>����¼ʱ��</td>
<td>��¼����</td>
<td>����</td>
</tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td><%=rs("AdminUserName")%></td>
<td><%=rs("AdminUserDesc")%></td>
<td>
<%
If Rs("PowerLevel")=1 Then
 Response.Write "��������Ա"
ElseIf Rs("PowerLevel")=2 Then
 Response.Write "��ͨ����Ա"
End If
%>
</td>
<td><%=rs("PreviousLoginIp")%></td>
<td><%=rs("PreviousLoginTime")%></td>
<td><%=rs("LastLoginIp")%></td>
<td><%=rs("LastLoginTime")%></td>
<td><%=rs("LoginTotal")%></td>
<td>
<a href="?Action=adminusermodify&AdminUserName=<%=rs("AdminUserName")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>�޸�</a>
<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=adminuserdel&AdminUserName=<%=rs("AdminUserName")%>&PowerLevel=<%=rs("PowerLevel")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>ɾ��</a>
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
</td>
</tr>
</table>