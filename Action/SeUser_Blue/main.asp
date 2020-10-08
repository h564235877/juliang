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
Sql="Select * From CFWztg_User Where UserName='"&SeUserName&"'"
Set Rs=Conn.Execute(Sql)
UserID=Rs("ID")
UserTcRate=Rs("UserTcRate")
%>

<script src="../../js/clipboard.min.js"></script>

<table class="tb_1">
<tr class="tr_1"> 
<td>推广网站主链接</td>
</tr>
<tr> 
<td>
<INPUT id=lowusercode value=<%=AdPath_2%>?s=<%=UserID%> size=60>
<input type="button" value="复制" id="copya1" data-clipboard-target="#lowusercode" data-clipboard-action="copy" class="btn btn-sm btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>
</td>
</tr>
</table>

<table class="tb_2">
<tr>
<td>
<div class="explain">
<%
Response.write "你对名下网站主收入的提成率:"&UserTcRate&"%"
%>，满<%=RsSet("LowSpendCent")%>元结算。
</div>
</td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td colSpan=2>账户信息</td>
</tr>

<TR>
<TD class="td_r" width="180">未结算款：</TD>
<TD><%=FormatNumber(Rs("Spare_Cent"),2,-1,0,0)%>元</TD>
</TR>

<tr>
<td class="td_r">未审核结算笔数：</td>
<td>
<%
Sql = "Select Count(1) From CFWztg_Spend Where UserName='"&SeUserName&"' And SpendType=0 And SpendState=1"
Set Rs2=Conn.Execute(Sql)
Response.write "<a href='?Action=spendlist&SpendType=0'>"&Rs2(0)&"笔</a>"
Rs2.Close
%>
</td>
</tr>

<tr>
<td class="td_r">管理员最新已回复留言数：</td>
<td>
<%
Sql="Select Count(1) From CFWztg_Gbook where UserName='"&SeUserName&"' And IsRead_Admin=1 And IsRead_User=0"
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
Sql="Select Count(1) From CFWztg_Gbook where UserName='"&SeUserName&"' And IsRead_Admin=0"
Set Rs2=Conn.Execute(Sql)
Response.write "<a href='?Action=gbooklist'>"&Rs2(0)&"条</a>"
Rs2.Close
%>
</td>
</tr>

<tr class="tr_1"> 
<td colSpan=2>其它</td>
</tr>

<TR>
<TD class="td_r">
帐号收款人：
</TD>
<TD><%=Rs("Pay_RealName")%></TD>
</TR>

<%
If Rs("BindUserName")<>"" Then
%>
<TR>
<TD class="td_r">
关联商务账号：
</TD>
<TD><%=Rs("BindUserName")%> (关联后用客服或商务的推广链接都可以记录在相同账号名下)</TD>
</TR>
<%
Rs2.Close
End If%>
<TR>
<TD class="td_r">
上一次登录时间：
</TD>
<TD>
<%=Rs("PreviousLoginTime") %>
</TD>
</TR>

<TR>
<TD class="td_r">
上一次登录IP：
</TD>
<TD>
<%=Rs("PreviousLoginIp")%>/<%=GetIpArea(Rs("PreviousLoginIp"))%>
</TD>
</TR>
</table>
<%Rs.Close%>


<table class="tb_1">
<tr class="tr_1"> 
<td>联盟公告/<a href="?Action=sysinfolist">查看全部公告</a></td>
</tr>
<%
Sql="Select Top 8 * From CFWztg_SysInfo Where Assort=1 Order By ListID Desc,ID Desc"
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


