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
LowUnionUserName=ChkStr(Request("LowUnionUserName"),1)
AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then AddDate=CStr(Date)


Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_User where UserName='"&UserName&"'"
Rs.open Sql,Conn,1,1
AgentPower=Rs("AgentPower")

If AgentPower=2 Then
Response.write Rs("LowUnionUserName")
Else
Response.write "����ֻ�д����̿ɲ鿴"
Response.end
End If
%>


<script>
$(function(){

$("#search").click(function(){
 var searchurl = "?Action=<%=Action%>";
 searchurl += '&AddDate=' + $('#AddDate').val();
 searchurl += '&LowUnionUserName=' + $('#LowUnionUserName').val(); 

 location.href=searchurl;
});

});
</script>
<table style="margin-bottom:10px;">
<tr>
<td>
<select id='AddDate' name='AddDate'>
<option value="">��ѡ���ѯ����</option>
<%Sql="Select AddDate From CFWztg_LowUnion_Income Where UserName='"&UserName&"' Group By AddDate Order By AddDate Desc"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
DateSelStr=DateSelStr&"<option value='"&Rs("AddDate")&"'"
If CDate(AddDate)=Rs("AddDate") Then DateSelStr=DateSelStr&" selected":DateSel=1
DateSelStr=DateSelStr&">"&Rs("AddDate")&"</option>"
Rs.MoveNext
Wend
Rs.Close
If DateSel<>1 Then Response.write "<option value='"&Date&"' selected>"&Date&"</option>"&DateSelStr Else Response.write DateSelStr  
%>
</select>
</td>
      <td>�û�����</td>
      <td><input name="LowUnionUserName" type="text" id="LowUnionUserName" value="<%=LowUnionUserName%>" size="10"></td>
      
<td><input type="submit" name="search"  id="search" value="��ѯ" class="btn btn-sm btn-primary"></td>
    </tr>
</table>

  
<%
PageUrl = "?Action="&Action&"&LowUnionUserName="&LowUnionUserName&"&AddDate="&AddDate

Sql="Select Sum(Total_Cent) From CFWztg_LowUnion_Income Where UserName='"&UserName&"' And AddDate='"&AddDate&"'"
Set Rs = Conn.Execute(Sql)
Total_Cent = Rs(0)

Sql="Select * From CFWztg_LowUnion_Income Where UserName='"&UserName&"' And AddDate='"&AddDate&"'"
If LowUnionUserName<>"" Then Sql=Sql&" And LowUnionUserName='"&LowUnionUserName&"'"
Sql=Sql&" Order By Total_Cent Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.pagesize=50
 TotalRs=Rs.RecordCount
 TotalPage=Rs.PageCount
 MyPageSize=Rs.PageSize
 FixedSize=Rs.PageSize
 Rs.AbsolutePage=Page
End If
%>
  

<table class="tb_2">
  <tr>   
    <td>
<span class="title">�¼������û���������ͳ�� ����:<%=AddDate%> �¼������û�:<%=LowUnionUserName%></span></td>
  </tr>
</table>

<table class="tb_1">
  <tr class="tr_1"> 
    <td>�¼������û�</td>

    <td>����</td>
  </tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2"> 
    <td><%=Rs("LowUnionUserName")%></td>
    <td><%=GetTurnCent(Rs("Total_Cent"))%>Ԫ</td>
  </tr>
  <%
Mypagesize=Mypagesize-1
Rs.MoveNext
Wend
Rs.Close
%>
  <tr> 
    <td colspan="9">ͳ�ƣ��¼������û�������<%=GetTurnCent(Total_Cent)%>Ԫ</td>
  </tr>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>

