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
UserName=ChkStr(Request("UserName"),1)
Ad_ID=ChkStr(Request("Ad_ID"),2)
AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then AddDate=CStr(Date)
Px=ChkStr(Request("Px"),1):If Px="" Then Px="User_Income_Cent"
%>


<script>
$(function(){

$("#search").click(function(){
 var searchurl = "?Action=<%=Action%>";
 searchurl += '&AddDate=' + $('#AddDate').val();
 searchurl += '&UserName=' + $('#UserName').val();
 searchurl += '&Ad_ID=' + $('#Ad_ID').val(); 

 location.href=searchurl;
});

});
</script>

<table style="margin-bottom:10px;">
<tr> 

<td><select id='AddDate' name='AddDate'>
<option value=?Action=<%=Action%>>��ѡ���ѯ����</option>
<%Sql="Select AddDate From CFWztg_AD_Counter_Day Group By AddDate Order By AddDate Desc"
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
</select></td>
<td>��վ����</td>
<td><input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="10"></td>
<td>���ID��</td>
<td><select id='Ad_ID' name="Ad_ID">

<option value="">���й��</option>
<%
Sql="Select min(b.AdName) as AdName,a.Ad_ID From CFWztg_AD_Counter_Day a inner join cfwztg_ad b on a.ad_id=b.id Where 1=1 Group By a.Ad_ID Order By a.Ad_ID"
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
PageUrl = "?Action="&Action&"&UserName="&UserName&"&Ad_ID="&Ad_ID&"&AddDate="&AddDate

Call PxFilter(Px,"UserName,Pv_Counter,Pv_Counter_DJ,Uv_Counter,Uv_Counter_DJ,Display_Counter,Display_Counter_DJ,PvIpRate,ClickPv_Counter,ClickPv_Counter_DJ,ClickUv_Counter,ClickUv_Counter_DJ,Click_Counter,Click_Counter_DJ,Reg_Counter,Order_Counter,ClickRate,User_Income_Cent,User_Income_CPC,User_Income_CPM,User_Income_CPA,User_Income_CPS")


%>
  
<table class="tb_2">
<tr>
<td>
<div class="explain">
������������,�б���ע������Ϊ��ʾ���������ʵ��δ�۵�����ֻ��������Ϊ��ʾ����վ���Ŀ۹��������ֻ���</div>
</td>
</tr>

</table>

<table class="tb_1">
<tr class="tr_1"> 
<td><a href="<%=PageUrl%>&Px=UserName">�û�</a></td>
<td><a href="<%=PageUrl%>&Px=Pv_Counter">��ʾPV</a><br /><a href="<%=PageUrl%>&Px=Pv_Counter_DJ">�ɱ�����</a></td>
<td><a href="<%=PageUrl%>&Px=Uv_Counter">��ʾUV</a><br /><a href="<%=PageUrl%>&Px=Uv_Counter_DJ">�ɱ�����</a></td>
<td><a href="<%=PageUrl%>&Px=Display_Counter">��ʾIP</a><br /><a href="<%=PageUrl%>&Px=Display_Counter_DJ">�ɱ�����</a></td>
<td><a href="<%=PageUrl%>&Px=PvIpRate">��ʾPV��<br />IP�ı���</a></td>
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
<td>��ϸ</td>
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

Sql=Sql&"Sum(Reg_Counter) As Reg_Counter,"&chr(10)
Sql=Sql&"Sum(Order_Counter) Order_Counter,"&chr(10)

Sql=Sql&"(Sum(Click_Counter)*1000 / case Sum(Display_Counter) when 0 then 1 else Sum(Display_Counter) end ) ClickRate,"&chr(10)

Sql=Sql&"Sum(Pv_2_Counter) As Pv_2_Counter,"&chr(10)
Sql=Sql&"Sum(Uv_2_Counter) As Uv_2_Counter,"&chr(10)
Sql=Sql&"Sum(Display_2_Counter) As Display_2_Counter,"&chr(10)
Sql=Sql&"Sum(ClickPv_2_Counter) As ClickPv_2_Counter,"&chr(10)
Sql=Sql&"Sum(ClickUv_2_Counter) As ClickUv_2_Counter,"&chr(10)
Sql=Sql&"Sum(Click_2_Counter) As Click_2_Counter,"&chr(10)
Sql=Sql&"Sum(Reg_2_Counter) Reg_2_Counter,"&chr(10)
Sql=Sql&"Sum(Order_2_Counter) Order_2_Counter,"&chr(10)

