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
AD_ID=ChkStr(Request("AD_ID"),2)
StartDate=ChkStr(Request("StartDate"),3):If StartDate="" Then StartDate=DateAdd("m",-2,date())
EndDate=ChkStr(Request("EndDate"),3):If EndDate="" Then EndDate=Date()

if IsDate(StartDate) = False Or IsDate(EndDate) = False Or Cdate(StartDate)>Cdate(EndDate) Then Call AlertBack("ʱ���ʽ�д�����һ����������ڱȵڶ������������Ҫ��!",1)

PageUrl = "?Action="&Action&"&Ad_ID="&Ad_ID&"&StartDate="&StartDate&"&EndDate="&EndDate

If Ad_ID="" Then
 AdTitle="ȫ�����"
ElseIf CInt(Ad_ID)<0 Then
 AdTitle="�ƻ�"&Abs(AD_ID) 
Else
 AdTitle="���"&AD_ID
End If
%>

<script language=javascript src="../../js/calendar.js"></script>

<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>";
 searchurl += '&Ad_ID=' + $('#Ad_ID').val();
 searchurl += '&StartDate=' + $('#StartDate').val();
 searchurl += '&EndDate=' + $('#EndDate').val();

 location.href=searchurl;
});

});
</script>
<table class="tb_2">
<tr> 
<td>
<select id='Ad_ID' name='Ad_ID'>
<option value="">ȫ�����</option>
<%
Sql="Select ID,PlanName From CFWztg_Plan Where PlanState=2"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='-" & Rs("ID")&"'"
 If Ad_ID=Cstr("-" & Rs("ID")) Then Response.Write " selected"
 Response.Write ">���ƻ���"&Rs("PlanName")&"["&Rs("ID")&"]</option>"
Rs.MoveNext
Wend
Rs.Close

Sql="Select min(b.AdName) as AdName,a.Ad_ID From CFWztg_AD_Counter_Day a inner join CFWztg_AD b on a.ad_id=b.id Where b.AdUserName='"&AdUserName&"' Group By a.Ad_ID Order By a.Ad_ID"

Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("Ad_ID")&"'"
 If Request("Ad_ID")=Cstr(Rs("Ad_ID")) Then Response.Write " selected"
 Response.Write ">"&Rs("AdName")&"["&Rs("Ad_ID")&"]</option>"
Rs.MoveNext
Wend
%>
</select>
��
<input name="StartDate" type="text" id="StartDate" value="<%=StartDate%>" size="10" onclick="fPopCalendar(event,this,this)" onfocus="this.select()"  />
��
<input name="EndDate" type="text" id="EndDate" value="<%=EndDate%>" size="10" onclick="fPopCalendar(event,this,this)" onfocus="this.select()" />

<input type="submit" name="submit" value="��ѯ" class="btn btn-sm btn-primary" id="search" />

<%
v1=weekday(date)

Response.write "&nbsp;&nbsp;&nbsp;&nbsp;<a href='?Action="&action&"&StartDate="&date()-1&"&EndDate="&date()-1&"'>����</a>"

Response.write "&nbsp;&nbsp;&nbsp;&nbsp;<a href='?Action="&action&"&StartDate="&date()&"&EndDate="&date()&"'>����</a>"

Response.write "&nbsp;&nbsp;&nbsp;&nbsp;<a href='?Action="&action&"&StartDate="&dateadd("d",1-v1-7,date)&"&EndDate="&dateadd("d",1-v1-1,date)&"'>����</a>"

Response.write "&nbsp;&nbsp;&nbsp;&nbsp;<a href='?Action="&action&"&StartDate="&dateadd("m",-1,year(date)&"-"&month(date)&"-1")&"&EndDate="&dateadd("d",-1,year(date)&"-"&month(date)&"-1")&"'>����</a>"

Response.write "&nbsp;&nbsp;&nbsp;&nbsp;<a href='?Action="&action&"&StartDate="&dateadd("d",1-v1,date)&"&EndDate="&date&"'>����</a>"

Response.write "&nbsp;&nbsp;&nbsp;&nbsp;<a href='?Action="&action&"&StartDate="&year(date)&"-"&month(date)&"-1&EndDate="&date&"'>����</a>"
%>
</td>
</tr>
</table>


<table class="tb_1">
  <tr class="tr_1"> 
    <td>�ա���</td>
    <td>��ʾPV</td>
    <td>��ʾUV</td>
    <td>��ʾIP</td>
    <td>���PV</td>
	<td>���UV</td>
	<td>���IP</td>
    <td>ע����</td>
    <td>�����</td>
	<td>����</td>
    <td></td>
  </tr>
