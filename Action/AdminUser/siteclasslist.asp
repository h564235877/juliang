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
Sql="Select * From CFWztg_SiteClass Order By SiteClassName"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
%>

<a href="?Action=siteclassadd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>������վ����</span></a>

<table class="tb_1">
<tr class="tr_1"> 
<td>���</td>
<td>������</td>
<td>����</td>
</tr>
<%
I=0
While Not Rs.Eof
I=I+1
%>
<tr class="tr_2"> 
<td><%=I%></td>
<td><%=Rs("SiteClassName")%></td>
<td>
<a href="?Action=siteclassmodify&ID=<%=rs("ID")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>�޸�</a>

<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=siteclassdel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>ɾ��</a>
</td>
</tr>
<%
Rs.MoveNext
Wend
%>
</table>
     