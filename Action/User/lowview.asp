<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>


<div class="explain">
<%
If RsSet("UserTcLayer")=0 Then
 Response.write "本系统不支持推荐提成功能"
ElseIf RsSet("UserTcLayer")>0 Then
 Response.write "本系统支持"&RsSet("UserTcLayer")&"级用户推荐提成功能，"
 If RsSet("UserTcLayer")>=1 Then Response.write "一级(直接推荐的用户)：" & RsSet("UserTcLayer1Rate") & "%，"
 If RsSet("UserTcLayer")>=2 Then Response.write "二级用户提成：" & RsSet("UserTcLayer2Rate") & "%，"
 If RsSet("UserTcLayer")>=3 Then Response.write "三级用户提成：" & RsSet("UserTcLayer3Rate") & "%，"
 If RsSet("UserTcLayer")>=4 Then Response.write "四级用户提成：" & RsSet("UserTcLayer4Rate") & "%，"
 If RsSet("UserTcLayer")>=5 Then Response.write "五级用户提成：" & RsSet("UserTcLayer5Rate") & "%，"
 Response.write "在广告收入结算里你可以看到提成反馈结果"
End If
%>
</div>

<table class="tb_1">  
<%
Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_User where UserName='"&UserName&"'"
Rs.open Sql,Conn,1,1
AgentPower=Rs("AgentPower")


AdUserName=ChkStr(Request("AdUserName"),1)
LowUserName=ChkStr(Trim(Request("LowUserName")),1)
LowUnionUserName=ChkStr(Trim(Request("LowUnionUserName")),1)
AddDate=ChkStr(Trim(Request("AddDate")),3)
Px=ChkStr(Request("Px"),1):If Px="" Then Px="addtime"


PageUrl = "?Action="&Action&"&AdUserName="&AdUserName&"&LowUserName="&LowUserName&"&LowUnionUserName="&LowUnionUserName&"&AddDate="&AddDate

Call PxFilter(Px,"ID,AdUserName,LowUserName,Spare_Cent,LowUnionUserName,AddTime")

If Lcase(Px)="id" Then
 Px_2="a.id"
 
ElseIf Lcase(Px)="adusername" Then
 Px_2="a.adusername"
 
ElseIf Lcase(Px)="lowusername" Then
 Px_2="a.lowusername"
 
ElseIf Lcase(Px)="spare_cent" Then
 Px_2="b.spare_cent"
 
ElseIf Lcase(Px)="lowunionusername" Then
 Px_2="b.spare_cent"
 
ElseIf Lcase(Px)="addtime" Then
 Px_2="a.addtime"
 
Else
 Px_2="b.spare_cent"
 
End If


MaxListRs = 2000

Sql="Select Top "&MaxListRs&" a.id,a.adusername,a.lowusername,IsNull(b.spare_cent,0) spare_cent,a.lowunionusername,a.addtime From CFWztg_LowUser a Left join CFWztg_User b on a.LowUserName=b.UserName where a.UserName='"&UserName&"'"
If AdUserName<>"" Then Sql=Sql&" And a.AdUserName='"&AdUserName&"'"
If LowUserName<>"" Then Sql=Sql&" And a.LowUserName='"&LowUserName&"'"
If LowUnionUserName<>"" Then Sql=Sql&" And a.LowUnionUserName='"&LowUnionUserName&"'"
If AddDate<>"" Then Sql=Sql&" And DateDiff(d,a.AddDate,'"&AddDate&"')=0"
Sql=Sql&" Order By "&Px_2&" Desc"



Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

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
<tr class="tr_1"> 
    <td><a href="<%=PageUrl%>&Px=AdUserName">广告主</a></td>
	<td><a href="<%=PageUrl%>&Px=LowUserName">推荐的用户名</a></td>
    <td><a href="<%=PageUrl%>&Px=Spare_Cent">剩余金额</a></td>
	<td><a href="<%=PageUrl%>&Px=LowUnionUserName">下级联盟用户名</a></td>
    <td><a href="<%=PageUrl%>&Px=AddTime">时 间</a></td>
  </tr>

<%
While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2"> 
    <td><%=Rs("AdUserName")%></td>
	<td><%=server.HTMLEncode(Rs("LowUserName"))%></td>
    <td><%=FormatNumber(Rs("Spare_Cent"),2,-1,0,0)%>元</td>
    <td>
<%
If AgentPower=2 Then
Response.write Rs("LowUnionUserName")
Else
Response.write "此项只有代理商可查看"
End If
%></td>
	<td><%=Rs("AddTime")%></td>
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


  <form name="form2" method="post" action="?Action=<%=Action%>">
<table class="tb_3"><tr class="tr_1"> 
      <td colspan="2">查询</td>
    <tr>
      <td class="td_r">广告主：</td>
      <td><input name="AdUserName" type="text" id="AdUserName" value="<%=AdUserName%>"></td>
    </tr>
	<tr>
      <td class="td_r">推荐的用户名：</td>
      <td><input name="LowUserName" type="text" id="LowUserName" value="<%=LowUserName%>"></td>
    </tr>
	<tr>
      <td class="td_r">下级联盟用户名：</td>
      <td><input name="LowUnionUserName" type="text" id="LowUnionUserName" value="<%=LowUnionUserName%>"></td>
    </tr>
	<tr>
      <td class="td_r">日期：</td>
      <td><input name="AddDate" type="text" id="AddDate" value="<%=AddDate%>"></td>
    </tr>
	<tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="submit" value="查询" class="btn btn-sm btn-primary"></td>
	</tr>
</table></form>