<%
Sql="Select Sum(a.Reg_Counter) As Reg_Counter,Sum(a.Pv_2_Counter) As Pv_2_Counter,Sum(a.Uv_2_Counter) As Uv_2_Counter,Sum(a.Display_2_Counter) As Display_2_Counter,Sum(a.ClickPv_2_Counter) As ClickPv_2_Counter,Sum(a.ClickUv_2_Counter) As ClickUv_2_Counter,Sum(a.Click_2_Counter) As Click_2_Counter,Sum(a.AdUser_Spend_Cent) As AdUser_Spend_Cent  From CFWztg_AD_Counter_Day a inner join cfwztg_ad b"&chr(10)

Sql=Sql&"on a.ad_id=b.id and a.adddate >='"&StartDate&"' and a.adddate <='"&EndDate&"'"&chr(10)

Sql=Sql&"Where b.AdUserName='"&AdUserName&"'"&chr(10)

If Ad_ID="" Then
ElseIf CInt(Ad_ID)<0 Then
 Sql=Sql&"And b.Plan_ID="&Abs(Ad_ID)
Else
 Sql=Sql&"And a.Ad_ID="&Ad_ID
End If

Set Rs=Conn.Execute(Sql)
%>
  
  <tr class="tr_3"> 
    <td>����</td>
    <td><%=Rs("Pv_2_Counter")%></td>
    <td><%=Rs("Uv_2_Counter")%></td>
    <td><%=Rs("Display_2_Counter")%></td>
    <td><%=Rs("ClickPv_2_Counter")%></td>
    <td><%=Rs("ClickUv_2_Counter")%></td>
    <td><%=Rs("Click_2_Counter")%></td>
    <td><%=Rs("Reg_Counter")%></td>
    <td><%=FormatNumber(MyRate2(Rs("Click_2_Counter"),Rs("Display_2_Counter")),1,-1,0,0)%>��</td>
	<td>��<%=FormatNumber(Rs("AdUser_Spend_Cent"),2,-1,0,0)%></td>
    <td></td>
  </tr>
<%
Rs.Close


Sql="Select a.AddDate,Sum(a.Reg_Counter) As Reg_Counter,Sum(a.Pv_2_Counter) As Pv_2_Counter,Sum(a.Uv_2_Counter) As Uv_2_Counter,Sum(a.Display_2_Counter) As Display_2_Counter,Sum(a.ClickPv_2_Counter) As ClickPv_2_Counter,Sum(a.ClickUv_2_Counter) As ClickUv_2_Counter,Sum(a.Click_2_Counter) As Click_2_Counter,Sum(a.AdUser_Spend_Cent) As AdUser_Spend_Cent From CFWztg_AD_Counter_Day a WITH(NOLOCK) inner join cfwztg_ad b WITH(NOLOCK)"&chr(10)

Sql=Sql&"on a.ad_id=b.id and a.adddate >='"&StartDate&"' and a.adddate <='"&EndDate&"'"&chr(10)

Sql=Sql&"Where b.AdUserName='"&AdUserName&"'"&chr(10)

If Ad_ID="" Then
ElseIf CInt(Ad_ID)<0 Then
 Sql=Sql&"And b.Plan_ID="&Abs(Ad_ID)
Else
 Sql=Sql&"And a.Ad_ID="&Ad_ID
End If

Sql=Sql & " Group By a.AddDate Order By a.AddDate Desc"

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
    <td><%=Rs("Pv_2_Counter")%></td>
    <td><%=Rs("Uv_2_Counter")%></td>
    <td><%=Rs("Display_2_Counter")%></td>
    <td><%=Rs("ClickPv_2_Counter")%></td>
    <td><%=Rs("ClickUv_2_Counter")%></td>
    <td><%=Rs("Click_2_Counter")%></td>
    <td><%=Rs("Reg_Counter")%></td>
    <td><%=FormatNumber(MyRate2(Rs("Click_2_Counter"),Rs("Display_2_Counter")),1,-1,0,0)%>��</td>
	<td><%=FormatNumber(Rs("AdUser_Spend_Cent"),2,-1,0,0)%>Ԫ</td>
    <td><a href="?Action=daytjdetail&Ad_ID=<%=Ad_ID%>&AddDate=<%=Rs("AddDate")%>" class="btn_add"><i class="mdi mdi-eye"></i> ��ϸ</a></td>
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
