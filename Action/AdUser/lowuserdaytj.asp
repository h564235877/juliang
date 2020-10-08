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
<td>日　期</td>
<td>CPA用户总数</td>
<td>操　作</td>
</tr>
<%
PageUrl = "?Action="&Action

Sql="select AddDate,count(1) as LowNum from CFWztg_LowUser Where AdUserName='"&AdUserName&"' group by AddDate Order By AddDate Desc"

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

<%
While Not Rs.Eof And MyPageSize>0
%>
<tr> 
<td><%=Rs("AddDate")%></td>
<td><%=Rs("LowNum")%></td>
<td><a href="?Action=lowuserlist&AddDate=<%=Rs("AddDate")%>" class="btn_add"><i class="mdi mdi-eye"></i> 查看</a></td>
</tr>
<%
Rs2.Close
Mypagesize=Mypagesize-1
Rs.MoveNext
Wend
Rs.Close
%>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
