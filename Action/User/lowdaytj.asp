<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<table>
<tr> 
<td>
<select id='AdUserName' onChange="window.location=document.getElementById('AdUserName').options[document.getElementById('AdUserName').selectedIndex].value">
<option value=?Action=<%=Action%>>��ѡ������</option>
<%
Sql="Select AdUserName From CFWztg_LowUser Group By AdUserName Order By AdUserName"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='?Action="&Action&"&AdUserName="&Rs("AdUserName")&"'"
 If Request("AdUserName")=Cstr(Rs("AdUserName")) Then Response.Write " selected"
 Response.Write ">"&Rs("AdUserName")&"</option>"
Rs.MoveNext
Wend
%>
</select>
</td>
</tr> 
</table>


<%
AdUserName = ChkStr(Request("AdUserName"),1)

PageUrl = "?Action="&Action&"&AdUserName="&AdUserName
%>

<table class="tb_2">
<tr>   
<td>	
<span class="title">�û�ÿ��ͳ�Ʊ��� �����:<%=AdUserName%></span> </td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td>����</td>
<td>�û�����</td>
<td>����</td>
</tr>
<%

Sql="select AddDate,count(1) as LowNum from CFWztg_LowUser Where UserName='"&UserName&"'"
If AdUserName<>"" Then Sql=Sql&" And AdUserName='"&AdUserName&"'"
Sql=Sql&" group by AddDate Order By AddDate Desc"

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

<%
While Not Rs.Eof And MyPageSize>0
%>
  <tr> 
    <td><%=Rs("AddDate")%></td>
    <td><%=Rs("LowNum")%></td>
    <td><a href="?Action=lowview&AddDate=<%=Rs("AddDate")%>" class="btn_add"><i class="mdi mdi-eye"></i> �鿴</a></td>
  </tr>
<%
Rs2.Close
Mypagesize=Mypagesize-1
Rs.MoveNext
Wend
Rs.Close
%>
</table>


<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
