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
If Request("Assort")="" Then Assort = -1 Else Assort = CInt(ChkStr(Request("Assort"),2))

If Request("IsRead_Admin")="" Then IsRead_Admin = -1 Else IsRead_Admin = CInt(ChkStr(Request("IsRead_Admin"),2))

PageUrl = "?Action="&Action&"&Assort="&Assort&"&IsRead_Admin="&IsRead_Admin
%>

<ul class="tab">
<li><a href="?Action=<%=Action%>&Assort=-1"<%If Assort=-1 Then Response.write " class='selected'"%>><span>ȫ��ϵͳ��Ϣ���û�����</span></a></li>
<li><a href="?Action=<%=Action%>&Assort=0"<%If Assort=0 Then Response.write " class='selected'"%>><span>ϵͳ��Ϣ</span></a></li>
<li><a href="?Action=<%=Action%>&Assort=1"<%If Assort=1 Then Response.write " class='selected'"%>><span>�û�����</span></a></li>
</ul>

<%If Assort=1 Then%>
<div class="tabs_header">
<ul class="tabs">
<li <%If IsRead_Admin=-1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Assort=1&IsRead_Admin=-1"><span>ȫ������</span></a></li>
<li <%If IsRead_Admin=0 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Assort=1&IsRead_Admin=0"><span>δ�ظ����û�����</span></a></li>
<li <%If IsRead_Admin=1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Assort=1&IsRead_Admin=1"><span>�ѻظ����û�����</span></a></li>
</ul>
</div>
<%End If%>

<a href="?Action=gbookadd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>��������</span></a>

<%
Sql="Select * From CFWztg_Gbook Where 1=1"

If Assort>=0 Then Sql=Sql&" And Assort="&Assort
If IsRead_Admin>=0 Then Sql=Sql&" And IsRead_Admin="&IsRead_Admin

Sql=Sql&" Order By ID Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1
 Rs.pagesize=20
 TotalRs=Rs.RecordCount
 TotalPage=Rs.PageCount
 MyPageSize=Rs.PageSize
 FixedSize=Rs.PageSize
 Rs.AbsolutePage=Page
End If
%>

<form name="form_gbooklist" id="form_gbooklist" method="post" action="../../AdminUser.aspx?Action=gbookseldel">
<table class="tb_1">
<tr class="tr_1"> 
<td><input name="chkall" type="checkbox" id="chkall" onclick="selectcheckbox(this.form)" value="check"></td>
<td>����</td>
<td>�û���</td>
<td>����</td>
<td>����ʱ��</td>
<td>����Ա�ظ�</td>
<td>�ظ�ʱ��</td>
<td>�� ��</td>
</tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2">
<td> 
<%
Response.write "<input name='ID_Sel' type='checkbox' id='ID_Sel' value='"&rs("ID")&"'>"
%>
</td>
<td>
<%If rs("Assort") = 0 Then
Response.write "ϵͳ"
ElseIf rs("Assort") = 1 Then
Response.write "��վ��"
ElseIf rs("Assort") = 2 Then
Response.write "�����"
ElseIf rs("Assort") = 3 Then
Response.write "�ͷ�"
ElseIf rs("Assort") = 4 Then
Response.write "����"
End If%>
</td>
<td><%=rs("UserName")%></td>
<td><%
'--����Աδ����ʱ
If Rs("IsRead_Admin")=0 Then
Response.write "[<font color='#ff0000'>δ�ظ�</font>]"
Else
Response.write "[�ѻظ�]"
End If

Response.write rs("Content")%></td>
<td><%=rs("AddTime")%></td>
<td><%=rs("Reply")%></td>
<td><%=rs("ReplyTime")%></td>
<td>
<a href="?Action=gbookreply&id=<%=rs("id")%>" class="btn_edit"><i class="mdi mdi-pencil"></i> �ظ�</a>

<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=gbookdel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> ɾ��</a>
</td>
</tr>
<%
MyPageSize=MyPageSize-1
Rs.MoveNext
Wend
%>
</table>
</form>
<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ��ѡ��ļ�¼��?', '', function (isConfirm) {if (isConfirm) {$('#form_gbooklist').submit();}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-window-close"></i>ɾ��ѡ��</a>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
