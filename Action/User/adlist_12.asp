<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<table class="tb_2">
<tr>
<td><span class="title">广告类型：<font color="#FF0000"><%=GetAdClassName(Ad_Class)%></span></td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1">
<td>软件图片</td>
<td>软件名称</td>
<td>说明</td>
<td>单价</td>
<td>获取代码</td>
</tr>
<%
PageUrl = "?Action="&Action&"&Ad_Class="&Ad_Class

Sql="Select a.* From CFWztg_Ad a inner join CFWztg_Plan b on a.plan_id=b.id Where a.AdState=2 And a.AdListShowState=1 And a.Ad_Class=" & Ad_Class &" and b.PlanState=2 Order By a.ID Desc"

Set Rs = Server.CreateObject("Adodb.RecordSet")
Rs.Open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.pagesize=20
 TotalRs=Rs.RecordCount
 TotalPage=Rs.PageCount
 MyPageSize=Rs.PageSize
 FixedSize=Rs.PageSize
 Rs.AbsolutePage=Page
End If

While Not Rs.Eof And MyPageSize>0

If MyPageSize Mod 2 =0 Then BgColor="ffffff" Else BgColor="eeeeee"

Response.write Rs("AdDesc")
%>
  <tr class="tr_2"> 
    <td><img src="<%=Rs("Ad")%>" /></td>
    <td><%=Rs("AdName")%></td>
    <td><%=Rs("AdIntro")%></td>
    <td><%=GetTurnCent(Rs("Unit_Cent_First")) & " 元"%></td>
    <td><a href='?Action=adcodeget&Ad_Class=<%=Ad_Class%>&ID=<%=Rs("ID")%>' class="btn btn-primary"><span>预览及获得此广告代码</span></a></td>
  </tr>  
<%
MyPageSize=MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
