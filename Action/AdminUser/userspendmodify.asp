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
ID=ChkStr(Request("ID"),2)

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_Spend where ID="&ID
Rs.open Sql,Conn,1,1

Set Rs2= Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_User where UserName='"&Rs("UserName")&"'"
Rs2.open Sql,Conn,1,1
If Rs2.Eof Then AlertRef("用户不存在")


%>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">修改结算</td>
</tr>
<form name="form4" method="post" action="../../AdminUser.aspx?Action=userspendmodifysave&ID=<%=ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<tr> 
<td width="180" class="td_r">用户：</td>
<td><%=Rs("UserName")%></td>
</tr>

<tr> 
<td class="td_r">用户类型：</td>
<td>
<%
If Rs("UserType")=1 Then
 Response.write "网站主"
ElseIf Rs("UserType")=3 Then
 Response.write "客服"
ElseIf Rs("UserType")=4 Then
 Response.write "商务"
End If
%>
</td>
</tr>

<tr> 
<td class="td_r">总收入：</td>
<td><%=GetTurnCent(Rs2("Total_Cent"))%>元</td>
</tr>
<tr> 
<td class="td_r">已结算：</td>
<td><%=GetTurnCent(Rs2("Spend_Cent"))%>元</td>
</tr>
<tr> 
<td class="td_r">未结算：</td>
<td><%=GetTurnCent(Rs2("Spare_Cent"))%>元</td>
</tr>
<tr> 
<td class="td_r">此次结算：</td>
<td style="font-size:18px;font-weight:bold;"><%=GetTurnCent(Rs("Spend_Cent"))%>元</td>
</tr>
<tr> 
<td class="td_r">状态：</td>
<td>
<%If Rs("AdminCheck")=0 Then%> <select name="SpendState" id="SpendState">
<option value="2"<%If Rs("SpendState")=2 Then Response.Write" selected"%>>通过审核</option>
<option value="3"<%If Rs("SpendState")=3 Then Response.Write" selected"%>>拒绝审核</option>
</select>
<input name="AdminCheck" type="hidden" value="0">
<%Else%>
<input name="AdminCheck" type="hidden" value="1">
<%
If Rs("SpendState")=2 Then
Response.Write"已经通过审核"
ElseIf Rs("SpendState")=3 Then
Response.Write"已经拒绝审核"
End If
%>
<%End If%>
</td>
</tr>

<tr> 
<td class="td_r">管理员说明：</td>
<td>
<textarea name="AdminDesc" id="AdminDesc" cols="60" rows="3"><%=Rs("AdminDesc")%></textarea>
<%If Rs("SpendType")=0 Then%>
<br /><input type="radio" name="radio1" value="1" onclick="document.getElementById('AdminDesc').value='已付款，请查收';document.getElementById('SpendState').value=2;">已付款，请查收
<br /><input type="radio" name="radio1" value="2" onclick="document.getElementById('AdminDesc').value='禁止作弊，拒绝支付';document.getElementById('SpendState').value=3;">禁止作弊，拒绝支付
<%End If%>
</td>
</tr>
	
<tr> 
<td class="td_r">结算时间：</td>
<td>
<input name="AdminSpendTime" type="text" id="AdminSpendTime" value="<%If Rs("AdminSpendTime")="" or isnull(Rs("AdminSpendTime")) Then
 Response.write Now()
Else
Response.write Rs("AdminSpendTime")
 End If%>">
</td>
</tr>
	
<tr> 
<td></td>
<td><input type="submit" name="submit" value="修改" class="btn btn-primary"></td>
</tr>
</form>
	
