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

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_IpBlackList where ID="&ID
Rs.open Sql,Conn,1,1
%>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<form id="form_infoadd" name="form_infoadd" method="post" action="../../AdminUser.aspx?Action=ipblacklistmodifysave&ID=<%=ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>" onsubmit="return infoaddcheck()">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">IP�������޸�</td>
</tr>
<tr>
  <td class="td_r">IP��ַ��</td>
  <td><input name="Ip" type="text" id="Ip" value="<%=rs("Ip")%>" size="30">*</td>
</tr>
<tr> 
<td width="100" class="td_r">���������ͣ�</td>
<td>
<select name="IpType" id="IpType">
<option value="1"<%If rs("IpType")=1 Then Response.write " selected"%>>�ⵥ��IP</option>
<option value="2"<%If rs("IpType")=2 Then Response.write " selected"%>>��IP��C��</option>
</select>
*
</td>
</tr>
<tr>
<td class="td_r">����ʱ�䣺</td>
<td><input name="addtime" type="text" id="addtime" value="<%=rs("AddTime")%>" size="16">*</td>
</tr>
<tr> 
  <td></td>
  <td>
  <input type="submit" name="submit" id="submit" value="�޸�" class="btn btn-primary">
  </td>
</tr>
</table></form>