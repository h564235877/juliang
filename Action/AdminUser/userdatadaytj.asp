<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
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
<option value=?Action=<%=Action%>>请选择查询日期</option>
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
<td>网站主：</td>
<td><input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="10"></td>
<td>广告ID：</td>
<td><select id='Ad_ID' name="Ad_ID">

<option value="">所有广告</option>
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
<td><input type="submit" name="search"  id="search" value="查询" class="btn btn-sm btn-primary"></td>
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
点击标题可排序,列表里注括号内为显示给广告主的实际未扣点的数字或金额，括号外为显示给网站主的扣过点后的数字或金额</div>
</td>
</tr>

</table>

<table class="tb_1">
<tr class="tr_1"> 
<td><a href="<%=PageUrl%>&Px=UserName">用户</a></td>
<td><a href="<%=PageUrl%>&Px=Pv_Counter">显示PV</a><br /><a href="<%=PageUrl%>&Px=Pv_Counter_DJ">成本单价</a></td>
<td><a href="<%=PageUrl%>&Px=Uv_Counter">显示UV</a><br /><a href="<%=PageUrl%>&Px=Uv_Counter_DJ">成本单价</a></td>
<td><a href="<%=PageUrl%>&Px=Display_Counter">显示IP</a><br /><a href="<%=PageUrl%>&Px=Display_Counter_DJ">成本单价</a></td>
<td><a href="<%=PageUrl%>&Px=PvIpRate">显示PV除<br />IP的比率</a></td>
<td><a href="<%=PageUrl%>&Px=ClickPv_Counter">点击PV</a><br /><a href="<%=PageUrl%>&Px=ClickPv_Counter_DJ">成本单价</a></td>
<td><a href="<%=PageUrl%>&Px=ClickUv_Counter">点击UV</a><br /><a href="<%=PageUrl%>&Px=ClickUv_Counter_DJ">成本单价</a></td>
<td><a href="<%=PageUrl%>&Px=Click_Counter">点击IP</a><br /><a href="<%=PageUrl%>&Px=Click_Counter_DJ">成本单价</a></td>
<td><a href="<%=PageUrl%>&Px=Reg_Counter">注册数</a></td>
<td><a href="<%=PageUrl%>&Px=Order_Counter">订单数</a></td>
<td><a href="<%=PageUrl%>&Px=ClickRate">点击率</a></td>
<td><a href="<%=PageUrl%>&Px=User_Income_Cent">总收入</a></td>
<td><a href="<%=PageUrl%>&Px=User_Income_CPC">CPC收入</a></td>
<td><a href="<%=PageUrl%>&Px=User_Income_CPM">CPV收入</a></td>
<td><a href="<%=PageUrl%>&Px=User_Income_CPA">CPA收入</a></td>
<td><a href="<%=PageUrl%>&Px=User_Income_CPS">CPS收入</a></td>
<td>详细</td>
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
<td>汇总</td>
<td><%=Rs("Pv_Counter")%><br />(<%=Rs("Pv_2_Counter")%>)<br />￥<%=FormatNumber(Rs("Pv_Counter_DJ"),5,-1,0,0)%></td>
<td><%=Rs("Uv_Counter")%><br />(<%=Rs("Uv_2_Counter")%>)<br />￥<%=FormatNumber(Rs("Uv_Counter_DJ"),5,-1,0,0)%></td>
<td><%=Rs("Display_Counter")%><br />(<%=Rs("Display_2_Counter")%>)<br />￥<%=FormatNumber(Rs("Display_Counter_DJ"),3,-1,0,0)%></td>
<td><%=Rs("PvIpRate")%></td>
<td><%=Rs("ClickPv_Counter")%><br />(<%=Rs("ClickPv_2_Counter")%>)<br />￥<%=FormatNumber(Rs("ClickPv_Counter_DJ"),2,-1,0,0)%></td>
<td><%=Rs("ClickUv_Counter")%><br />(<%=Rs("ClickUv_2_Counter")%>)<br />￥<%=FormatNumber(Rs("ClickUv_Counter_DJ"),2,-1,0,0)%></td>
<td><%=Rs("Click_Counter")%><br />(<%=Rs("Click_2_Counter")%>)<br />￥<%=FormatNumber(Rs("Click_Counter_DJ"),2,-1,0,0)%></td>
<td><%=Rs("Reg_Counter")%><br />(<%=Rs("Reg_2_Counter")%>)</td>
<td><%=Rs("Order_Counter")%><br />(<%=Rs("Order_2_Counter")%>)</td>
<td><%=FormatNumber(Rs("ClickRate"),1,-1,0,0)%>‰</td>
<td>￥<%=FormatNumber(Rs("User_Income_Cent"),2,-1,0,0)%><br />(￥<%=FormatNumber(Rs("AdUser_Spend_Cent"),2,-1,0,0)%>)</td>
<td>￥<%=FormatNumber(Rs("User_Income_CPC"),2,-1,0,0)%><br />(￥<%=FormatNumber(Rs("AdUser_Spend_CPC"),2,-1,0,0)%>)</td>
<td>￥<%=FormatNumber(Rs("User_Income_CPM"),2,-1,0,0)%><br />(￥<%=FormatNumber(Rs("AdUser_Spend_CPM"),2,-1,0,0)%>)</td>
<td>￥<%=FormatNumber(Rs("User_Income_CPA"),2,-1,0,0)%><br />(￥<%=FormatNumber(Rs("AdUser_Spend_CPA"),2,-1,0,0)%>)</td>
<td>￥<%=FormatNumber(Rs("User_Income_CPS"),2,-1,0,0)%><br />(￥<%=FormatNumber(Rs("AdUser_Spend_CPS"),2,-1,0,0)%>)</td>
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
<td><%=Rs("Pv_Counter")%><br />(<%=Rs("Pv_2_Counter")%>)<br />￥<%=FormatNumber(Rs("Pv_Counter_DJ"),5,-1,0,0)%></td>
<td><%=Rs("Uv_Counter")%><br />(<%=Rs("Uv_2_Counter")%>)<br />￥<%=FormatNumber(Rs("Uv_Counter_DJ"),5,-1,0,0)%></td>
<td><%=Rs("Display_Counter")%><br />(<%=Rs("Display_2_Counter")%>)<br />￥<%=FormatNumber(Rs("Display_Counter_DJ"),3,-1,0,0)%></td>
<td><%=Rs("PvIpRate")%></td>
<td><%=Rs("ClickPv_Counter")%><br />(<%=Rs("ClickPv_2_Counter")%>)<br />￥<%=FormatNumber(Rs("ClickPv_Counter_DJ"),2,-1,0,0)%></td>
<td><%=Rs("ClickUv_Counter")%><br />(<%=Rs("ClickUv_2_Counter")%>)<br />￥<%=FormatNumber(Rs("ClickUv_Counter_DJ"),2,-1,0,0)%></td>
<td><%=Rs("Click_Counter")%><br />(<%=Rs("Click_2_Counter")%>)<br />￥<%=FormatNumber(Rs("Click_Counter_DJ"),2,-1,0,0)%></td>
<td><%=Rs("Reg_Counter")%><br />(<%=Rs("Reg_2_Counter")%>)</td>
<td><%=Rs("Order_Counter")%><br />(<%=Rs("Order_2_Counter")%>)</td>
<td><%=FormatNumber(Rs("ClickRate"),1,-1,0,0)%>‰</td>
<td>￥<%=FormatNumber(Rs("User_Income_Cent"),2,-1,0,0)%><br />(￥<%=FormatNumber(Rs("AdUser_Spend_Cent"),2,-1,0,0)%>)</td>
<td>￥<%=FormatNumber(Rs("User_Income_CPC"),2,-1,0,0)%><br />(￥<%=FormatNumber(Rs("AdUser_Spend_CPC"),2,-1,0,0)%>)</td>
<td>￥<%=FormatNumber(Rs("User_Income_CPM"),2,-1,0,0)%><br />(￥<%=FormatNumber(Rs("AdUser_Spend_CPM"),2,-1,0,0)%>)</td>
<td>￥<%=FormatNumber(Rs("User_Income_CPA"),2,-1,0,0)%><br />(￥<%=FormatNumber(Rs("AdUser_Spend_CPA"),2,-1,0,0)%>)</td>
<td>￥<%=FormatNumber(Rs("User_Income_CPS"),2,-1,0,0)%><br />(￥<%=FormatNumber(Rs("AdUser_Spend_CPS"),2,-1,0,0)%>)</td>
<td>
<a href="?Action=daytjdetail&UserName=<%=Rs("UserName")%>&AddDate=<%=AddDate%>" class="btn_add"><i class="mdi mdi-eye"></i> 查广告</a><br />
<a href="?Action=iplist&UserName=<%=Rs("UserName")%>&AddDate=<%=AddDate%>" class="btn_add"><i class="mdi mdi-eye"></i> 查点击</a><br />
<a href="?Action=showlist&UserName=<%=Rs("UserName")%>" class="btn_add"><i class="mdi mdi-eye"></i> 查显示</a>
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