<tr class="tr_1"> 
<td colspan="2">用户的汇款方式如下</td>
</tr>
<%
If Rs2("UserState")=0 Then
%>
<tr> 
<td class="td_r"></td>
<td>用户被禁用时无法查看汇款信息</td>
</tr>
<%Else%>
<tr> 
<td class="td_r">真实姓名：</td>
<td>
<%=Rs2("Pay_RealName")%>
<%If Rs2("UserType")=3 Then Response.write "&nbsp;&nbsp;[此人是本站客服人员:"&Rs2("UserNick")&"]"%>
<%If Rs2("UserType")=4 Then Response.write "&nbsp;&nbsp;[此人是本站商务人员:"&Rs2("UserNick")&"]"%>
</td>
</tr>
	
<%if Rs2("Pay_Type")="" Then%>
<tr> 
<td class="td_r"></td>
<td>没有填写汇款方式</td>
</tr>
<%Else%>
<tr> 
<td class="td_r">收款方式</td>
<td>
<%
If Rs2("pay_type")="alipay" Then
 Response.write "支付宝"
ElseIf Rs2("pay_type")="tenpay" Then
 Response.write "财付通"
ElseIf Rs2("pay_type")="boc" Then
 Response.write "中国银行"
ElseIf Rs2("pay_type")="abc" Then
 Response.write "农业银行"
ElseIf Rs2("pay_type")="icbc" Then
 Response.write "工商银行"
ElseIf Rs2("pay_type")="ccb" Then
 Response.write "建设银行"
ElseIf Rs2("pay_type")="cmb" Then
 Response.write "招商银行"
ElseIf Rs2("pay_type")="otherbank" Then
 Response.write "其它银行"
End If


%>
</td>
</tr>

<tr> 
<td class="td_r">帐号：</td>
<td><%=Rs2("pay_account")%></td>
</tr>

<%If Not(Rs2("pay_type")="alipay" Or Rs2("pay_type")="alipay") Then%>
<tr> 
<td class="td_r">开户银行：</td>
<td><%=Rs2("pay_bankaddress")%></td>
</tr>
<%End If%>
<%End If%>	
<%End If%>
<tr> 
<td class="td_r">用户此次结算填写的说明：</td>
<td><%=Rs("SpendDesc")%></td>
</tr>
</table>

<div class='explain'>注：此用户最近10笔结算</div>
<table class="tb_1">
  <tr class="tr_1"> 
    <td>结算ID</a></td>
    <td>结算金额</td>
    <td>结算说明</td>
    <td>申请时间</td>
    <td>结算状态</td>
    <td>结算类型</td>
    <td>管理员说明</td>
    <td>结算时间</td>
  </tr>
<%
Sql = "Select Top 10 * From CFWztg_Spend Where UserName='"&Rs2("UserName")&"'"

Sql=Sql&" And SpendType=0"

Sql=Sql&" Order By ID Desc"

Set Rs = Server.CreateObject("Adodb.RecordSet")
Rs.Open Sql,Conn,1,1

While Not Rs.Eof
%>
  <tr class="tr_2"> 
    <td><%=Rs("ID")%></td>
    <td><%=GetTurnCent(Rs("Spend_Cent"))%>元</td>
    <td><%=Rs("SpendDesc")%></td>
    <td><%=Rs("SpendTime")%></td>
    <td><%
If Rs("SpendState")=1 Then
 Response.Write "结算审核中"
ElseIf Rs("SpendState")=2 Then
 Response.Write "结算成功"
ElseIf Rs("SpendState")=3 Then
 Response.Write "结算失败,"&Rs("SpendAbortFeedBack")
End If%></td>
<td> 
<%
If Rs("SpendType")=0 Then
 Response.Write "广告收入"
ElseIf Rs("SpendType")=1 Then
 Response.Write "提成推荐用户收入"
ElseIf Rs("SpendType")=2 Then
 Response.Write "销售商品收入"
End If%></td>
<td ><%=rs("AdminDesc")%></td>
<td><%=rs("AdminSpendTime")%></td>
</tr>
<%
MyPageSize = MyPageSize-1
Rs.MoveNext
Wend

Rs.Close
Rs2.Close
%>
</table>