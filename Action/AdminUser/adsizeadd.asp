<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<form name="form4" method="post" action="../../AdminUser.aspx?Action=adsizeaddsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">���ӹ��ߴ�</td>
</tr>
<tr>
<td width="60" class="td_r">����</td>
<td>
<input type="radio" name="Direction" id="Direction" value="1" />����
<input type="radio" name="Direction" id="Direction" value="2" />����
<input type="radio" name="Direction" id="Direction" value="3" />����
</td>
</tr>
<tr>
<td class="td_r">��ȣ�</td>
<td><input name="Width" type="text" id="Width">px</td>
</tr>
<tr> 
<td class="td_r">�߶ȣ�</td>
<td><input name="Height" type="text" id="Height">px</td>
</tr>
<tr> 
<td></td>
<td><input type="submit" name="submit" value="����" class="btn btn-primary"></td>
</tr>
</table>
</form>