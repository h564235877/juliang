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
<tr class="tr_h"> 
<td colspan="4">�������޸Ļ�ɾ��</td>
</tr>
<tr class="tr_1"> 
<td>ID</td>
<td>������</td>
<td>���˵��</td>
<td>����</td>
</tr>
<%
MyStr=""

Sql="Select * From CFWztg_AgentAd Order By ID Desc"
Set Rs=Conn.Execute(Sql)

While Not Rs.Eof
%>
<form name="<%="form_"&Rs("ID")%>" id="<%="form_"&Rs("ID")%>" method="post" action="../../AdminUser.aspx?Action=agentadmodifysave&ID=<%=Rs("ID")%>">
<tr class="tr_2"> 
<td><%=Rs("ID")%></td>
<td><textarea name="AdCode" cols="40" rows="6" id="textarea"><%=Rs("AdCode")%></textarea></td>
<td><textarea name="AdDesc" cols="40" rows="6" id="textarea"><%=Rs("AdDesc")%></textarea></td>
<td>
<a href="#" onclick="document.getElementById('<%="form_"&Rs("ID")%>').submit();" class="btn_edit"><i class="mdi mdi-pencil"></i> �޸�</a>

<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=agentaddel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> ɾ��</a>
</td>
</tr>
</form>
<%
Rs.MoveNext
Wend
%>
<tr class="tr_1"> 
<td colspan="4">����������</td>
</tr>
<tr class="tr_2"> 
<td></td>
<td>������ID</td>
<td>���˵��</td>
<td>����</td>
</tr>

<form name="agentadadd" id="agentadadd" method="post" action="../../AdminUser.aspx?Action=agentadaddsave">
<tr class="tr_2"> 
<td></td>
<td>
<textarea name="AdCode" cols="40" rows="6" id="AdCode"></textarea>
<br>֧�ֲ�����{username},{userid}
</td>
<td>
<textarea name="AdDesc" cols="40" rows="6" id="AdDesc"></textarea><br>֧��html����
</td>
<td><a href="javascript:document.getElementById('agentadadd').submit();" class="btn_add"><i class="fa fa-plus"></i> ����</a>
</td>
</tr>
</form>
<tr> 
<td colspan="4"></td>
</tr>
</table>
