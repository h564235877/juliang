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

PageUrl = "?Action="&Action&"&Assort="&Assort

Sql="Select * From CFWztg_Gbook Where UserName='"&UserName&"'"
If Assort>=0 Then Sql=Sql&" And Assort="&Assort
Sql=Sql&" Order By ID Desc"

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
%>


<div class="tabs_header">
<ul class="tabs">
<li <%If Assort=-1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Assort=-1"><span>所有消息</span></a></li>
<li <%If Assort=0 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Assort=0"><span>系统消息</span></a></li>
<li <%If Assort=1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Assort=1"><span>用户提问</span></a></li>
<a href="?Action=gbookadd" class="actionBtn add" style="margin-top:10px;"><i class="mdi mdi-plus"></i><span>我要提问</span></a>
</ul>
</div>

<table class="tb_1">
  <tr  class="tr_1">     
    <td>类型</td>
    <td>内容</td>
    <td>提问时间</td>
	<td>管理员是否查阅</td>
    <td>管理员回复</td>
    <td>回复时间</td>
</tr>
<%
While not rs.eof and mypagesize>0
%>
  <tr class="tr_2"> 
    <td><%If rs("Assort")=0 Then Response.write "系统消息" Else Response.write "用户提问"%></td>
    <td><%=rs("Content")%></td>
    <td><%=rs("AddTime")%></td>
    <td><%
If Rs("IsRead_Admin")=0 Then
 Response.write "未查阅"
ElseIf Rs("IsRead_Admin")=1 Then
 Response.write "已查阅"
End If
%></td>
    <td><%
'--管理员已查阅用户未标识已读时	
If Rs("IsRead_Admin")=1 And Rs("IsRead_User")=0 Then Response.write "[<a href='../../User.aspx?Action=gbookmodifysave&ID="&Rs("ID")&"'><font color='#ff0000'>标识已读</font></a>]"

 Response.write rs("Reply")
%></td>
<td><%=rs("ReplyTime")%></td>
</tr>
<%
mypagesize=mypagesize-1
rs.movenext
Wend
Rs.Close
%>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
