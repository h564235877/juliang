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

Sql="Select * From CFWztg_SetSClass Where ID="&ID
Set Rs=Conn.Execute(Sql)
%>

<a href="?Action=setsclasslist&SetBClassFlag=<%=Rs("SetBClassFlag")%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i><span>���ض������������б�</span></a>

<form name="form1" method="post" action="../../AdminUser.aspx?Action=setsclassmodifysave&ID=<%=ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">

<table class="tb_1">
<tr class="tr_1">
<td colspan="2">�������������޸�</td>
</tr>
<tr>
<td class="td_r">����������</td>
<td><input name="SetSclassDesc" type="text" id="SetSclassDesc" value="<%=Rs("SetSclassDesc")%>" size="40"<%If Rs("SetType")=1 Then Response.write " readonly style='background-color:#eeeeee'"%>></td>
</tr>
<tr>
<td class="td_r">���õ����ͣ�</td>
<td>
<input type="radio" name="SetType" value="1"<%If Rs("SetType")=1 Then Response.write " checked"%>>�ڲ�
<input type="radio" name="SetType" value="2"<%If Rs("SetType")=2 Then Response.write " checked"%>>�ⲿ
</td>
</tr>
<tr>
<td class="td_r">�������֣�</td>
<td><input name="SetTaxis" type="text" id="SetTaxis" value="<%=Rs("SetTaxis")%>" size="40">*</td>
</tr>
<tr>
<td></td>
<td>�˴��޷��޸��������õ�ֵ���޸��뷵�����б�������������������б��޸�!</td>
</tr>
<tr>
<td></td>
<td><input type="submit" name="submit" value="�޸�" class="btn btn-primary"></td>
</tr>
</table></form>
  
  