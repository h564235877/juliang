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
Px=ChkStr(Request("Px"),1):If Px="" Then  Px="AddDate"

if IsDate(StartDate) = False Or IsDate(EndDate) = False Or Cdate(StartDate)>Cdate(EndDate) Then Call AlertBack("ʱ���ʽ�д�����һ����������ڱȵڶ������������Ҫ��!",1)

PageUrl = "?Action="&Action&"&Ad_ID="&Ad_ID&"&StartDate="&StartDate&"&EndDate="&EndDate

Call PxFilter(Px,"AddDate,Pv_Counter,Pv_Counter_DJ,Uv_Counter,Uv_Counter_DJ,Display_Counter,Display_Counter_DJ,PvIpRate,ClickPv_Counter,ClickPv_Counter_DJ,ClickUv_Counter,ClickUv_Counter_DJ,Click_Counter,Click_Counter_DJ,Reg_Counter,Order_Counter,ClickRate,User_Income_Cent,User_Income_CPC,User_Income_CPM,User_Income_CPA,User_Income_CPS")


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

Sql="Select min(b.AdName) as AdName,a.Ad_ID From CFWztg_AD_Counter_Day a inner join CFWztg_AD b on a.ad_id=b.id Where a.UserName='"&UserName&"' Group By a.Ad_ID Order By a.Ad_ID"
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("Ad_ID")&"'"
 If Request("Ad_ID")=Cstr(Rs("Ad_ID")) Then Response.Write " selected"
 Response.Write ">"&Rs("AdName")&"["&Rs("Ad_ID")&"]</option>"
Rs.MoveNext
Wend
Rs.Close
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
<td><a href="<%=PageUrl%>&Px=AddDate">����</a></td>
<td><a href="<%=PageUrl%>&Px=Pv_Counter">��ʾPV</a><br /><a href="<%=PageUrl%>&Px=Pv_Counter_DJ">�ɱ�����</a></td>
<td><a href="<%=PageUrl%>&Px=Uv_Counter">��ʾUV</a><br /><a href="<%=PageUrl%>&Px=Uv_Counter_DJ">�ɱ�����</a></td>
<td><a href="<%=PageUrl%>&Px=Display_Counter">��ʾIP</a><br /><a href="<%=PageUrl%>&Px=Display_Counter_DJ">�ɱ�����</a></td>
<td><a href="<%=PageUrl%>&Px=PvIpRate">��PV/IP�ı���</a></td>
<td><a href="<%=PageUrl%>&Px=ClickPv_Counter">���PV</a><br /><a href="<%=PageUrl%>&Px=ClickPv_Counter_DJ">�ɱ�����</a></td>
<td><a href="<%=PageUrl%>&Px=ClickUv_Counter">���UV</a><br /><a href="<%=PageUrl%>&Px=ClickUv_Counter_DJ">�ɱ�����</a></td>
<td><a href="<%=PageUrl%>&Px=Click_Counter">���IP</a><br /><a href="<%=PageUrl%>&Px=Click_Counter_DJ">�ɱ�����</a></td>
<td><a href="<%=PageUrl%>&Px=Reg_Counter">ע����</a></td>
<td><a href="<%=PageUrl%>&Px=Order_Counter">������</a></td>
<td><a href="<%=PageUrl%>&Px=ClickRate">�����</a></td>
<td><a href="<%=PageUrl%>&Px=User_Income_Cent">������</a></td>
<td><a href="<%=PageUrl%>&Px=User_Income_CPC">CPC����</a></td>
<td><a href="<%=PageUrl%>&Px=User_Income_CPM">CPV����</a></td>
<td><a href="<%=PageUrl%>&Px=User_Income_CPA">CPA����</a></td>
<td><a href="<%=PageUrl%>&Px=User_Income_CPS">CPS����</a></td>
<td></td>
</tr>
  
<%
Sql="Select "&chr(10)

