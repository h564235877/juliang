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

PageUrl = "?Action="&Action&"&Assort="&Assort

Sql="Select * From CFWztg_Gbook Where UserName='"&UserName&"'"
If Assort>=0 Then Sql=Sql&" And Assort="&Assort
Sql=Sql&" Order By ID Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not rs.eof then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 rs.pagesize=20
 totalrs=rs.RecordCount
 totalpage=rs.pageCount
 mypagesize=rs.pagesize
 FixedSize=Rs.PageSize
 rs.absolutepage=page
End If
%>


<div class="tabs_header">
<ul class="tabs">
<li <%If Assort=-1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Assort=-1"><span>������Ϣ</span></a></li>
<li <%If Assort=0 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Assort=0"><span>ϵͳ��Ϣ</span></a></li>
<li <%If Assort=1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Assort=1"><span>�û�����</span></a></li>
<a href="?Action=gbookadd" class="actionBtn add" style="margin-top:10px;"><i class="mdi mdi-plus"></i><span>��Ҫ����</span></a>
</ul>
</div>

<table class="tb_1">
  <tr  class="tr_1">     
    <td>����</td>
    <td>����</td>
    <td>����ʱ��</td>
	<td>����Ա�Ƿ����</td>
    <td>����Ա�ظ�</td>
    <td>�ظ�ʱ��</td>
</tr>
<%
While not rs.eof and mypagesize>0
%>
  <tr class="tr_2"> 
    <td><%If rs("Assort")=0 Then Response.write "ϵͳ��Ϣ" Else Response.write "�û�����"%></td>
    <td><%=rs("Content")%></td>
    <td><%=rs("AddTime")%></td>
    <td><%
If Rs("IsRead_Admin")=0 Then
 Response.write "δ����"
ElseIf Rs("IsRead_Admin")=1 Then
 Response.write "�Ѳ���"
End If
%></td>
    <td><%
'--����Ա�Ѳ����û�δ��ʶ�Ѷ�ʱ	
If Rs("IsRead_Admin")=1 And Rs("IsRead_User")=0 Then Response.write "[<a href='../../User.aspx?Action=gbookmodifysave&ID="&Rs("ID")&"'><font color='#ff0000'>��ʶ�Ѷ�</font></a>]"

 Response.write rs("Reply")
%></td>
<td><%=rs("ReplyTime")%></td>
</tr>
<%
mypagesize=mypagesize-1
rs.movenext
Wend
Rs.Close
%>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
