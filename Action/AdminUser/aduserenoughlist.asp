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
PageUrl = "?Action="&Action

Sql="Select * From CFWztg_AdUser_OnlinePay Order By ID Desc"
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
%>
<table class="tb_2">
<tr>
<td><span class="title">充值记录</span><a href="?Action=aduserenoughadd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>为广告主充值</span></a></td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td>充入账号</td>
<td>充值订单</td>
<td>充值金额</td>
<td>充值时间</td>
<td>已支付</td>
<td>充值类型</td>
<td>操作</td>
</tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td><%=Rs("AdUserName")%></td>
<td><%=Rs("OrderCode")%></td>
<td><%=Rs("PayMoney")%></td>
<td><%=Rs("AddTime")%></td>
<td><%
If Rs("PayOk")=0 Then
 Response.write "否"
ElseIf Rs("PayOk")=1 Then
 Response.write "是"
End if
%></td>
    <td align="center"> <%
If Rs("EnoughType")=1 Then
 Response.write "在线支付"
ElseIf Rs("EnoughType")=2 Then
 Response.write "管理员人工充值"
End if
%>
</td>
<td>
<a href="javascript:;" onclick="$(function () { confirm('确定要删除这个充值定单吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=aduserenoughdel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> 删除</a>
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