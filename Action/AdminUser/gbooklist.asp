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
If Request("Assort")="" Then Assort = -1 Else Assort = CInt(ChkStr(Request("Assort"),2))

If Request("IsRead_Admin")="" Then IsRead_Admin = -1 Else IsRead_Admin = CInt(ChkStr(Request("IsRead_Admin"),2))

PageUrl = "?Action="&Action&"&Assort="&Assort&"&IsRead_Admin="&IsRead_Admin
%>

<ul class="tab">
<li><a href="?Action=<%=Action%>&Assort=-1"<%If Assort=-1 Then Response.write " class='selected'"%>><span>全部系统消息和用户留言</span></a></li>
<li><a href="?Action=<%=Action%>&Assort=0"<%If Assort=0 Then Response.write " class='selected'"%>><span>系统消息</span></a></li>
<li><a href="?Action=<%=Action%>&Assort=1"<%If Assort=1 Then Response.write " class='selected'"%>><span>用户留言</span></a></li>
</ul>

<%If Assort=1 Then%>
<div class="tabs_header">
<ul class="tabs">
<li <%If IsRead_Admin=-1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Assort=1&IsRead_Admin=-1"><span>全部留言</span></a></li>
<li <%If IsRead_Admin=0 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Assort=1&IsRead_Admin=0"><span>未回复的用户留言</span></a></li>
<li <%If IsRead_Admin=1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Assort=1&IsRead_Admin=1"><span>已回复的用户留言</span></a></li>
</ul>
</div>
<%End If%>

<a href="?Action=gbookadd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>增加留言</span></a>

<%
Sql="Select * From CFWztg_Gbook Where 1=1"

If Assort>=0 Then Sql=Sql&" And Assort="&Assort
If IsRead_Admin>=0 Then Sql=Sql&" And IsRead_Admin="&IsRead_Admin

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
%>

<form name="form_gbooklist" id="form_gbooklist" method="post" action="../../AdminUser.aspx?Action=gbookseldel">
<table class="tb_1">
<tr class="tr_1"> 
<td><input name="chkall" type="checkbox" id="chkall" onclick="selectcheckbox(this.form)" value="check"></td>
<td>类型</td>
<td>用户名</td>
<td>内容</td>
<td>加入时间</td>
<td>管理员回复</td>
<td>回复时间</td>
<td>操 作</td>
</tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2">
<td> 
<%
Response.write "<input name='ID_Sel' type='checkbox' id='ID_Sel' value='"&rs("ID")&"'>"
%>
</td>
<td>
<%If rs("Assort") = 0 Then
Response.write "系统"
ElseIf rs("Assort") = 1 Then
Response.write "网站主"
ElseIf rs("Assort") = 2 Then
Response.write "广告主"
ElseIf rs("Assort") = 3 Then
Response.write "客服"
ElseIf rs("Assort") = 4 Then
Response.write "商务"
End If%>
</td>
<td><%=rs("UserName")%></td>
<td><%
'--管理员未查阅时
If Rs("IsRead_Admin")=0 Then
Response.write "[<font color='#ff0000'>未回复</font>]"
Else
Response.write "[已回复]"
End If

Response.write rs("Content")%></td>
<td><%=rs("AddTime")%></td>
<td><%=rs("Reply")%></td>
<td><%=rs("ReplyTime")%></td>
<td>
<a href="?Action=gbookreply&id=<%=rs("id")%>" class="btn_edit"><i class="mdi mdi-pencil"></i> 回复</a>

<a href="javascript:;" onclick="$(function () { confirm('你确定要删除吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=gbookdel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> 删除</a>
</td>
</tr>
<%
MyPageSize=MyPageSize-1
Rs.MoveNext
Wend
%>
</table>
</form>
<a href="javascript:;" onclick="$(function () { confirm('你确定要删除选择的记录吗?', '', function (isConfirm) {if (isConfirm) {$('#form_gbooklist').submit();}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-window-close"></i>删除选择</a>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
