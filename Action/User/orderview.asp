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
<td>广告主</td>
<td>订单号</td>
<td>订单人</td>
<td>金额</td>
<td>提成比例</td>
<td>提成金额</td>
<td>提成对象</td>
<td>订单状态</td>
<td>推荐人</td>
<td>已结算ID</td>
<td>下线联盟子用户</td>
</tr>
<%
OrderCode=ChkStr(Trim(Request("OrderCode")),1)
OrderUser=ChkStr(Trim(Request("OrderUser")),1)
LowUnionUserName=ChkStr(Trim(Request("LowUnionUserName")),1)
OrderState=ChkStr(Request("OrderState"),2)
AddTime=ChkStr(Trim(Request("AddTime")),3)

PageUrl = "?Action="&Action&"&OrderCode="&OrderCode&"&OrderUser="&OrderUser&"&LowUnionUserName="&LowUnionUserName&"&OrderState="&OrderState&"&AddTime="&AddTime


MaxListRs = 2000

Sql="Select Top "&MaxListRs&" * From CFWztg_AdUser_Order where  UserName='"&UserName&"' And OrderState<=4"

 If OrderCode<>"" Then Sql=Sql&" And OrderCode='"&OrderCode&"'"
 If OrderUser<>"" Then Sql=Sql&" And OrderUser='"&OrderUser&"'"
 If LowUnionUserName<>"" Then Sql=Sql&" And LowUnionUserName='"&LowUnionUserName&"'"
 If OrderState<>"" Then Sql=Sql&" And OrderState="&OrderState
 If AddTime<>"" Then Sql=Sql&" And DateDiff(d,'"&AddTime&"',AddTime)=0"

Sql=Sql&" Order By AddTime Desc"


Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open Sql,Conn,1,1



Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.PageSize = 20
 TotalRs = Rs.RecordCount
 TotalPage = Rs.PageCount
 MyPageSize = Rs.PageSize
 FixedSize=Rs.PageSize
 Rs.AbsolutePage = Page
End If

If TotalRs = MaxListRs Then Response.write "记录太多，只列最新"&MaxListRs&"条"

While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2"> 
	<td><%=Rs("AdUserName")%></td>
    <td><%=server.HTMLEncode(Rs("OrderCode"))%></td>
    <td><%=server.HTMLEncode(Rs("OrderUser"))%></td>
    <td><%=GetTurnCent(Rs("OrderCent"))%>元</td>
	<td><%=Rs("OrderTcRate")%>%</td>
	<td><%=GetTurnCent(CDbl(Rs("OrderCent"))*Rs("OrderTcRate")/100)%>元</td>
    <td><%
	If Rs("tcobject")=1 Then
	 Response.write "推荐人"
	Else
	 Response.write "订单人"
	End If
	%></td>
    <td> 
<%
If Rs("OrderState")=1 Then
 Response.write "即时提成"
ElseIf Rs("OrderState")=2 Then
 Response.write "等待确认"
ElseIf Rs("OrderState")=3 Then
 Response.write "确认成功"
ElseIf Rs("OrderState")=4 Then
 Response.write "确认失败"
End If
%>
</td>
<td>  
<%
If Rs("UserName")<>"" Then
Response.write Rs("UserName")
Else
Response.write "缺"
End If
%>
</td>
<td> 
<%
If Rs("SpendID")<>0 Then
Response.write Rs("SpendID")
Else
Response.write "缺"
End If
%>
</td>
<td><%=Rs("LowUnionUserName")%></td>
</tr>  
<tr>
<td colspan="12" style="border-color: #826666">
商品名称:<%=Rs("GoodsName")%>
|商品数量:<%If Rs("GoodsTotal") > 0 Then Response.write Rs("GoodsTotal")%>
|购买:<%=Rs("GoodsTime")%>
|导入:<%=Rs("AddTime")%>
|确认:<%=Rs("AffirmTime")%>

<br />

快递名称:<%=Rs("ExName")%> 
|快递单号:<%=Rs("ExCode")%>
|快递状态:<%=Rs("ExState")%>
|快递进度:<%=Rs("ExContent")%>

<br />
其它:<%=Rs("OrderDesc")%> 
</td>
</tr>

  <%
MyPageSize = MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>


<form name="form2" method="post" action="?Action=<%=Action%>">
<table class="tb_3"><tr class="tr_1"> 
<td colspan="2">查询</td>
</tr>
<tr>
<td class="td_r">订单号：</td>
<td><input name="OrderCode" type="text" id="OrderCode" value="<%=OrderCode%>" size="10"></td>
</tr>
<tr>
<td class="td_r">订单人：</td>
<td><input name="OrderUser" type="text" id="OrderUser" value="<%=OrderUser%>" size="10"></td>
</tr>
<tr>
<td class="td_r">下级联盟子用户：</td>
<td><input name="LowUnionUserName" type="text" id="LowUnionUserName" value="<%=LowUnionUserName%>" size="20"></td></tr>
<tr>
<tr>
<td class="td_r">选择状态：</td>
<td><select name="OrderState" id="OrderState">
<option value=""<% If CStr(OrderState)="" Then Response.write " selected"%>>全部定单</option>
<option value="1"<% If CStr(OrderState)="1" Then Response.write " selected"%>>即时确认的定单</option>
<option value="2"<% If CStr(OrderState)="2" Then Response.write " selected"%>>等待确认的定单</option>
<option value="3"<% If CStr(OrderState)="3" Then Response.write " selected"%>>确认成功的定单</option>
<option value="4"<% If CStr(OrderState)="4" Then Response.write " selected"%>>确认失败的定单</option>
</select></td>
</tr>
<tr>
<td class="td_r">导入时间：</td>
<td><input name="AddTime" type="text" id="AddTime" value="<%=AddTime%>" size="10" />
(格式如：1970-1-1)</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" name="submit" value="查询" class="btn btn-sm btn-primary"></td>
</tr>
</table></form>

