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
Sql="Select * From CFwztg_AdSize where ID="&ID
Rs.open Sql,Conn,1,1
%>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<form name="form4" method="post" action="../../AdminUser.aspx?Action=adsizemodifysave&ID=<%=ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">�޸Ĺ��ߴ�</td>
</tr>
<tr>
<td width="60" class="td_r">����</td>
<td>
<input type="radio" name="Direction" id="Direction" value="1"<%If Rs("Direction")=1 Then Response.write " checked"%>>����
<input type="radio" name="Direction" id="Direction" value="2"<%If Rs("Direction")=2 Then Response.write " checked"%>>����
<input type="radio" name="Direction" id="Direction" value="3"<%If Rs("Direction")=3 Then Response.write " checked"%>>����
</td>
</tr>

<tr>
<td class="td_r">��ȣ�</td>
<td><input name="Width" type="text" id="Width" value="<%=Rs("Width")%>"> px</td>
</tr>
<tr> 

<td class="td_r">�߶ȣ�</td>
<td><input name="Height" type="text" id="Height" value="<%=Rs("Height")%>"> px</td>
</tr>
<tr> 
<td></td>
<td><input type="submit" name="submit" value="�޸�" class="btn btn-primary"></td>
</tr>
</table>
</form>