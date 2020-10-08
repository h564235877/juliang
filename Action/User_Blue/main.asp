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
Sql="Select Top 3 Reply,AddTime From CFWztg_Gbook Where Assort=0 And UserName='"&UserName&"' Order By AddTime Desc"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
If Not Rs.Eof Then%>
<div class="explain">
<span style="font-size:14px; font-weight:bold;">管理员给您的以下提醒，有问题请联系您的客服专员：</span><br />
<%
I=0
While Not Rs.Eof
I=I+1
%>
<%=I%>.<%=Rs("Reply")%> [<%=Rs("AddTime")%>]<br />
<%
Rs.MoveNext
Wend
Rs.Close
%>
</div>
<%End If%>


<table class="tb_1">
<tr> 
<TD>
您的客服专员：
<%
Sql="Select UpUserName From CFWztg_User Where UserName='"&UserName&"'"
Set Rs=Conn.Execute(Sql)
If Rs("UpUserName")<>"" Then

Sql="Select UserNick,QQ From CFWztg_User where UserType=3 And UserState=1 And UserName='"&Rs("UpUserName")&"'"
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
Rs.Close
%>
</TD>
</TR>
</table>

<%
If LowReg_Ad_ID<>0 Then
Sql="Select Count(1) From CFWztg_Ad Where ID="&LowReg_Ad_ID
Set Rs=Conn.Execute(Sql)
If Rs(0)>0 Then

Sql="Select ID From CFWztg_User Where UserName='"&UserName&"'"
Set Rs2=Conn.Execute(Sql)
UserID=Rs2("ID")
Rs2.Close
%>

<script src="../../js/clipboard.min.js"></script>

<table class="tb_1">
<tr class="tr_1"> 
<td>下线推广地址</td>
</tr>
<tr> 
<td>
<INPUT id=lowusercode value=<%=AdPath_2%>cf.aspx?<%=UserID%> size=40 type="text" readonly>

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
If RsSet("UserTcLayer")>0 Then
 Response.write "本系统支持"&RsSet("UserTcLayer")&"级用户推荐提成功能，"
 If RsSet("UserTcLayer")>=1 Then Response.write "一级(直接推荐的用户)：" & RsSet("UserTcLayer1Rate") & "%，"
 If RsSet("UserTcLayer")>=2 Then Response.write "二级用户提成：" & RsSet("UserTcLayer2Rate") & "%，"
 If RsSet("UserTcLayer")>=3 Then Response.write "三级用户提成：" & RsSet("UserTcLayer3Rate") & "%，"
 If RsSet("UserTcLayer")>=4 Then Response.write "四级用户提成：" & RsSet("UserTcLayer4Rate") & "%，"
 If RsSet("UserTcLayer")>=5 Then Response.write "五级用户提成：" & RsSet("UserTcLayer5Rate") & "%，"
 Response.write "为永久提成收益高，欢迎推广！请不要自己推荐自己，这类行为会严惩。"
End If
%>
</div>
</td>
</tr>

</table>
<%Else%>
<table class="tb_1">
<tr class="tr_1"> 
<td>下线推广地址</td>
</tr>
<tr> 
<td>
下线广告ID不存在，需管理员重新指定
</td>
</tr>
</table>

<%
End If

End If
Rs.Close
%>

<table class="tb_1">
<tr class="tr_1"> 
<td colSpan=2>账户信息</td>
</tr>
<%
Sql="Select * From CFWztg_User Where UserName='"&UserName&"'"
Set Rs=Conn.Execute(Sql)
%>
<TR>
<TD class="td_r" width="180">未结算款：</TD>
<TD><%=FormatNumber(Rs("Spare_Cent"),2,-1,0,0)%>元</TD>
</TR>

<tr>
<td class="td_r">未审核结算笔数：</td>
<td>
<%
Sql = "Select Count(1) From CFWztg_Spend Where UserName='"&UserName&"' And SpendType=0 And SpendState=1"
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
Sql="Select Count(1) From CFWztg_Gbook where UserName='"&UserName&"' And IsRead_Admin=1 And IsRead_User=0"
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
Sql="Select Count(1) From CFWztg_Gbook where UserName='"&UserName&"' And IsRead_Admin=0"
Set Rs2=Conn.Execute(Sql)
Response.write "<a href='?Action=gbooklist'>"&Rs2(0)&"条</a>"
Rs2.Close
%>
</td>
</tr>

<tr class="tr_1"> 
<td colSpan=2>CPC,CPV,CPA收入情况</td>
</tr>


<%
Sql="Select top 2 AddDate,Sum(User_Income_Cent) As User_Income_Cent,Sum(User_Income_CPC) As User_Income_CPC,Sum(User_Income_CPM) As User_Income_CPM,Sum(User_Income_CPA) As User_Income_CPA  From CFWztg_AD_Counter_Day Where UserName='"&UserName&"'  Group By AddDate Order By AddDate Desc"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
%>
<TR>
<TD  class="td_r"><%
If rs2("AddDate")=Date() Then
 Response.write "今天："
ElseIf rs2("AddDate")=Date()-1 Then
 Response.write  "昨天："
Else
 Response.write Right("0"&Month(rs2("AddDate")),2)&"月"&Right("0"&Day(rs2("AddDate")),2)&"："
