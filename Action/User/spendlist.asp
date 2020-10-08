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
Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="select * from CFWztg_User Where UserName='"&UserName&"'"
Rs.Open Sql,Conn,1,1
%>

<table class="tb_2">
<tr>
<td><span class="title">用户<font color="#FF0000"><%=UserName%></font>的推广成绩</span></td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td>剩余金额</td>
<td>已结算金额</td>
<td>共得金额</td>
<td>总显示数量</td>
<td>总点击数量</td>
<td>总共注册数量</td>
</tr>
<tr class="tr_2">           
<td><%=Int(Cdbl(rs("Spare_Cent"))*100)/100%>元</td>
<td><%=FormatNumber(rs("Spend_Cent"),2,-1,0,0)%>元</td>
<td><%=FormatNumber(rs("Total_Cent"),2,-1,0,0)%>元</td>
<td><%=rs("AdShowNum")%></td>
<td><%=rs("ComVisit")%></td>
<td><%=rs("ComReg")%></td>
</tr>
<tr> 
<td colspan="6" class="td_3">
<%
If RsSet("UserSpendType")=0 Then'手工结算时
 if Cdbl(rs("Spare_Cent"))>=RsSet("LowSpendCent") then
  If RsSet("SpendSecAdd")=1 Then
   Response.write "<a href=""?Action=spendadd"" class=""btn btn-primary""><span>结算申请</span></a>"
  Else
   Sql="Select Count(1) From CFWztg_Spend Where UserName='"&UserName&"' And SpendType=0 And SpendState=1"
   Set Rs2=Conn.execute(Sql)
   If Rs2(0)>0 Then
    Response.write "上笔结算还没有完成，等待完成后可再次提交结算&nbsp;&nbsp;&nbsp;&nbsp;"
   Else
    Response.write "<a href=""?Action=spendadd"" class=""btn btn-primary""><span>结算申请</span></a>"
   End If
  End If
 Else
  Response.write "<a href=""#"" class=""btn btn-primary"" onClick=""$(function () { alert('剩余金额达到最低结算标准" & RsSet("LowSpendCent") &"元才能结算!');});""><span>结算申请</span></a>"
 End If
Else
 Response.write "系统自动结算周期为"&RsSet("UserSpendType")&"天"
End If


Response.write "(每次最低需结算" & GetTurnCent(RsSet("LowSpendCent")) & "元"
If RsSet("SpendCentBS")>0 Then Response.write "，且结算金额必须为"&RsSet("SpendCentBS")&"元的倍数"
Response.write ")"

if rs("AdUserName")<>"" then Response.write "，<a href=""?Action=spareout""><span>资金也可转入广告主发布广告</span></a>"

%>               
</td>
</tr>
</table>

<br>
<%
If Request("SpendType")="" Then SpendType = -1 Else SpendType = CInt(ChkStr(Request("SpendType"),2))

PageUrl = "?Action="&Action&"&SpendType="&SpendType

MaxListRs = 2000

Sql = "Select Top "&MaxListRs&" * From CFWztg_Spend Where UserName='"&UserName&"'"

If SpendType>=0 Then Sql=Sql&" And SpendType="&SpendType

Sql=Sql&" Order By ID Desc"

Set Rs = Server.CreateObject("Adodb.RecordSet")
Rs.Open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.PageSize = 20
 TotalRs = Rs.RecordCount
 TotalPage = Rs.PageCount
 MyPageSize = Rs.PageSize
 FixedSize=Rs.PageSize
 Rs.AbsolutePage = Page
End If

If TotalRs = MaxListRs Then Response.write "记录太多，只列最新"&MaxListRs&"条"
%>

<div class="tabs_header">
<ul class="tabs">
<li <%If SpendType=-1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&SpendType=-1"><span>所有结算记录</span></a></li>
<li <%If SpendType=0 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&SpendType=0"><span>剩余金额结算记录</span></a></li>
<li <%If SpendType=1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&SpendType=1"><span>提成推荐用户结算记录</span></a></li>
<li <%If SpendType=2 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&SpendType=2"><span>销售商品结算记录</span></a></li>
</ul>
</div>
<%
If SpendType=0 Then
 Response.write "<div class='explain'>注：剩余金额包括投放广告收入，推荐用户提成和销售商品提成</div>"
ElseIf SpendType=1 Then
 Response.write "<div class='explain'>注：推荐用户的在每笔结算审核成功后，您的提成收入系统打入您的剩余金额里可结算</div>"
ElseIf SpendType=2 Then
 Response.write "<div class='explain'>注：销售商品的收入系统自动结算并打入您的剩余金额里</div>"
End If
%>
<table class="tb_1">
  <tr class="tr_1"> 
    <td>结算ID</a></td>
    <td>结算金额</td>
    <td>结算说明</td>
    <td>申请时间</td>
    <td>结算状态</td>
    <td>结算类型</td>
    <td>管理员说明</td>
    <td>结算时间</td>
  </tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2"> 
    <td><%=Rs("ID")%></td>
    <td><%=GetTurnCent(Rs("Spend_Cent"))%>元</td>
    <td><%=Rs("SpendDesc")%></td>
    <td><%=Rs("SpendTime")%></td>
    <td><%
If Rs("SpendState")=1 Then
 Response.Write "结算审核中"
ElseIf Rs("SpendState")=2 Then
 Response.Write "结算成功"
ElseIf Rs("SpendState")=3 Then
 Response.Write "结算失败,"&Rs("SpendAbortFeedBack")
End If%></td>
<td> 
<%
If Rs("SpendType")=0 Then
 Response.Write "广告收入"
ElseIf Rs("SpendType")=1 Then
 Response.Write "提成推荐用户收入"
ElseIf Rs("SpendType")=2 Then
 Response.Write "销售商品收入"
End If%></td>
<td><%=rs("AdminDesc")%></td>
<td><%=rs("AdminSpendTime")%></td>
</tr>
  <%
MyPageSize = MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>
</table>      
 
<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
