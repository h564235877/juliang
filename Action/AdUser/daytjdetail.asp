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
AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then Call AlertRef("日期不能为空")


PageUrl = "?Action="&Action&"&Ad_ID="&Ad_ID&"&AddDate="&AddDate

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
<td>
<td><span class="title">
<%=AdTitle%> 在 <%=AddDate%> 报表
</span>
<a href="?Action=daytj" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>
</td>
</tr>
</table>

<table class="tb_1">
  <tr class="tr_1">     
    <td>广告</td>
    <td>网站主</td>
    <td>显示PV</td>
    <td>显示UV</td>
    <td>显示IP</td>
    <td>点击PV</td>
	<td>点击UV</td>
	<td>点击IP</td>
    <td>注册数</td>
    <td>点击率</td>
	<td>花费</td>
  </tr>
<%


Sql="Select b.AdName,a.Ad_ID,a.UserName,a.Reg_Counter,a.Pv_2_Counter,a.Uv_2_Counter,a.Display_2_Counter,a.ClickPv_2_Counter,a.ClickUv_2_Counter,a.Click_2_Counter,a.AdUser_Spend_Cent  From CFWztg_AD_Counter_Day a inner join cfwztg_ad b on a.ad_id=b.id Where 1=1 And b.AdUserName='"&AdUserName&"' And a.AddDate='"&AddDate&"'"&chr(10)

If Ad_ID="" Then
ElseIf CInt(Ad_ID)<0 Then
 Sql=Sql&"And b.Ad_Class="&Abs(Ad_ID) &chr(10)
Else
 Sql=Sql&"And a.Ad_ID="&Ad_ID &chr(10)
End If

Sql=Sql & " Order By a.AdUser_Spend_Cent Desc"

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

While Not Rs.Eof And MyPageSize>0
%>
  <tr> 
    <td><%=Rs("AdName")&"["&Rs("Ad_ID")&"]"%></td>
    <td><%=Rs("UserName")%></td>
    <td><%=Rs("Pv_2_Counter")%></td>
    <td><%=Rs("Uv_2_Counter")%></td>
    <td><%=Rs("Display_2_Counter")%></td>
    <td><%=Rs("ClickPv_2_Counter")%></td>
    <td><%=Rs("ClickUv_2_Counter")%></td>
    <td><%=Rs("Click_2_Counter")%></td>
    <td><%=Rs("Reg_Counter")%></td>
    <td><%=FormatNumber(MyRate2(Rs("Click_2_Counter"),Rs("Display_2_Counter")),1,-1,0,0)%>‰</td>
	<td><%=GetTurnCent(Rs("AdUser_Spend_Cent"))%>元</td>
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