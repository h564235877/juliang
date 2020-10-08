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
Plan_ID=ChkStr(Request("Plan_ID"),2)


Sql = "Select Spare_Cent From CFWztg_User Where UserName='" & AdUserName & "'"
Set Rs = Conn.Execute(Sql)
Spare_Cent = CDbl(Rs("Spare_Cent"))
Rs.Close

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select PlanName,TotalClick_Cent,OverClick_Cent From CFWztg_Plan where ID="&Plan_ID&" And AdUserName='"&AdUserName&"'"
Rs.open Sql,Conn,1,1
PlanName=Rs("PlanName")
TotalClick_Cent=CDBL(Rs("TotalClick_Cent"))
OverClick_Cent=CDBL(Rs("OverClick_Cent"))
Rs.Close
%>  

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn" style="margin-top:10px;"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form name="form1" method="post" action="../../AdUser.aspx?Action=planchasesave&Plan_ID=<%=Plan_ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">追加或减少投放金额</td>
</tr>

<tr> 
<td width="180" class="td_r">计划编号：</td>
<td><%=Plan_ID%></td>
</tr>
<tr> 
<td class="td_r">计划名称：</td>
<td><%=PlanName%></td>
</tr>
<TR>
<TD class="td_r">计划投放总额：</TD>
<TD><%=GetTurnCent(TotalClick_Cent)%>元</TD>
</TR>
<TR>
<TD class="td_r">计划已消费金额：</TD>
<TD><%=GetTurnCent(OverClick_Cent)%>元</TD>
</TR>
<TR>
<TD class="td_r">计划剩余金额：</TD>
<TD><%=GetTurnCent(TotalClick_Cent-OverClick_Cent)%>元</TD>
</TR>
<TR> 
<TD class="td_r">计划追加或减少投放金额：</TD>
<TD><input name="ChaseClick_Cent" type="text" size="10">元<%
Response.write "(账户余额:"&Int(Spare_Cent*100/100)&"元，填写正数为追加，填写负数为减少)"
%></TD>
</TR>
<tr> 
<TD></TD>
<td>
<input type="submit" name="submit" value="确定" class="btn btn-primary">

</td>
</tr>
</table>
</form>