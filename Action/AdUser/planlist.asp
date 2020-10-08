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
If Request("PlanState")="" Then PlanState=2 Else PlanState=ChkStr(Request("PlanState"),2)

Px=ChkStr(Request("Px"),1):If Px="" Then Px="ID"

PageUrl = "?Action="&Action&"&PlanState="&PlanState

Call PxFilter(Px,"ID,AdUserName,PlanName,TotalClick_Cent,OverClick_Cent,SpareClick_Cent,PlanState")
%>



<%
Sql="SELECT "
Sql=Sql&"(SELECT Count(1) FROM CFWztg_Plan Where AdUserName='"&AdUserName&"') PlanNum_0,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_Plan Where PlanState=1 And AdUserName='"&AdUserName&"') PlanNum_1,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_Plan Where PlanState=2 And AdUserName='"&AdUserName&"') PlanNum_2,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_Plan Where PlanState=3 And AdUserName='"&AdUserName&"') PlanNum_3,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_Plan Where PlanState=4 And AdUserName='"&AdUserName&"') PlanNum_4,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_Plan Where PlanState=5 And AdUserName='"&AdUserName&"') PlanNum_5"
Set Rs=Conn.Execute(Sql)


%>

<table class="tb_2">

<tr> 
<td>
<div class="tabs_header">
<ul class="tabs">
<li <%If PlanState=0 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&PlanState=0"><span>所有计划[<%=Rs("PlanNum_0")%>]</span></a></li>
<li <%If PlanState=1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&PlanState=1"><span>审核中的计划[<%=Rs("PlanNum_1")%>]</span></a></li>
<li <%If PlanState=2 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&PlanState=2"><span>运行中的计划[<%=Rs("PlanNum_2")%>]</span></a></li>
<li <%If PlanState=3 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&PlanState=3"><span>暂停中(管理员设置)的计划[<%=Rs("PlanNum_3")%>]</span></a></li>
<li <%If PlanState=4 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&PlanState=4"><span>投放完成的计划[<%=Rs("PlanNum_4")%>]</span></a></li>
<li <%If PlanState=5 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&PlanState=5"><span>暂停中(广告主设置)的计划[<%=Rs("PlanNum_5")%>]</span></a></li>
</ul>
</div>
</td>
</tr>

</table>


<div class="explain">
[]内的数字为总数,点击标题可排序</div>

<%Rs.Close%>


<a href="?Action=planadd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>计划新增</span></a>

<table class="tb_1">
<tr class="tr_1"> 
<td><a href="<%=PageUrl%>&Px=ID">计划ID</a></td>
<td><a href="<%=PageUrl%>&Px=PlanName">计划名称</a></td>
<td><a href="<%=PageUrl%>&Px=TotalClick_Cent">投放总额</a></td>
<td><a href="<%=PageUrl%>&Px=OverClick_Cent">已消费金额</a></td>
<td><a href="<%=PageUrl%>&Px=SpareClick_Cent">剩余金额</a></td>
<td><a href="<%=PageUrl%>&Px=PlanState">状态</a></td>
<td>正运行的广告数</td>
<td>操作</td>
</tr>
  <%

Sql="Select * From CFWztg_Plan Where AdUserName='"&AdUserName&"'"
If PlanState>0 Then Sql=Sql&" And PlanState="&PlanState
Sql=Sql&" Order By "&Px&" Desc"

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

While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2"> 
    <td><%=Rs("ID")%></td>
    <td><%=Rs("PlanName")%></td>
    <td><%=GetTurnCent(Rs("TotalClick_Cent"))%>元</td>
    <td><%=GetTurnCent(Rs("OverClick_Cent"))%>元</td>
    <td><%=GetTurnCent(Rs("SpareClick_Cent"))%>元</td>
    <td><%
	If Rs("PlanState")=1 Then
	 Response.Write "审核中"
	ElseIf Rs("PlanState")=2 Then
	 Response.Write "运行中"
	ElseIf Rs("PlanState")=3 Then
	 Response.Write "暂停中(管理员设置)"
	ElseIf Rs("PlanState")=4 Then
	 Response.Write "投放完成"
	ElseIf Rs("PlanState")=5 Then
	 Response.Write "暂停中(广告主设置)"
	End if%></td>
    
<td>
<%
Sql="Select Count(1) From CFWztg_AD where AdState=2 And Plan_ID="&Rs("ID")
Set Rs2 = Conn.Execute(Sql)
Response.write Rs2(0)
Rs2.Close
%>
</td>

<td>
<a href="?Action=planview&Plan_ID=<%=Rs("ID")%>" class="btn_add"><i class="mdi mdi-eye"></i>查看</a>

<a href="?Action=planmodify&Plan_ID=<%=Rs("ID")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>修改</a>
<%
If Rs("PlanState")=2 Or Rs("PlanState")=4 Then Response.write "<a href='?Action=planchase&Plan_ID="&Rs("ID")&"' class=""btn_add""><i class=""fa fa-plus""></i> 追加或减少投放</a>"
%>

<%If Rs("PlanState")=2 Then %>
<a href="javascript:;" onclick="$(function () { confirm('暂停计划后，此计划所有广告都会暂停投放！确定要暂停吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdUser.aspx?Action=planstop&Plan_ID=<%=Rs("ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-stop"></i>暂停</a>
<%ElseIf Rs("PlanState")=5 Then %>
<a href="javascript:;" onclick="$(function () { confirm('投放计划后，此计划所有广告都会开始投放！确定要投放吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdUser.aspx?Action=planstart&Plan_ID=<%=Rs("ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_add"><i class="mdi mdi-play"></i>投放</a>
<%End If%>

<a href="javascript:;" onclick="$(function () { confirm('如果计划下存在正在运行的广告或计划在审核状态的时候则无法删除成功，需先删除计划下的所有广告后才能删除计划。如计划删除成功，计划内的余额会退回账户内！确定要删除吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdUser.aspx?Action=plandel&Plan_ID=<%=Rs("ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>删除</a>

</td>

</tr><%
MyPageSize = MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
