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

Set Rs = Server.CreateObject("Adodb.RecordSet")
Sql="Select * From CFWztg_AD Where ID="&ID
Rs.Open Sql,Conn,1,1
%>
<table class="tb_1">
<tr class="tr_1"> 
<td class="td_r">�˹��ֻ������������վ������</td>
</tr>
<tr>
<td>
<%
Response.write Rs("PutSite")
%>
</td>
</tr>
</table>