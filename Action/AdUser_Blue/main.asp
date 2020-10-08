<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">账户信息</td>
</tr>
<%
Sql="Select * From CFWztg_User Where UserName='"&AdUserName&"'"
Set Rs=Conn.Execute(Sql)
%>
<TR>
<TD width="180" class="td_r">剩余金额：</TD>
<TD><%=FormatNumber(Rs("Spare_Cent"),2,-1,0,0)%>元</TD>
</TR>

<tr>
<td class="td_r">未审核广告发布数：</td>
<td>
<%
Sql="Select Count(1) From CFWztg_AdUser_Expend where AdUserName='"&AdUserName&"' And AdminCheck=0"

Set Rs2=Conn.Execute(Sql)
Response.write "<a href='?Action=waitadlist'>"&Rs2(0)&"条</a>"
Rs2.Close
%>
</td>
</tr>

<tr>
<td class="td_r">未审核广告修改数：</td>
<td>
<%
Sql="Select Count(1) From CFWztg_AD_Check a inner join CFWztg_AD b on a.ad_id=b.id Where b.AdUserName='"&AdUserName&"' And a.CheckState=1"

Set Rs2=Conn.Execute(Sql)
Response.write "<a href='?Action=waitadlist'>"&Rs2(0)&"条</a>"
Rs2.Close
%>
</td>
</tr>

<tr>
<td class="td_r">管理员最新已回复留言数：</td>
<td>
<%
Sql="Select Count(1) From CFWztg_Gbook where UserName='"&AdUserName&"' And IsRead_Admin=1 And IsRead_User=0"
Set Rs2=Conn.Execute(Sql)
Response.write "<a href='?Action=gbooklist'>"&Rs2(0)&"条</a>"
Rs2.Close
%>
</td>
</tr>

<tr>
<td class="td_r">管理员未回复留言数：</td>
<td>
<%
Sql="Select Count(1) From CFWztg_Gbook where UserName='"&AdUserName&"' And IsRead_Admin=0"
Set Rs2=Conn.Execute(Sql)
Response.write "<a href='?Action=gbooklist'>"&Rs2(0)&"条</a>"
Rs2.Close
%>
</td>
</tr>

<TR>
<TD class="td_r">
您的商务专员：
</TD>
<TD>
<%
If Rs("UpUserName")<>"" Then

Sql="Select UserNick,QQ From CFWztg_User where UserType=4 And UserState=1 And UserName='"&Rs("UpUserName")&"'"
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
If Not Rs2.Eof Then
 Response.write Rs2("UserNick")
 Response.write "，QQ:"&Rs2("QQ")&"&nbsp;<a target='_blank' href='http://wpa.qq.com/msgrd?v=3&uin="&Rs2("QQ")&"&site=qq&menu=yes'><img border='0'  src='../../images/qqonline2.gif' alt='点击这里给我发消息' title='点击这里给我发消息'></a>"
Else
 Response.write "当前客服专员失效，<a href='?Action=datamodify'>重新选择一个</a>?" 
End If
Rs2.Close

Else
 Response.write "当前没有选择客服专员，<a href='?Action=datamodify'>选择一个</a>?" 
End If
%>
</TD>
</TR>

<tr> 
<td class="td_r">
上一次登录时间：
</td>
<td><%=Rs("PreviousLoginTime") %></td>
</tr>
  
<tr> 
<td class="td_r">
上一次登录IP：
</td>
<td><%=Rs("PreviousLoginIp")%>/<%=GetIpArea(Rs("PreviousLoginIp"))%></td>
</tr>

</table>



<table class="tb_1">
<tr class="tr_1"> 
<td>联盟公告/<a href="?Action=sysinfolist">查看全部公告</a></td>
</tr>
<%
Sql="Select Top 8 * From CFWztg_SysInfo Where Assort=2 Order By ListID Desc,ID Desc"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
I=0
While Not Rs.Eof
I=I+1
%>
<tr><td><A title=<%=Rs("Title")%> href="?Action=sysinfoshow&ID=<%=Rs("ID")%>"><%=Rs("Title")%></A><SPAN><%=Right("0"&Month(rs("AddDate")),2)&"-"&Right("0"&Day(rs("AddDate")),2)%></tr></td>
<%
Rs.MoveNext
Wend
%>
</table>