End If
%>
</TD>
<TD>
<%
Response.write "总计收入:"&FormatNumber(Cdbl(Rs2("User_Income_Cent")),2,-1,0,0)& "元"
Response.write "&nbsp;&nbsp;CPC收入:"&FormatNumber(Cdbl(Rs2("User_Income_CPC")),2,-1,0,0)& "元"
Response.write "&nbsp;&nbsp;CPV收入:"&FormatNumber(Cdbl(Rs2("User_Income_CPM")),2,-1,0,0)& "元"
Response.write "&nbsp;&nbsp;CPA收入:"&FormatNumber(Cdbl(Rs2("User_Income_CPA")),2,-1,0,0)& "元"
%>
</TD>
</TR>
<%
Rs2.MoveNext
Wend
%>



<%
Sql="Select sum(User_Income_Cent) As User_Income_Cent,Sum(User_Income_CPC) As User_Income_CPC,Sum(User_Income_CPM) As User_Income_CPM,Sum(User_Income_CPA) As User_Income_CPA  From CFWztg_AD_Counter_Day Where UserName='"&UserName&"' and Datediff(m,AddDate,getdate())=0"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
%>
<TR>
<TD  class="td_r">
本月:
</TD>
<TD>
<%
Response.write "总计收入:"&FormatNumber(Cdbl(Rs2("User_Income_Cent")),2,-1,0,0)& "元"
Response.write "&nbsp;&nbsp;CPC收入:"&FormatNumber(Cdbl(Rs2("User_Income_CPC")),2,-1,0,0)& "元"
Response.write "&nbsp;&nbsp;CPV收入:"&FormatNumber(Cdbl(Rs2("User_Income_CPM")),2,-1,0,0)& "元"
Response.write "&nbsp;&nbsp;CPA收入:"&FormatNumber(Cdbl(Rs2("User_Income_CPA")),2,-1,0,0)& "元"
%>
</TD>
</TR>
<%
Rs2.MoveNext
Wend
%>


<tr class="tr_1"> 
<td colSpan=2>CPS收入情况</td>
</tr>
<%
Sql="Select top 2 convert(varchar(10),SpendTime,120) as AddDate,Sum(Spend_Cent) As User_Income_Cent From CFWztg_Spend Where UserName='"&UserName&"' And  SpendType=2  Group By convert(varchar(10),SpendTime,120) Order By AddDate Desc"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
%>
<TR>
<TD class="td_r">
<%
If rs2("AddDate")=Date() Then
 Response.write "今天CPS收入："
ElseIf rs2("AddDate")=Date()-1 Then
 Response.write  "昨天收入："
Else
 Response.write Right("0"&Month(rs2("AddDate")),2)&"月"&Right("0"&Day(rs2("AddDate")),2)&"日CPS收入："
End If
%>
</TD>
<TD><%=FormatNumber(Cdbl(Rs2("User_Income_Cent")),2,-1,0,0)%>元</TD>
</TR>
<%
Rs2.MoveNext
Wend
%>

<%
Sql="Select Sum(Spend_Cent) As User_Income_Cent From CFWztg_Spend Where UserName='"&UserName&"' And  SpendType=2 and datediff(m,SpendTime,getdate())=0"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
%>
<TR>
<TD class="td_r">
本月:
</TD>
<TD><%=FormatNumber(Cdbl(Rs2("User_Income_Cent")),2,-1,0,0)%>元</TD>
</TR>
<%
Rs2.MoveNext
Wend
%>


<tr class="tr_1"> 
<td colSpan=2>下线提成收入情况</td>
</tr>  
<%
Sql="Select top 2 convert(varchar(10),SpendTime,120) as AddDate,Sum(Spend_Cent) As User_Income_Cent From CFWztg_Spend Where UserName='"&UserName&"' And  SpendType=1  Group By convert(varchar(10),SpendTime,120) Order By AddDate Desc"
Set Rs2=Conn.Execute(Sql)

While Not Rs2.Eof
%>
<TR>
<TD class="td_r">
<%
If rs2("AddDate")=Date() Then
 Response.write "今天下线提成："
ElseIf rs2("AddDate")=Date()-1 Then
 Response.write  "昨天下线提成："
Else
 Response.write Right("0"&Month(rs2("AddDate")),2)&"月"&Right("0"&Day(rs2("AddDate")),2)&"日下线提成："
End If
%>
</TD>
<TD><%=FormatNumber(Cdbl(Rs2("User_Income_Cent")),2,-1,0,0)%>元</TD>
</TR>

<%
Rs2.MoveNext
Wend
%>


<%
Sql="Select Sum(Spend_Cent) As User_Income_Cent From CFWztg_Spend Where UserName='"&UserName&"' And  SpendType=1 and datediff(m,SpendTime,getdate())=0"
Set Rs2=Conn.Execute(Sql)

While Not Rs2.Eof
%>
<TR>
<TD class="td_r">
本月:
</TD>
<TD><%=FormatNumber(Cdbl(Rs2("User_Income_Cent")),2,-1,0,0)%>元</TD>
</TR>
<%
Rs2.MoveNext
Wend
%>


<tr class="tr_1"> 
<td colSpan=2>其它</td>
</tr>

<TR>
<TD class="td_r">
帐号收款人：
</TD>
<TD><%=Rs("Pay_RealName")%></TD>
</TR>


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


