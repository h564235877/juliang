<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<table class="tb_2">
<tr>
<td>
<div class="explain">
��ʱ����Ա�ϵͳ���в��ԣ����ڷ����׻��������޷�ʵ�֣����Ա����ܿ��������ϵͳ��������IP��Cookie��<br />
ע���˲���ֻ���㱾��һ̨��Ч������Ӱ���ĵ��Եķ����׹��ܣ�</div>
</td>
</tr>
</table>

<form name="form3" method="post" action="../../AdminUser.aspx?Action=testsetsave">
<table class="tb_1">
<tr> 
<td class="td_r">ɾ��ָ����IP��¼</td>
<%
If Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" Then
 MyIp = ChkStr(Request.ServerVariables("REMOTE_ADDR"),1)
Else
 MyIp = ChkStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"),1)
 If InStr(MyIp, ",") > 0 Then MyIp = ChkStr(Left(MyIp, InStr(MyIp, ",") - 1),1)
End If
%>
<td><input name="IP" type="text" value="<%=MyIp%>">(Ĭ�������Լ���IP)</td>
</tr>
<tr> 
<td></td>
<td>
<input type="submit" name="submit" value="ɾ��" class="btn btn-primary">
</td>
</tr>
</table>
</form>