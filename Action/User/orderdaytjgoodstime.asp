<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>


<table>
<tr> 

<td>
<select id='AdUserName' onChange="window.location=document.getElementById('AdUserName').options[document.getElementById('AdUserName').selectedIndex].value">
<option value=?Action=<%=Action%>>请选择广告主</option>
<%
Sql="Select AdUserName From CFWztg_AdUser_Order Group By AdUserName Order By AdUserName"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='?Action="&Action&"&AdUserName="&Rs("AdUserName")&"'"
 If Request("AdUserName")=Cstr(Rs("AdUserName")) Then Response.Write " selected"
 Response.Write ">"&Rs("AdUserName")&"</option>"
Rs.MoveNext
Wend
%>
</select>
</td>
</tr> 
</table>

<%
AdUserName = ChkStr(Request("AdUserName"),1)

PageUrl = "?Action="&Action&"&AdUserName="&AdUserName
%>

<table class="tb_2">
<tr>   
<td>		
<span class="title">订单每日统计报表 广告主:<%=AdUserName%></span></td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td>日　期</td>
<td>商品总数</td>
<td>订单总数</td>
<td>订单总金额</td>
<td>总收入</td>
</tr>
<%

Sql="select convert(varchar(10),goodstime,120) as adddate from CFWztg_AdUser_Order Where UserName='"&UserName&"'"
If AdUserName<>"" Then Sql=Sql&" And AdUserName='"&AdUserName&"'"
Sql=Sql&" group by convert(varchar(10),goodstime,120) order by adddate desc"

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

Sql="select count(1) as ordernum,IsNull(sum(ordercent),0) as ordercent,IsNull(sum(ordercent * ordertcrate/100),0) as tccent,IsNull(sum(goodstotal),0) as goodstotal from CFWztg_AdUser_Order Where UserName='" & UserName & "' and Datediff(d,'"&Rs("AddDate")&"',goodstime)=0 And (OrderState=1 or OrderState=3)"
If AdUserName<>"" Then Sql=Sql&" And AdUserName='"&AdUserName&"'"

Set Rs2=Conn.Execute(Sql)
%>
<tr> 
<td><%=Rs("AddDate")%></td>
<td><%=Rs2("goodstotal")%></td>
<td><%=Rs2("ordernum")%></td>
<td><%=GetTurnCent(Rs2("ordercent"))%>元</td>
<td><%=GetTurnCent(Rs2("tccent"))%>元</td>
</tr>
<%
Rs2.Close
Mypagesize=Mypagesize-1
Rs.MoveNext
Wend
Rs.Close
%>

<tr>
<td colspan="6">
报表里统计的是即时确认或已经确认成功的订单
，不含等待确认或确认失败的订单，按商品购买时间统计时要是没有导入商品购买时间的订单信息，这里也不会记录，但用户的金额实际已经录入，不会缺少</td>
</tr>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
