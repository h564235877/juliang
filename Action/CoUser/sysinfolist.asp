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

Sql="Select * From CFWztg_SysInfo Where Assort=1 Order By ListID Desc,ID Desc"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not rs.eof then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 rs.pagesize=20
 totalrs=rs.RecordCount
 totalpage=rs.pageCount
 mypagesize=rs.pagesize
 FixedSize=Rs.PageSize
 rs.absolutepage=page
End If
%>
<table class="tb_1">
<tr class="tr_1"> 
<td>����</td>
<td>ʱ ��</td>
</tr>
<%
do while not rs.eof and mypagesize>0
%>
<tr class="tr_2">
<td><a href='?Action=sysinfoshow&ID=<%=Rs("ID")%>'><%=rs("Title")%></a></td>
<td><%=rs("AddTime")%></td>
</tr>
<%
mypagesize=mypagesize-1
rs.movenext
loop
Rs.Close
%>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
