<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>



<table class="tb_1">
<tr class="tr_1"> 
<td>����ע��</td>
</tr>

<form name="form5" method="post" action="../../AdminUser.aspx?Action=licencodemodifysave">
<tr> 
<td>
<%
Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select LicenCode From CFWztg_Admin"
Rs.open Sql,Conn,1,1
%>
��ȡ���к���Ψһ;��������ٷ���վ<a href="http://www.qqcf.com" target="_blank">�˷�ԭ������http://www.qqcf.com</a>���������õ����кţ� 
<br>
<input name="LicenCode" type="text" value="<%=rs("LicenCode")%>" size="150"> 
<br><input type="submit" name="submit" id="submit" value="ע��" class="btn btn-primary">
</td>
</tr>
</form>
<%Rs.Close%>

<tr> 
<td>
<script src="../../AdminUser.aspx?Action=licencheck&ranstr=<%=now%>"></script>
</td>
</tr>
</table>