<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>



<div class="tabs_header">
<ul class="tabs">
<li <%If Action="othertj" Then Response.write " class='active'"%>><a href="?Action=othertj"><span>����ͳ��</span></a></li>
<li <%If Action="lowuniondaytjbyusername" Then Response.write " class='active'"%>><a href="?Action=lowuniondaytjbyusername"><span>���ع����ͳ��(�û���)</span></a></li>
<li <%If Action="lowuniondaytjbyuserid" Then Response.write " class='active'"%>><a href="?Action=lowuniondaytjbyuserid"><span>���ع����ͳ��(�û�ID)</span></a></li>
</ul>
</div>


<%
LowUnionUserName=ChkStr(Request("LowUnionUserName"),1)
Ad_ID=ChkStr(Request("Ad_ID"),2)
AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then AddDate=CStr(Date)
Px=ChkStr(Request("Px"),1):If Px="" Then Px="ClickUv_Counter"

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_User where UserName='mytest'"'--����̶���mytest����ÿ���¼��û�����ͳ��
Rs.open Sql,Conn,1,1
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
<table style="margin-top:10px;margin-bottom:10px;">
<tr>
<td>
<select id='AddDate' name='AddDate'>
<option value="">��ѡ���ѯ����</option>
<%Sql="Select AddDate From CFWztg_LowUnion_Counter_Day Where UserName='mytest' Group By AddDate Order By AddDate Desc"
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

      <td>�¼��û�����</td>
      <td><input name="LowUnionUserName" type="text" id="LowUnionUserName" value="<%=LowUnionUserName%>" size="10"></td>
      <td>&nbsp;</td>
      <td>���ID��</td>
      <td><select id='Ad_ID' name="Ad_ID">

<option value="">���й��</option>
<%
Sql="Select min(b.AdName) as AdName,a.Ad_ID From CFWztg_LowUnion_Counter_Day a inner join CFWztg_AD b on a.ad_id=b.id Where a.UserName='mytest' Group By a.Ad_ID Order By a.Ad_ID"
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

Call PxFilter(Px,"UserID,LowUnionUserName,Pv_Counter,Uv_Counter,Display_Counter,ClickPv_Counter,ClickUv_Counter,Click_Counter,Reg_Counter")


%>
  
<table class="tb_2">
  <tr> 
    <td colspan="9">
<span class="title">�¼��û���������ͳ�� ����:<%=AddDate%> �¼������û�:<%=LowUnionUserName%> ���:<%If Ad_ID="" Then Response.write "ȫ�����"  Else Response.write Ad_ID%></span></td>
  </tr>
  
  </table>

<table class="tb_1">

  <tr class="tr_1"> 
    <td>�¼�ID</td>
    <td>�¼��û�</td>
    <td>���ع����UV����</td>
	<td>����Ĺ����ʾIP</td>
    <td>���ع����UV/��ʾIP����</td>
	<td>����Ĺ����ʾPV</td>
    <td>���ع����UV/��ʾPV����</td>
  </tr>
  
<%
Sql="Select Sum(a.ClickUv_Counter) As A_ClickUv_Counter,"&chr(10)

Sql=Sql & "Sum(c.Display_Counter) As C_Display_Counter,(Sum(a.ClickUv_Counter)*1000 / case Sum(c.Display_Counter) when 0 then 1 else Sum(c.Display_Counter) end ) C_Display_Counter_Rate,"&chr(10)
Sql=Sql & "Sum(c.Pv_Counter) As C_Pv_Counter,(Sum(a.ClickUv_Counter)*1000 / case Sum(c.Pv_Counter) when 0 then 1 else Sum(c.Pv_Counter) end ) C_Pv_Counter_Rate"&chr(10)

Sql=Sql & " From CFWztg_LowUnion_Counter_Day a"&chr(10)
Sql=Sql & " inner join cfwztg_user b on a.LowUnionUserName=convert(varchar,b.ID) inner join (select max(UserName) UserName,max(AddDate) AddDate,sum(Display_Counter) Display_Counter,sum(Pv_Counter) Pv_Counter from CFWztg_AD_Counter_Day where AddDate='"&AddDate&"' group by username) c"&chr(10)
Sql=Sql & " on a.UserName='mytest' and b.UserName=c.UserName and a.AddDate=c.AddDate Where a.AddDate='"&AddDate&"'"&chr(10)

If LowUnionUserName<>"" Then Sql=Sql & " And b.UserName='"&LowUnionUserName&"'"&chr(10)
If Ad_ID<>"" Then Sql=Sql & " And a.Ad_ID="&Ad_ID&chr(10)

Sql=Sql & " Order By  C_Pv_Counter Desc"



Set Rs = Conn.Execute(Sql)
%>

  <tr class="tr_3"> 
    <td>����</td>
    <td></td>
    <td><%=Rs("A_ClickUv_Counter")%></td>
	<td><%=Rs("C_Display_Counter")%></td>
	<td><%=Rs("C_Display_Counter_Rate")%>��</td>
    <td><%=Rs("C_Pv_Counter")%></td>
    <td><%=Rs("C_Pv_Counter_Rate")%>��</td>
  </tr>
<%
Rs.Close

'--LowUnionUserName�Ǵ������ID

Sql="Select max(b.UserName) UserName,a.LowUnionUserName,Sum(a.ClickUv_Counter) As A_ClickUv_Counter,"&chr(10)

Sql=Sql & "Sum(c.Display_Counter) As C_Display_Counter,(Sum(a.ClickUv_Counter)*1000 / case Sum(c.Display_Counter) when 0 then 1 else Sum(c.Display_Counter) end ) C_Display_Counter_Rate,"&chr(10)
Sql=Sql & "Sum(c.Pv_Counter) As C_Pv_Counter,(Sum(a.ClickUv_Counter)*1000 / case Sum(c.Pv_Counter) when 0 then 1 else Sum(c.Pv_Counter) end ) C_Pv_Counter_Rate"&chr(10)

Sql=Sql & " From CFWztg_LowUnion_Counter_Day a"&chr(10)
Sql=Sql & " inner join cfwztg_user b on a.LowUnionUserName=convert(varchar,b.ID) inner join (select max(UserName) UserName,max(AddDate) AddDate,sum(Display_Counter) Display_Counter,sum(Pv_Counter) Pv_Counter from CFWztg_AD_Counter_Day where AddDate='"&AddDate&"' group by username) c"&chr(10)
Sql=Sql & " on a.UserName='mytest' and b.UserName=c.UserName and a.AddDate=c.AddDate Where  a.AddDate='"&AddDate&"'"&chr(10)

If LowUnionUserName<>"" Then Sql=Sql & " And b.UserName='"&LowUnionUserName&"'"&chr(10)
If Ad_ID<>"" Then Sql=Sql & " And a.Ad_ID="&Ad_ID&chr(10)

Sql=Sql & " Group By a.LowUnionUserName Order By  C_Pv_Counter Desc"



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

While Not Rs.Eof And MyPageSize>0
%>
  <tr> 
    <td><%=Rs("LowUnionUserName")%></td>
    <td><%=Rs("UserName")%></td>
    <td><%=Rs("A_ClickUv_Counter")%></td>
    <td><%=Rs("C_Display_Counter")%></td>
    <td><%=Rs("C_Display_Counter_Rate")%>��</td>
    <td><%=Rs("C_Pv_Counter")%></td>
    <td><%=Rs("C_Pv_Counter_Rate")%>��</td>
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


