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

Sql="Select * From CFWztg_SysInfo Where Assort=1 Order By ListID Desc,ID Desc"
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
<table class="tb_1">
<tr class="tr_1"> 
<td>标题</td>
<td>时 间</td>
</tr>
<%
do while not rs.eof and mypagesize>0
%>
<tr class="tr_2">
<td><a href='?Action=sysinfoshow&ID=<%=Rs("ID")%>'><%=rs("Title")%></a></td>
<td><%=rs("AddTime")%></td>
</tr>
<%
mypagesize=mypagesize-1
rs.movenext
loop
Rs.Close
%>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
