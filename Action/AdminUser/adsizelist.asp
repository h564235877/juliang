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
Sql="Select * From CFwztg_AdSize Order By Direction,Width Desc,Height Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
%>
<table class="tb_2">
<td>
<span class="title">���ߴ��б�</span>
<a href="?Action=adsizeadd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>�������ߴ�</span></a>
</td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td>���</td>
<td>����</td>
<td>��x��</td>
<td>����</td>
</tr>
  <%
I=0
While Not Rs.Eof
I=I+1
%>
<tr class="tr_2"> 
<td><%=I%></td>
<td>
<%
If Rs("Direction")=1 Then
 Response.write "����"
ElseIf Rs("Direction")=2 Then
 Response.write "����"
ElseIf Rs("Direction")=3 Then
 Response.write "����"
End If
%>
</td>
<td><%=Rs("Width")%>x<%=Rs("Height")%></td>
<td>
<a href="?Action=adsizemodify&ID=<%=rs("ID")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>�޸�</a>
<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=adsizedel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>ɾ��</a>
</td>
</tr>
<%
Rs.MoveNext
Wend
%>
</table>
     