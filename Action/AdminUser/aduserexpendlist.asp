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
If Request("ExpendType")="" Then ExpendType = 0 Else ExpendType = CInt(ChkStr(Request("ExpendType"),2))

PageUrl = "?Action="&Action&"&ExpendType="&ExpendType

MaxListRs = 2000

Sql="SELECT "
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AdUser_Expend Where AdminCheck=0) ExpendNum_0,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AdUser_Expend Where AdminCheck=0 And ExpendType=1) ExpendNum_1,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AdUser_Expend Where AdminCheck=0 And ExpendType=2) ExpendNum_2,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AdUser_Expend Where AdminCheck=0 And ExpendType=3) ExpendNum_3"
Set Rs=Conn.Execute(Sql)

%>
<div class="tabs_header">
<ul class="tabs">
<div class="tabs_header">
<ul class="tabs">
<li <%If ExpendType=0 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ExpendType=0"><span>所有[<%=Rs("ExpendNum_0")%>]</span></a></li>
<li <%If ExpendType=1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ExpendType=1"><span>新发布计划[<%=Rs("ExpendNum_1")%>]</span></a></li>
<li <%If ExpendType=2 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ExpendType=2"><span>计划追加花费[<%=Rs("ExpendNum_2")%>]</span></a></li>
<li <%If ExpendType=3 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ExpendType=3"><span>新广告发布审核[<%=Rs("ExpendNum_3")%>]</span></a></li>
</ul>
</div>
</ul>
</div>

<div class="explain">
[]内的数字为未审核总数</div>

<table class="tb_1">
<tr class="tr_1"> 
<td>消费编号</td>
<td>广告主</td>
<td>计划ID</td>
<td>广告ID</td>
<td>用户</td>
<td>点数</td>
<td>消费金额</td>
<td>用途</td>
<td>申请时间</td>
<td>消费审核</td>
<td>审核状态</td>
<td>说明</td>
<td>审核时间</td>
<td>操作</td>
</tr>
<%

Sql="Select Top "&MaxListRs&" * From CFWztg_AdUser_Expend Where 1=1"

If ExpendType>0 Then Sql=Sql&" And ExpendType="&ExpendType

Sql=Sql&" Order By ID Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.pagesize=20
 TotalRs=Rs.RecordCount
 TotalPage=Rs.PageCount
 MyPageSize=Rs.PageSize
 FixedSize=Rs.PageSize
 Rs.AbsolutePage=Page
End If

If TotalRs = MaxListRs Then Response.write "记录太多，只列最新"&MaxListRs&"条"

While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td><%=Rs("ID")%></td>
<td><%=Rs("AdUserName")%></td>
<td>
<%
Response.write Rs("Plan_ID")
If Rs("Plan_ID")>0 Then
 Sql="Select PlanName From CFWztg_Plan Where ID=" & Rs("Plan_ID")
 Set Rs2=Conn.Execute(Sql)
 Response.write "<br>[" & Rs2("PlanName")&"]"
 Rs2.Close
End If
%>
</td>
<td>
<%
Response.write Rs("Ad_ID")
If Rs("Ad_ID")>0 Then
 Sql="Select AdName,Ad_Class From CFWztg_AD Where ID=" & Rs("Ad_ID")
 Set Rs2=Conn.Execute(Sql)
 Response.write "<br>[" & Rs2("AdName")&"]"
 Response.write "<br>[" & GetAdClassName(Rs2("Ad_Class"))&"]"
 Response.write "<br />[<a href='?Action=admodify&ID="&Rs("Ad_ID")&"'>修改</a>]"
 Response.write "<br />[<a href='../../cf.aspx?Action=adview&ID="&Rs("Ad_ID")&"' target='_blank'>查看</a>]"
End If
%>
</td>
<td><%=Rs("AdUserName")%></td>
<td><%=Rs("ChaseClickNum")%></td>
<td><%=GetTurnCent(Rs("Expend_Cent"))%>元</td>
<td width="100" style="word-wrap: break-word;word-break:break-all;"><%=Rs("ExpendDesc")%></td>
<td><%=Rs("AddTime")%></td>
<td>
<%
IF Rs("ExpendState")=1 Then
Response.Write "审核中"
ElseIf Rs("ExpendState")=2 Then
Response.Write "审核成功"
ElseIf Rs("ExpendState")=3 Then
Response.Write "审核失败,"&Rs("ExPendAbortFeedBack")
End If
%>
</td>
<td>
<%If Rs("AdminCheck")=1 Then
Response.Write "已审核"
Else
Response.Write "<font color='FF0000'>未审核</font>"
End If%>
</td>
<td><%=Rs("AdminDesc")%></td>
<td><%=Rs("AdminSpendTime")%></td>
<td>
<%If Rs("AdminCheck")=0 Then%>
<a href="?Action=aduserexpendmodify&ID=<%=Rs("ID")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>审核</a> 
<%End If%>
<%If Rs("AdminCheck")=1 Then%>
<a href="?Action=aduserexpendmodify&ID=<%=Rs("ID")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>修改</a> 
<%End If%>
<%If Rs("AdminCheck")=1 And Rs("ExpendState")=3 Then%>
<a href="javascript:;" onclick="$(function () { confirm('你确定要删除吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=aduserexpenddel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> 删除</a>
<%End If%>
</td>
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