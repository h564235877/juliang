<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>


<form name="form2" method="post" action="../../AdminUser.aspx?Action=emailsendsave">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">�ʼ�����</td>
</tr>
<tr> 
<td width="100" class="td_r">�����ˣ�</td>
<td><input name="Email" type="text" id="Email" value="<%=ChkStr(Request("Email"),1)%>" size="62">(�������ʼ�����Ӣ�Ķ���,�ָ���</td>
</tr>
<tr>
<td class="td_r">�ʼ����⣺</td>
<td><input name="EmailSubject" type="text" id="EmailSubject" value="<%=ChkStr(Request("EmailSubject"),1)%>" size="62"></td>
</tr>
<tr> 
<td class="td_r">�ʼ����ݣ�</td>
<td><textarea name="EmailBody" cols="60" rows="7" id="EmailBody"><%=ChkStr(Request("EmailBody"),1)%></textarea></td>
</tr>
<tr> 
<td></td>
<td>
<input type="submit" name="submit" value="����" class="btn btn-primary">
</td>
</tr>
</table>
</form>