Sql=Sql&"Sum(Pv_Counter) As Pv_Counter,(Sum(User_Income_Cent) / case Sum(Pv_Counter) when 0 then 1 else Sum(Pv_Counter) end ) Pv_Counter_DJ,"&chr(10)
Sql=Sql&"Sum(Uv_Counter) As Uv_Counter,(Sum(User_Income_Cent) / case Sum(Uv_Counter) when 0 then 1 else Sum(Uv_Counter) end ) Uv_Counter_DJ,"&chr(10)
Sql=Sql&"Sum(Display_Counter) As Display_Counter,(Sum(User_Income_Cent) / case Sum(Display_Counter) when 0 then 1 else Sum(Display_Counter) end ) Display_Counter_DJ,"&chr(10)

Sql=Sql&"(Sum(Pv_Counter) / case Sum(Display_Counter) when 0 then 1 else Sum(Display_Counter) end ) PvIpRate,"&chr(10)

Sql=Sql&"Sum(ClickPv_Counter) As ClickPv_Counter,(Sum(User_Income_Cent) / case Sum(ClickPv_Counter) when 0 then 1 else Sum(ClickPv_Counter) end ) ClickPv_Counter_DJ,"&chr(10)
Sql=Sql&"Sum(ClickUv_Counter) As ClickUv_Counter,(Sum(User_Income_Cent) / case Sum(ClickUv_Counter) when 0 then 1 else Sum(ClickUv_Counter) end ) ClickUv_Counter_DJ,"&chr(10)
Sql=Sql&"Sum(Click_Counter) As Click_Counter,(Sum(User_Income_Cent) / case Sum(Click_Counter) when 0 then 1 else Sum(Click_Counter) end ) Click_Counter_DJ,"&chr(10)


Sql=Sql&"Sum(a.Reg_Counter) As Reg_Counter,"&chr(10)
Sql=Sql&"Sum(a.Order_Counter) As Order_Counter,"&chr(10)
Sql=Sql&"Sum(a.User_Income_Cent) As User_Income_Cent,"&chr(10)
Sql=Sql&"Sum(a.User_Income_CPC) As User_Income_CPC,"&chr(10)
Sql=Sql&"Sum(a.User_Income_CPM) As User_Income_CPM,"&chr(10)
Sql=Sql&"Sum(a.User_Income_CPA) As User_Income_CPA,"&chr(10)
Sql=Sql&"Sum(a.User_Income_CPS) As User_Income_CPS,"&chr(10)

Sql=Sql&"(CONVERT(bigint, Sum(Click_Counter))*1000 / case Sum(Display_Counter) when 0 then 1 else Sum(Display_Counter) end ) ClickRate "&chr(10)

Sql=Sql&"From CFWztg_AD_Counter_Day a WITH(NOLOCK) inner join cfwztg_ad b WITH(NOLOCK)"&chr(10)
Sql=Sql&"on a.ad_id=b.id and a.adddate >='"&StartDate&"' and a.adddate <='"&EndDate&"'"&chr(10)
Sql=Sql&"Where 1=1 And a.UserName='"&UserName&"'"&chr(10)

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
    <td><%=Rs("Pv_Counter")%><br />��<%=FormatNumber(Rs("Pv_Counter_DJ"),5,-1,0,0)%></td>
    <td><%=Rs("Uv_Counter")%><br />��<%=FormatNumber(Rs("Uv_Counter_DJ"),5,-1,0,0)%></td>
    <td><%=Rs("Display_Counter")%><br />��<%=FormatNumber(Rs("Display_Counter_DJ"),3,-1,0,0)%></td>
    <td><%=Rs("PvIpRate")%></td>
    <td><%=Rs("ClickPv_Counter")%><br />��<%=FormatNumber(Rs("ClickPv_Counter_DJ"),2,-1,0,0)%></td>
    <td><%=Rs("ClickUv_Counter")%><br />��<%=FormatNumber(Rs("ClickUv_Counter_DJ"),2,-1,0,0)%></td>
    <td><%=Rs("Click_Counter")%><br />��<%=FormatNumber(Rs("Click_Counter_DJ"),2,-1,0,0)%></td>
    <td><%=Rs("Reg_Counter")%></td>
    <td><%=Rs("Order_Counter")%></td>
    <td><%=FormatNumber(Rs("ClickRate"),1,-1,0,0)%>��</td>
	<td>��<%=FormatNumber(Rs("User_Income_Cent"),2,-1,0,0)%></td>
    <td>��<%=FormatNumber(Rs("User_Income_CPC"),2,-1,0,0)%></td>
    <td>��<%=FormatNumber(Rs("User_Income_CPM"),2,-1,0,0)%></td>
    <td>��<%=FormatNumber(Rs("User_Income_CPA"),2,-1,0,0)%></td>
    <td>��<%=FormatNumber(Rs("User_Income_CPS"),2,-1,0,0)%></td>

    <td></td>
  </tr>
  