Sql=Sql&"sum(User_Income_Cent) as User_Income_Cent,"&chr(10)
Sql=Sql&"sum(User_Income_CPC) as User_Income_CPC,"&chr(10)
Sql=Sql&"sum(User_Income_CPM) as User_Income_CPM,"&chr(10)
Sql=Sql&"sum(User_Income_CPA) as User_Income_CPA,"&chr(10)
Sql=Sql&"sum(User_Income_CPS) as User_Income_CPS,"&chr(10)

Sql=Sql&"sum(AdUser_Spend_Cent) as AdUser_Spend_Cent,"&chr(10)
Sql=Sql&"sum(AdUser_Spend_CPC) as AdUser_Spend_CPC,"&chr(10)
Sql=Sql&"sum(AdUser_Spend_CPM) as AdUser_Spend_CPM,"&chr(10)
Sql=Sql&"sum(AdUser_Spend_CPA) as AdUser_Spend_CPA,"&chr(10)
Sql=Sql&"sum(AdUser_Spend_CPS) as AdUser_Spend_CPS"&chr(10)

Sql=Sql&"From CFWztg_AD_Counter_Day WITH(NOLOCK) Where AddDate='"&AddDate&"'"&chr(10)

If UserName<>"" Then Sql=Sql&" And UserName='"&UserName&"'"
If Ad_ID<>"" Then Sql=Sql&" And Ad_ID="&Ad_ID


Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1


%>

<tr class="tr_3"> 
<td>����</td>
<td><%=Rs("Pv_Counter")%><br />(<%=Rs("Pv_2_Counter")%>)<br />��<%=FormatNumber(Rs("Pv_Counter_DJ"),5,-1,0,0)%></td>
<td><%=Rs("Uv_Counter")%><br />(<%=Rs("Uv_2_Counter")%>)<br />��<%=FormatNumber(Rs("Uv_Counter_DJ"),5,-1,0,0)%></td>
<td><%=Rs("Display_Counter")%><br />(<%=Rs("Display_2_Counter")%>)<br />��<%=FormatNumber(Rs("Display_Counter_DJ"),3,-1,0,0)%></td>
<td><%=Rs("PvIpRate")%></td>
<td><%=Rs("ClickPv_Counter")%><br />(<%=Rs("ClickPv_2_Counter")%>)<br />��<%=FormatNumber(Rs("ClickPv_Counter_DJ"),2,-1,0,0)%></td>
<td><%=Rs("ClickUv_Counter")%><br />(<%=Rs("ClickUv_2_Counter")%>)<br />��<%=FormatNumber(Rs("ClickUv_Counter_DJ"),2,-1,0,0)%></td>
<td><%=Rs("Click_Counter")%><br />(<%=Rs("Click_2_Counter")%>)<br />��<%=FormatNumber(Rs("Click_Counter_DJ"),2,-1,0,0)%></td>
<td><%=Rs("Reg_Counter")%><br />(<%=Rs("Reg_2_Counter")%>)</td>
<td><%=Rs("Order_Counter")%><br />(<%=Rs("Order_2_Counter")%>)</td>
<td><%=FormatNumber(Rs("ClickRate"),1,-1,0,0)%>��</td>
<td>��<%=FormatNumber(Rs("User_Income_Cent"),2,-1,0,0)%><br />(��<%=FormatNumber(Rs("AdUser_Spend_Cent"),2,-1,0,0)%>)</td>
<td>��<%=FormatNumber(Rs("User_Income_CPC"),2,-1,0,0)%><br />(��<%=FormatNumber(Rs("AdUser_Spend_CPC"),2,-1,0,0)%>)</td>
<td>��<%=FormatNumber(Rs("User_Income_CPM"),2,-1,0,0)%><br />(��<%=FormatNumber(Rs("AdUser_Spend_CPM"),2,-1,0,0)%>)</td>
<td>��<%=FormatNumber(Rs("User_Income_CPA"),2,-1,0,0)%><br />(��<%=FormatNumber(Rs("AdUser_Spend_CPA"),2,-1,0,0)%>)</td>
<td>��<%=FormatNumber(Rs("User_Income_CPS"),2,-1,0,0)%><br />(��<%=FormatNumber(Rs("AdUser_Spend_CPS"),2,-1,0,0)%>)</td>
<td></td>
</tr>


