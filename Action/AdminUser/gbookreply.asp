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
ID=ChkStr(request("ID"),2)

RefUrl=ChkStr(Request.ServerVariables("Http_Referer"),1) 

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_Gbook where ID="&ID
Rs.open Sql,Conn,1,1
%>

<a href="<%=RefUrl%>" class="actionBtn" style="margin-top:10px;"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<form name="form2" method="post" action="../../AdminUser.aspx?Action=gbookreplysave&ID=<%=ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1"><tr class="tr_1"> 
<td colspan="2">���Իظ�</td>
</tr>
<tr>
<td width="90" class="td_r">���ݣ�</td>
<td><%=Rs("Content")%></td>
</tr>
<tr>
<td class="td_r"> �ظ����ݣ�</td>
<td><textarea name="Reply" cols="60" rows="7" id="textarea"><%=rs("Reply")%></textarea></td>
</tr>
<tr>
<td></td>
<td>
<input type="submit" name="submit" value="�ظ���ͬʱ��ʶ�Ѷ�" class="btn btn-primary">
</td>
</tr>
</table>
</form>