<%
Rs.Close


Sql="Select a.AddDate,"&chr(10)

Sql=Sql&"Sum(Pv_Counter) As Pv_Counter,(Sum(User_Income_Cent) / case Sum(Pv_Counter) when 0 then 1 else Sum(Pv_Counter) end ) Pv_Counter_DJ,"&chr(10)
Sql=Sql&"Sum(Uv_Counter) As Uv_Counter,(Sum(User_Income_Cent) / case Sum(Uv_Counter) when 0 then 1 else Sum(Uv_Counter) end ) Uv_Counter_DJ,"&chr(10)
Sql=Sql&"Sum(Display_Counter) As Display_Counter,(Sum(User_Income_Cent) / case Sum(Display_Counter) when 0 then 1 else Sum(Display_Counter) end ) Display_Counter_DJ,"&chr(10)

Sql=Sql&"(Sum(Pv_Counter) / case Sum(Display_Counter) when 0 then 1 else Sum(Display_Counter) end ) PvIpRate,"&chr(10)

Sql=Sql&"Sum(ClickPv_Counter) As ClickPv_Counter,(Sum(User_Income_Cent) / case Sum(ClickPv_Counter) when 0 then 1 else Sum(ClickPv_Counter) end ) ClickPv_Counter_DJ,"&chr(10)
Sql=Sql&"Sum(ClickUv_Counter) As ClickUv_Counter,(Sum(User_Income_Cent) / case Sum(ClickUv_Counter) when 0 then 1 else Sum(ClickUv_Counter) end ) ClickUv_Counter_DJ,"&chr(10)
Sql=Sql&"Sum(Click_Counter) As Click_Counter,(Sum(User_Income_Cent) / case Sum(Click_Counter) when 0 then 1 else Sum(Click_Counter) end ) Click_Counter_DJ,"&chr(10)


Sql=Sql&"Sum(a.Reg_Counter) As Reg_Counter,"&chr(10)
Sql=Sql&"Sum(a.Order_Counter) As Order_Counter,"&chr(10)
Sql=Sql&"Sum(a.User_Income_Cent) As User_Income_Cent,"&chr(10)
Sql=Sql&"Sum(a.User_Income_CPC) As User_Income_CPC,"&chr(10)
Sql=Sql&"Sum(a.User_Income_CPM) As User_Income_CPM,"&chr(10)
Sql=Sql&"Sum(a.User_Income_CPA) As User_Income_CPA,"&chr(10)
Sql=Sql&"Sum(a.User_Income_CPS) As User_Income_CPS,"&chr(10)

Sql=Sql&"(Sum(Click_Counter)*1000 / case Sum(Display_Counter) when 0 then 1 else Sum(Display_Counter) end ) ClickRate "&chr(10)

Sql=Sql&"From CFWztg_AD_Counter_Day a inner join cfwztg_ad b"&chr(10)

Sql=Sql&"on a.ad_id=b.id and a.adddate >='"&StartDate&"' and a.adddate <='"&EndDate&"'"&chr(10)

Sql=Sql&"Where a.UserName='"&UserName&"'"&chr(10)


If Ad_ID="" Then
ElseIf CInt(Ad_ID)<0 Then
 Sql=Sql&" And b.Ad_Class="&Abs(Ad_ID) &chr(10)
Else
 Sql=Sql&" And a.Ad_ID="&Ad_ID &chr(10)
