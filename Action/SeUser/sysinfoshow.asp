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
ID=Goback(ChkStr(Request("ID"),2),"请输入ID号")

Sql="Select * From CFWztg_SysInfo Where ID="&ID
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
%>
	
<table class="tb_1">
<tr class="tr_1"> 
<td><%=Rs("Title")%></td>
</tr>
<tr> 
<td><%=Replace(Rs("Content"),Chr(13) & Chr(10),"<br>")%></td>
</tr>
<tr> 
<td class="td_3">发布时间:<%=Rs("AddTime")%></td>
</tr>
<tr>
<td class="td_2">
<a href="javascript:history.go(-1);">返回上页</a>
</td>
</tr>
</table>  