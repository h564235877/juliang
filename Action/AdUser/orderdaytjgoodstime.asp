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
UserName=ChkStr(Request("UserName"),1)

PageUrl = "?Action="&Action&"&UserName="&UserName
%>

<table class="tb_1">
  <tr class="tr_1"> 
    <td>日　期</td>
    <td>已确认商品总数</td>
    <td>已确认订单总数</td>
    <td>已确认订单总金额</td>
    <td>已确认总支出</td>
    <td>未确认订单总数</td>
    <td>未确认订单总金额</td>
	<td>未确认总支出</td>
    <td>操　作</td>
  </tr>
<%


Sql="select convert(varchar(10),goodstime,120) as adddate from CFWztg_AdUser_Order Where AdUserName='"&AdUserName&"'"

If UserName<>"" Then Sql=Sql&" And UserName='"&UserName&"'"

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


While Not Rs.Eof And MyPageSize>0

Sql="select count(1) as ordernum,IsNull(sum(ordercent),0) as ordercent,IsNull(sum(ordercent * ordertcrate/100),0) as tccent,IsNull(sum(goodstotal),0) as goodstotal from CFWztg_AdUser_Order Where Datediff(d,'"&Rs("AddDate")&"',goodstime)=0 And (OrderState=1 or OrderState=3 or OrderState=5 or OrderState=7) And AdUserName='"&AdUserName&"'"

If UserName<>"" Then Sql=Sql&" And UserName='"&UserName&"'"

Set Rs2=Conn.Execute(Sql)

Sql="select count(1) as ordernum,IsNull(sum(ordercent),0) as ordercent,IsNull(sum(ordercent * ordertcrate/100),0) as tccent,IsNull(sum(goodstotal),0) as goodstotal from CFWztg_AdUser_Order Where Datediff(d,'"&Rs("AddDate")&"',goodstime)=0 And (OrderState=2 or OrderState=6) And AdUserName='"&AdUserName&"'"

If UserName<>"" Then Sql=Sql&" And UserName='"&UserName&"'"

Set Rs3=Conn.Execute(Sql)
%>
  <tr> 
    <td><%=Rs("AddDate")%></td>
    <td><%=Rs2("goodstotal")%></td>
    <td><%=Rs2("ordernum")%></td>
    <td><%=GetTurnCent(Rs2("ordercent"))%>元</td>
    <td><%=GetTurnCent(Rs2("tccent"))%>元</td>
    <td><%=Rs3("ordernum")%></td>
    <td><%=GetTurnCent(Rs3("ordercent"))%>元</td>
	<td><%=GetTurnCent(Rs3("tccent"))%>元</td>
	
<td>
<a href="javascript:;"  onclick="$(function () { confirm('确定要把购买日期为 <%=Rs("AddDate")%> 这天的没有确认的订单全部确认为成功状态吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdUser.aspx?Action=ordermodifysave&GoodsTime=<%=Rs("AddDate")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});">确认此天未确认订单</a>
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
<td colspan="9">
报表里统计的是即时确认或已经确认成功的订单
，不含等待确认或确认失败的订单，按商品购买时间统计时要是没有导入商品购买时间的订单信息，这里也不会记录，但用户的金额实际已经录入，不会缺少</td>
</tr>
</table>


<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>


<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>";
 searchurl += '&UserName=' + $('#UserName').val();

 location.href=searchurl;
});

});
</script>

<table class="tb_3">
<tr class="tr_1"> 
<td colspan="2">查询</td>
<tr>
<td class="td_r">订单的推荐人：</td>
<td><input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="20"></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" name="submit" value="查询" class="btn btn-sm btn-primary" id="search"></td></tr>
</table>