End If

Sql=Sql & " Group By a.AddDate"


If Lcase(Px)="AddDate" Then
 Sql=Sql & " Order By a."&Px&" Desc"
Else
 Sql=Sql & " Order By "&Px&" Desc"
End If


Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not rs.eof then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 rs.pagesize=20
 totalrs=rs.RecordCount
 totalpage=rs.pageCount
 mypagesize=rs.pagesize
 FixedSize=rs.pagesize
 rs.absolutepage=page
End If

While Not Rs.Eof And MyPageSize>0
PvNum=Rs("Pv_Counter")
DisplayNum=Rs("Display_Counter")
ClickNum=Rs("Click_Counter")
RegNum=Rs("Reg_Counter")
User_Income_Cent=Rs("User_Income_Cent")
%>
  <tr> 
    <td><%=Rs("AddDate")%></td>
    <td><%=Rs("Pv_Counter")%><br />��<%=FormatNumber(Rs("Pv_Counter_DJ"),5,-1,0,0)%></td>
    <td><%=Rs("Uv_Counter")%><br />��<%=FormatNumber(Rs("Uv_Counter_DJ"),5,-1,0,0)%></td>
    <td><%=Rs("Display_Counter")%><br />��<%=FormatNumber(Rs("Display_Counter_DJ"),3,-1,0,0)%></td>
    <td><%=Rs("PvIpRate")%></td>
    <td><%=Rs("ClickPv_Counter")%><br />��<%=FormatNumber(Rs("ClickPv_Counter_DJ"),2,-1,0,0)%></td>
    <td><%=Rs("ClickUv_Counter")%><br />��<%=FormatNumber(Rs("ClickUv_Counter_DJ"),2,-1,0,0)%></td>
    <td><%=Rs("Click_Counter")%><br />��<%=FormatNumber(Rs("Click_Counter_DJ"),2,-1,0,0)%></td>
    <td><%=Rs("Reg_Counter")%></td>
    <td><%=Rs("Order_Counter")%></td>
    <td><%=FormatNumber(Rs("ClickRate"),1,-1,0,0)%>��</td>
	<td><%=FormatNumber(Rs("User_Income_Cent"),2,-1,0,0)%></td>
    <td><%=FormatNumber(Rs("User_Income_CPC"),2,-1,0,0)%></td>
    <td><%=FormatNumber(Rs("User_Income_CPM"),2,-1,0,0)%></td>
    <td><%=FormatNumber(Rs("User_Income_CPA"),2,-1,0,0)%></td>
    <td><%=FormatNumber(Rs("User_Income_CPS"),2,-1,0,0)%></td>

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



<table class="tb_2">
<tr>
<td>
<div class="explain">
������������<br><br>
��ʾIP:�豸����IP���䣬����ˢ�¶��ٴι��ҳ��һ��IPһ��֮��ֻ��һ�Ρ�<br>
��ʾUV:�豸����IP���ˣ������ص�cookiesû��ɾ������������豸ip�仯���ٴΣ�ˢ�¶��ٴι��ҳ��һ���豸һ��֮��ֻ��һ�Ρ�<br>
��ʾPV:��IP��Cookies���޹أ����ҳˢ��һ�μ�һ�Σ�չʾ�Ʒ�CPV������Ʒѵ��������ƣ���ֹˢ���������Ҫ�����IP��Ч������ÿ������ɱ�̫��Ч������ǿ���ơ�<br><br>

��ʾPV��IP�ı���һ�������50���ڣ�����ı�Ȼ����ˢ���ᱻ���<br /><br />

���IP:�豸����IP���䣬���۵�����ٴι�棬һ��IPһ��֮��ֻ��һ�Σ�����Ʒ�CPC������Ʒѡ�<br>
���UV:�豸����IP���ˣ������ص�cookiesû��ɾ������������豸ip�仯���ٴΣ�������ٴι�棬һ���豸һ��֮��ֻ��һ�Ρ�<br>
���PV:��IP��Cookies���޹أ������һ�μ�һ�Ρ�
</div>
</td>
</tr>
</table>

