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
AD_ID=ChkStr(Request("AD_ID"),2)
AddDate=ChkStr(Request("AddDate"),3)
Px=ChkStr(Request("Px"),1)

If Request("RefUrl")="" Then RefUrl=ChkStr(Request.ServerVariables("Http_Referer"),1) Else RefUrl=ChkStr(Request("RefUrl"),1)

If AddDate="" Then
Response.write "日期不能为空"
Response.end
End If

If Px="" Then  Px="User_Income_Cent"

PageUrl = "?Action="&Action&"&AddDate="&AddDate&"&RefUrl="&Server.URLEncode(RefUrl)


Call PxFilter(Px,"Ad_ID,Pv_Counter,Uv_Counter,Display_Counter,PvIpRate,ClickPv_Counter,ClickUv_Counter,Click_Counter,Reg_Counter,Order_Counter,ClickRate,User_Income_Cent,User_Income_CPC,User_Income_CPM,User_Income_CPA,User_Income_CPS")


If Ad_ID="" Then
 AdTitle="全部广告"

ElseIf Ad_ID="-7" Then
 AdTitle="全部轮循富媒体广告"
ElseIf Ad_ID="-1" Then
 AdTitle="全部轮循直链广告"
ElseIf Ad_ID="-4" Then
 AdTitle="全部轮循普通图片广告"
ElseIf Ad_ID="-8" Then
 AdTitle="全部轮循强弹广告"
ElseIf Ad_ID="-9" Then
 AdTitle="全部轮循退弹广告"

 
ElseIf Ad_ID="-11" Then
 AdTitle="全部混合富媒体广告"
ElseIf Ad_ID="-5" Then
 AdTitle="全部混合文字广告"
ElseIf Ad_ID="-6" Then
 AdTitle="全部混合图片广告"
ElseIf Ad_ID="-10" Then
 AdTitle="全部混合标签云广告"
Else
 AdTitle="广告"&AD_ID
End If
%>



<table class="tb_2">
<tr>   
<td colspan="11">
<span class="title">
<%=AdTitle%> 在 <%=AddDate%> 报表</span>
&nbsp;&nbsp;&nbsp;&nbsp;(点击标题可排序)

<a href="<%=RefUrl%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>
</td>
</tr>
</table>



<table class="tb_1">
  <tr class="tr_1">   
    <td><a href="<%=PageUrl%>&Px=Ad_ID">广告</a></td>
    <td><a href="<%=PageUrl%>&Px=Pv_Counter">显示PV</a></td>
    <td><a href="<%=PageUrl%>&Px=Uv_Counter">显示UV</a></td>
    <td><a href="<%=PageUrl%>&Px=Display_Counter">显示IP</a></td>
    <td><a href="<%=PageUrl%>&Px=PvIpRate">比率</a></td>
    <td><a href="<%=PageUrl%>&Px=ClickPv_Counter">点击PV</a></td>
    <td><a href="<%=PageUrl%>&Px=ClickUv_Counter">点击UV</a></td>
    <td><a href="<%=PageUrl%>&Px=Click_Counter">点击IP</a></td>
    <td><a href="<%=PageUrl%>&Px=Reg_Counter">注册数</a></td>
    <td><a href="<%=PageUrl%>&Px=Order_Counter">订单数</a></td>
    <td><a href="<%=PageUrl%>&Px=ClickRate">点击率</a></td>
	<td><a href="<%=PageUrl%>&Px=User_Income_Cent">总收入</a></td>
    <td><a href="<%=PageUrl%>&Px=User_Income_CPC">CPC收入</a></td>
    <td><a href="<%=PageUrl%>&Px=User_Income_CPM">CPV收入</a></td>
    <td><a href="<%=PageUrl%>&Px=User_Income_CPA">CPA收入</a></td>
    <td><a href="<%=PageUrl%>&Px=User_Income_CPS">CPS收入</a></td>
  </tr>
<%

Sql="Select b.AdName,a.Ad_ID,a.Pv_Counter,a.Uv_Counter,a.Display_Counter,(a.Pv_Counter/case a.Display_Counter when 0 then 1 else a.Display_Counter end) PvIpRate,a.ClickPv_Counter,a.ClickUv_Counter,a.Click_Counter,a.Reg_Counter,a.Order_Counter,(a.Click_Counter*1000 / case a.Display_Counter when 0 then 1 else a.Display_Counter end ) ClickRate,a.User_Income_Cent,a.User_Income_CPC,a.User_Income_CPM,a.User_Income_CPA,a.User_Income_CPS From CFWztg_AD_Counter_Day a inner join cfwztg_ad b on a.ad_id=b.id Where 1=1 And a.UserName='"&UserName&"' And a.AddDate='"&AddDate&"'" &chr(10)

If Ad_ID="" Then
ElseIf CInt(Ad_ID)<0 Then
 Sql=Sql&" And b.Ad_Class="&Abs(Ad_ID) &chr(10)
Else
 Sql=Sql&" And a.Ad_ID="&Ad_ID &chr(10)
End If

If Lcase(Px)="clickrate" Or Lcase(Px)="pviprate" Then
 Sql=Sql & " Order By "&Px&" Desc"
Else
 Sql=Sql & " Order By a."&Px&" Desc"
End If

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not rs.eof then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 rs.pagesize=60
 totalrs=rs.RecordCount
 totalpage=rs.pageCount
 mypagesize=rs.pagesize
 FixedSize=Rs.PageSize
 rs.absolutepage=page
End If

While Not Rs.Eof And MyPageSize>0
%>
  <tr> 
    <td><%=Rs("AdName")&"["&Rs("Ad_ID")&"]"%></td>
    <td><%=Rs("Pv_Counter")%></td>
    <td><%=Rs("Uv_Counter")%></td>
    <td><%=Rs("Display_Counter")%></td>
    <td><%=Rs("PvIpRate")%></td>
    <td><%=Rs("ClickPv_Counter")%></td>
    <td><%=Rs("ClickUv_Counter")%></td>
    <td><%=Rs("Click_Counter")%></td>
    <td><%=Rs("Reg_Counter")%></td>
    <td><%=Rs("Order_Counter")%></td>
    <td><%=FormatNumber(Rs("ClickRate"),1,-1,0,0)%>‰</td>
	<td><%=FormatNumber(Rs("User_Income_Cent"),2,-1,0,0)%></td>	
    <td><%=FormatNumber(Rs("User_Income_CPC"),2,-1,0,0)%></td>
    <td><%=FormatNumber(Rs("User_Income_CPM"),2,-1,0,0)%></td>
    <td><%=FormatNumber(Rs("User_Income_CPA"),2,-1,0,0)%></td>
    <td><%=FormatNumber(Rs("User_Income_CPS"),2,-1,0,0)%></td>
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
