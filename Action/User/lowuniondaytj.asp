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
Ad_ID=ChkStr(Request("Ad_ID"),2)
AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then AddDate=CStr(Date)
Px=ChkStr(Request("Px"),1):If Px="" Then Px="click_counter"

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
 searchurl += '&Ad_ID=' + $('#Ad_ID').val(); 

 location.href=searchurl;
});

});
</script>
<table style="margin-bottom:10px;">
<tr>
<td>
<select id='AddDate' name='AddDate'>
<option value="">��ѡ���ѯ����</option>
<%Sql="Select AddDate From CFWztg_LowUnion_Counter_Day Where UserName='"&UserName&"' Group By AddDate Order By AddDate Desc"
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
      <td>���ID��</td>
      <td><select id='Ad_ID' name="Ad_ID">

<option value="">���й��</option>
<%
Sql="Select min(b.AdName) as AdName,a.Ad_ID From CFWztg_LowUnion_Counter_Day a inner join CFWztg_AD b on a.ad_id=b.id Where a.UserName='"&UserName&"' Group By a.Ad_ID Order By a.Ad_ID"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("Ad_ID")&"'"
 If Request("Ad_ID")=Cstr(Rs("Ad_ID")) Then Response.Write " selected"
 Response.Write ">"&Rs("AdName")&"["&Rs("Ad_ID")&"]</option>"
Rs.MoveNext
Wend
%>

</select></td>
<td><input type="submit" name="search"  id="search" value="��ѯ" class="btn btn-sm btn-primary"></td>
</tr>
</table>




  
<%
PageUrl = "?Action="&Action&"&LowUnionUserName="&LowUnionUserName&"&Ad_ID="&Ad_ID&"&AddDate="&AddDate

Call PxFilter(Px,"LowUnionUserName,Pv_Counter,Uv_Counter,Display_Counter,ClickPv_Counter,ClickUv_Counter,Click_Counter,Reg_Counter")

Sql="Select Sum(Display_Counter),Sum(Click_Counter),Sum(Reg_Counter) From CFWztg_LowUnion_Counter_Day Where UserName='"&UserName&"' And AddDate='"&AddDate&"'"
Set Rs = Conn.Execute(Sql)
DisplayTotal = Rs(0)
ClickTotal = Rs(1)
RegTotal = Rs(2)

Sql="Select LowUnionUserName,Sum(Pv_Counter) As Pv_Counter,Sum(Uv_Counter) As Uv_Counter,Sum(Display_Counter) As Display_Counter,Sum(ClickPv_Counter) As ClickPv_Counter,Sum(ClickUv_Counter) As ClickUv_Counter,Sum(Click_Counter) As Click_Counter,Sum(Reg_Counter) As Reg_Counter From CFWztg_LowUnion_Counter_Day Where UserName='"&UserName&"' And AddDate='"&AddDate&"'"

If LowUnionUserName<>"" Then Sql=Sql&" And LowUnionUserName='"&LowUnionUserName&"'"
If Ad_ID<>"" Then Sql=Sql&" And Ad_ID="&Ad_ID

Sql=Sql&" Group By LowUnionUserName Order By "&Px&" Desc"

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
    <td colspan="9">
<span class="title">�¼������û���������ͳ�� ����:<%=AddDate%> �¼������û�:<%=LowUnionUserName%> ���:<%If Ad_ID="" Then Response.write "ȫ�����"  Else Response.write Ad_ID%></span></td>
  </tr>
  
  </table>

<table class="tb_1">
  <tr class="tr_1"> 
    <td><a href="<%=PageUrl%>&Px=LowUnionUserName">�¼������û�</a></td>
    <td><a href="<%=PageUrl%>&Px=Pv_Counter">��ʾPV</a></td>
	<td><a href="<%=PageUrl%>&Px=Uv_Counter">��ʾUV</a></td>
	<td><a href="<%=PageUrl%>&Px=Display_Counter">��ʾIP</a></td>
	<td><a href="<%=PageUrl%>&Px=ClickPv_Counter">���PV</a></td>
	<td><a href="<%=PageUrl%>&Px=ClickUv_Counter">���UV</a></td>
    <td><a href="<%=PageUrl%>&Px=Click_Counter">���IP</a></td>
    <td><a href="<%=PageUrl%>&Px=Reg_Counter">ע����</a></td>
  </tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
  <tr> 
    <td><%=Rs("LowUnionUserName")%></td>
    <td><%=Rs("Pv_Counter")%></td>
    <td><%=Rs("Uv_Counter")%></td>
    <td><%=Rs("Display_Counter")%></td>
    <td><%=Rs("ClickPv_Counter")%></td>
    <td><%=Rs("ClickUv_Counter")%></td>
    <td><%=Rs("Click_Counter")%></td>
	<td><%=Rs("Reg_Counter")%></td>
  </tr>
  <%
Mypagesize=Mypagesize-1
Rs.MoveNext
Wend
Rs.Close
%>

</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>


