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
ID=Goback(ChkStr(Request("ID"),2),"������ID��")

Sql="Select * From CFWztg_SysInfo Where ID="&ID
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
%>
	
<table class="tb_1">
<tr class="tr_1"> 
<td><%=Rs("Title")%></td>
</tr>
<tr> 
<td><%=Replace(Rs("Content"),Chr(13) & Chr(10),"<br>")%></td>
</tr>
<tr> 
<td class="td_3">����ʱ��:<%=Rs("AddTime")%></td>
</tr>
<tr>
<td class="td_2">
<a href="javascript:history.go(-1);">������ҳ</a>
</td>
</tr>
</table>  