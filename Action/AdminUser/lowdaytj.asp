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
AdUserName = ChkStr(Request("AdUserName"),1)
UserName = ChkStr(Trim(Request("UserName")),1)

PageUrl = "?Action="&Action&"&AdUserName="&AdUserName&"&UserName="&UserName
%>

<table class="tb_1">
  <tr class="tr_h">   
    <td colspan="6">	
	�����:<%=AdUserName%> �û�:<%=UserName%> CPA�û�ÿ��ͳ�Ʊ���</td>
  </tr>
  <tr class="tr_1"> 
    <td>�ա���</td>
    <td>CPA�û�����</td>
    <td></td>
  </tr>
<%

Sql="select AddDate,count(1) as LowNum from CFWztg_LowUser Where 1=1"

If AdUserName<>"" Then Sql=Sql&" And AdUserName='"&AdUserName&"'"
If UserName<>"" Then Sql=Sql&" And AdUserName='"&UserName&"'"

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
    <td><a href="?Action=lowlist&AddDate=<%=Rs("AddDate")%>">[�鿴��ϸ]</a></td>
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


<form name="form_low" method="post" action="?Action=<%=Action%>">
<table class="tb_3"><tr class="tr_1"> 
      <td colspan="2">��ѯ</td>
    <tr>
      <td class="td_r">�������</td>
      <td><select name="AdUserName" id='AdUserName'>
<option value="">ȫ�������</option>
            <%
Sql="Select AdUserName From CFWztg_LowUser Group By AdUserName Order By AdUserName"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("AdUserName")&"'"
 If AdUserName=Rs("AdUserName") Then Response.Write " selected"
 Response.Write ">"&Rs("AdUserName")&"</option>"
Rs.MoveNext
Wend
%>
        </select></td>
    </tr>
	<tr>
      <td class="td_r">��վ����</td>
      <td><input name="UserName" type="text" id="UserName" value="<%=UserName%>"></td>
    </tr>
		<tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="submit" value="��ѯ" class="btn btn-sm btn-primary"></td>
	</tr>
</table></form>