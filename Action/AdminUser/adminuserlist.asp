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

Sql="Select * From CFWztg_AdminUser Order By PowerLevel"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1
 Rs.pagesize=50
 TotalRs=Rs.RecordCount
 TotalPage=Rs.PageCount
 MyPageSize=Rs.PageSize
 FixedSize=rs.pagesize
 Rs.AbsolutePage=Page
End If
%>


<a href="?Action=adminuseradd" class="actionBtn add" style="margin-top:10px;"><i class="mdi mdi-plus"></i><span>增加管理员</span></a>

<table class="tb_1">
<tr class="tr_1"> 
<td>管理员用户名</td>
<td>描述</td>
<td>级别</td>
<td>上次登录IP</td>
<td>上次登录时间</td>
<td>最后登录IP</td>
<td>最后登录时间</td>
<td>登录总数</td>
<td>操作</td>
</tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td><%=rs("AdminUserName")%></td>
<td><%=rs("AdminUserDesc")%></td>
<td>
<%
If Rs("PowerLevel")=1 Then
 Response.Write "超级管理员"
ElseIf Rs("PowerLevel")=2 Then
 Response.Write "普通管理员"
End If
%>
</td>
<td><%=rs("PreviousLoginIp")%></td>
<td><%=rs("PreviousLoginTime")%></td>
<td><%=rs("LastLoginIp")%></td>
<td><%=rs("LastLoginTime")%></td>
<td><%=rs("LoginTotal")%></td>
<td>
<a href="?Action=adminusermodify&AdminUserName=<%=rs("AdminUserName")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>修改</a>
<a href="javascript:;" onclick="$(function () { confirm('你确定要删除吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=adminuserdel&AdminUserName=<%=rs("AdminUserName")%>&PowerLevel=<%=rs("PowerLevel")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>删除</a>
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
</td>
</tr>
</table>