<%


Sql="Select UserName,"&chr(10)
Sql=Sql&"Sum(Pv_Counter) As Pv_Counter,(Sum(User_Income_Cent) / case Sum(Pv_Counter) when 0 then 1 else Sum(Pv_Counter) end ) Pv_Counter_DJ,"&chr(10)
Sql=Sql&"Sum(Uv_Counter) As Uv_Counter,(Sum(User_Income_Cent) / case Sum(Uv_Counter) when 0 then 1 else Sum(Uv_Counter) end ) Uv_Counter_DJ,"&chr(10)
Sql=Sql&"Sum(Display_Counter) As Display_Counter,(Sum(User_Income_Cent) / case Sum(Display_Counter) when 0 then 1 else Sum(Display_Counter) end ) Display_Counter_DJ,"&chr(10)

Sql=Sql&"(Sum(Pv_Counter) / case Sum(Display_Counter) when 0 then 1 else Sum(Display_Counter) end ) PvIpRate,"&chr(10)

Sql=Sql&"Sum(ClickPv_Counter) As ClickPv_Counter,(Sum(User_Income_Cent) / case Sum(ClickPv_Counter) when 0 then 1 else Sum(ClickPv_Counter) end ) ClickPv_Counter_DJ,"&chr(10)
Sql=Sql&"Sum(ClickUv_Counter) As ClickUv_Counter,(Sum(User_Income_Cent) / case Sum(ClickUv_Counter) when 0 then 1 else Sum(ClickUv_Counter) end ) ClickUv_Counter_DJ,"&chr(10)
Sql=Sql&"Sum(Click_Counter) As Click_Counter,(Sum(User_Income_Cent) / case Sum(Click_Counter) when 0 then 1 else Sum(Click_Counter) end ) Click_Counter_DJ,"&chr(10)

Sql=Sql&"Sum(Reg_Counter) As Reg_Counter,"&chr(10)
Sql=Sql&"Sum(Order_Counter) Order_Counter,"&chr(10)

Sql=Sql&"(Sum(Click_Counter)*1000 / case Sum(Display_Counter) when 0 then 1 else Sum(Display_Counter) end ) ClickRate,"&chr(10)

Sql=Sql&"Sum(Pv_2_Counter) As Pv_2_Counter,"&chr(10)
Sql=Sql&"Sum(Uv_2_Counter) As Uv_2_Counter,"&chr(10)
Sql=Sql&"Sum(Display_2_Counter) As Display_2_Counter,"&chr(10)
Sql=Sql&"Sum(ClickPv_2_Counter) As ClickPv_2_Counter,"&chr(10)
Sql=Sql&"Sum(ClickUv_2_Counter) As ClickUv_2_Counter,"&chr(10)
Sql=Sql&"Sum(Click_2_Counter) As Click_2_Counter,"&chr(10)
Sql=Sql&"Sum(Reg_2_Counter) Reg_2_Counter,"&chr(10)
Sql=Sql&"Sum(Order_2_Counter) Order_2_Counter,"&chr(10)

Sql=Sql&"sum(User_Income_Cent) as User_Income_Cent,"&chr(10)
Sql=Sql&"sum(User_Income_CPC) as User_Income_CPC,"&chr(10)
Sql=Sql&"sum(User_Income_CPM) as User_Income_CPM,"&chr(10)
Sql=Sql&"sum(User_Income_CPA) as User_Income_CPA,"&chr(10)
Sql=Sql&"sum(User_Income_CPS) as User_Income_CPS,"&chr(10)

