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
    <td>已确认订单总数</td>
    <td>已确认订单总金额</td>
    <td>已确认总支出</td>
    <td>未确认订单总数</td>
    <td>未确认订单总金额</td>
	<td>未确认总支出</td>
    <td>操　作</td>
  </tr>
<%
PageUrl = "?Action="&Action

Sql="select convert(varchar(10),addtime,120) as adddate from CFWztg_AdUser_Order Where AdUserName='"&AdUserName&"' group by convert(varchar(10),addtime,120) Order By AddDate Desc"

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


While Not Rs.Eof And MyPageSize>0

Sql="select count(1) as ordernum,IsNull(sum(ordercent),0) as ordercent,IsNull(sum(ordercent * ordertcrate/100),0) as tccent from CFWztg_AdUser_Order Where AdUserName='" & AdUserName & "' and Datediff(d,'"&Rs("AddDate")&"',AddTime)=0 And (OrderState=1 or OrderState=3 or OrderState=5 or OrderState=7)"

Set Rs2=Conn.Execute(Sql)

Sql="select count(1) as ordernum,IsNull(sum(ordercent),0) as ordercent,IsNull(sum(ordercent * ordertcrate/100),0) as tccent from CFWztg_AdUser_Order Where AdUserName='" & AdUserName & "' and Datediff(d,'"&Rs("AddDate")&"',AddTime)=0 And (OrderState=2 or OrderState=6)"

Set Rs3=Conn.Execute(Sql)
%>
  <tr> 
    <td><%=Rs("AddDate")%></td>
    <td><%=Rs2("ordernum")%></td>
    <td><%=GetTurnCent(Rs2("ordercent"))%>元</td>
    <td><%=GetTurnCent(Rs2("tccent"))%>元</td>
    <td><%=Rs3("ordernum")%></td>
    <td><%=GetTurnCent(Rs3("ordercent"))%>元</td>
	<td><%=GetTurnCent(Rs3("tccent"))%>元</td>
    <td>
<a href="?Action=orderlist&AddTime=<%=Rs("AddDate")%>">查看详细</a><br />
<a href="javascript:;"  onclick="$(function () { confirm('确定要把导入日期为 <%=Rs("AddDate")%> 这天的没有确认的订单全部确认为成功状态吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=ordermodifysave&AddTime=<%=Rs("AddDate")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});">确认此天未确认订单</a>
	</td>
  </tr>
<%
Rs2.Close
Mypagesize=Mypagesize-1
Rs.MoveNext
Wend
Rs.Close
%>

<tr>
<td colspan="8">
报表里统计的是即时确认或已经确认成功的订单
，不含等待确认或确认失败的订单
</td>
</tr>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
