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
Sql="Select * From CFWztg_SysInfoClass where ID="&ID
Rs.open Sql,Conn,1,1
%>

<form name="form4" method="post" action="../../AdminUser.aspx?Action=infoclassmodifysave&ID=<%=ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">�޸������        
</td>
</tr>
<tr> 
<td width="80" class="td_r">�������</td>
<td><input name="InfoClassName" type="text" id="InfoClassName" value="<%=Rs("InfoClassName")%>"></td>
</tr>
<tr> 
<td></td>
<td><input type="submit" name="submit" value="�޸�" class="btn btn-primary">(�������޸ģ��޸ĺ�ԭѡ�����������վ��Ҫ�����������)</td>
</tr>
</table>
</form>