Sql=Sql&"sum(AdUser_Spend_Cent) as AdUser_Spend_Cent,"&chr(10)
Sql=Sql&"sum(AdUser_Spend_CPC) as AdUser_Spend_CPC,"&chr(10)
Sql=Sql&"sum(AdUser_Spend_CPM) as AdUser_Spend_CPM,"&chr(10)
Sql=Sql&"sum(AdUser_Spend_CPA) as AdUser_Spend_CPA,"&chr(10)
Sql=Sql&"sum(AdUser_Spend_CPS) as AdUser_Spend_CPS"&chr(10)

Sql=Sql&"From CFWztg_AD_Counter_Day WITH(NOLOCK) Where AddDate='"&AddDate&"'"&chr(10)

If UserName<>"" Then Sql=Sql&" And UserName='"&UserName&"'"
If Ad_ID<>"" Then Sql=Sql&" And Ad_ID="&Ad_ID

Sql=Sql&" Group By UserName Order By "&Px&" Desc"


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
<td><%=Rs("UserName")%></td>
<td><%=Rs("Pv_Counter")%><br />(<%=Rs("Pv_2_Counter")%>)<br />��<%=FormatNumber(Rs("Pv_Counter_DJ"),5,-1,0,0)%></td>
<td><%=Rs("Uv_Counter")%><br />(<%=Rs("Uv_2_Counter")%>)<br />��<%=FormatNumber(Rs("Uv_Counter_DJ"),5,-1,0,0)%></td>
<td><%=Rs("Display_Counter")%><br />(<%=Rs("Display_2_Counter")%>)<br />��<%=FormatNumber(Rs("Display_Counter_DJ"),3,-1,0,0)%></td>
<td><%=Rs("PvIpRate")%></td>
<td><%=Rs("ClickPv_Counter")%><br />(<%=Rs("ClickPv_2_Counter")%>)<br />��<%=FormatNumber(Rs("ClickPv_Counter_DJ"),2,-1,0,0)%></td>
<td><%=Rs("ClickUv_Counter")%><br />(<%=Rs("ClickUv_2_Counter")%>)<br />��<%=FormatNumber(Rs("ClickUv_Counter_DJ"),2,-1,0,0)%></td>
<td><%=Rs("Click_Counter")%><br />(<%=Rs("Click_2_Counter")%>)<br />��<%=FormatNumber(Rs("Click_Counter_DJ"),2,-1,0,0)%></td>
<td><%=Rs("Reg_Counter")%><br />(<%=Rs("Reg_2_Counter")%>)</td>
<td><%=Rs("Order_Counter")%><br />(<%=Rs("Order_2_Counter")%>)</td>
<td><%=FormatNumber(Rs("ClickRate"),1,-1,0,0)%>��</td>
<td>��<%=FormatNumber(Rs("User_Income_Cent"),2,-1,0,0)%><br />(��<%=FormatNumber(Rs("AdUser_Spend_Cent"),2,-1,0,0)%>)</td>
<td>��<%=FormatNumber(Rs("User_Income_CPC"),2,-1,0,0)%><br />(��<%=FormatNumber(Rs("AdUser_Spend_CPC"),2,-1,0,0)%>)</td>
<td>��<%=FormatNumber(Rs("User_Income_CPM"),2,-1,0,0)%><br />(��<%=FormatNumber(Rs("AdUser_Spend_CPM"),2,-1,0,0)%>)</td>
<td>��<%=FormatNumber(Rs("User_Income_CPA"),2,-1,0,0)%><br />(��<%=FormatNumber(Rs("AdUser_Spend_CPA"),2,-1,0,0)%>)</td>
<td>��<%=FormatNumber(Rs("User_Income_CPS"),2,-1,0,0)%><br />(��<%=FormatNumber(Rs("AdUser_Spend_CPS"),2,-1,0,0)%>)</td>
<td>
<a href="?Action=daytjdetail&UserName=<%=Rs("UserName")%>&AddDate=<%=AddDate%>" class="btn_add"><i class="mdi mdi-eye"></i> ����</a><br />
<a href="?Action=iplist&UserName=<%=Rs("UserName")%>&AddDate=<%=AddDate%>" class="btn_add"><i class="mdi mdi-eye"></i> ����</a><br />
<a href="?Action=showlist&UserName=<%=Rs("UserName")%>" class="btn_add"><i class="mdi mdi-eye"></i> ����ʾ</a>
</td>
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


