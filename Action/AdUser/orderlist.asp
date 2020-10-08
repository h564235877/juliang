<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>


<form name="form_orderlist" method="post" action="../../AdUser.aspx?Action=orderdo">

<table class="tb_1">
<tr class="tr_1"> 
    <td><input name="chkall" type="checkbox" id="chkall" onclick="selectcheckbox(this.form)" value="check"></td>
    <td>广告ID</td>
    <td>订单号</td>
    <td>订单人</td>
    <td>金额</td>
    <td>提成比例</td>
	<td>提成金额</td>
	<td>提成对象</td>
    <td>订单状态</td>
    <td>网站主</td>
	<td>下线联盟子用户</td>
	<td>操　作</td>
  </tr>
<%
OrderCode=ChkStr(Trim(Request("OrderCode")),1)
OrderUser=ChkStr(Trim(Request("OrderUser")),1)
UserName=ChkStr(Trim(Request("UserName")),1)
LowUnionUserName=ChkStr(Trim(Request("LowUnionUserName")),1)
OrderState=ChkStr(Request("OrderState"),2)
AddTime=ChkStr(Trim(Request("AddTime")),3)

If Request("SlefPageSize")="" Then SlefPageSize=20 Else SlefPageSize=CLng(ChkStr(Request("SlefPageSize"),2))

PageUrl = "?Action="&Action&"&OrderCode="&OrderCode&"&OrderUser="&OrderUser&"&UserName="&UserName&"&LowUnionUserName="&LowUnionUserName&"&OrderState="&OrderState&"&AddTime="&AddTime&"&SlefPageSize="&SlefPageSize

MaxListRs = 2000

Sql="Select Top "&MaxListRs&" * From CFWztg_AdUser_Order Where AdUserName='"&AdUserName&"'"


 If OrderCode<>"" Then Sql=Sql&" And OrderCode='"&OrderCode&"'"
 If OrderUser<>"" Then Sql=Sql&" And OrderUser='"&OrderUser&"'"
 If UserName<>"" Then Sql=Sql&" And UserName='"&UserName&"'"
 If LowUnionUserName<>"" Then Sql=Sql&" And LowUnionUserName='"&LowUnionUserName&"'"
 If OrderState<>"" Then Sql=Sql&" And OrderState="&OrderState
 If AddTime<>"" Then Sql=Sql&" And DateDiff(d,'"&AddTime&"',AddTime)=0"


Sql=Sql&"  Order By ID Desc"



Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.PageSize = SlefPageSize
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
<td>
<%
If Rs("OrderState")=2 Or Rs("OrderState")=6 Then
 Response.write "<input name='OrderCode_Sel' type='checkbox' id='OrderCode_Sel' value='"&Rs("ordercode")&"'>"
End If
%>
</td>
    <td><%=Rs("Ad_ID")%></td>
    <td><%=server.HTMLEncode(Rs("OrderCode"))%></td>    
    <td><%=server.HTMLEncode(Rs("OrderUser"))%></td>
    <td><%=GetTurnCent(Rs("OrderCent"))%>元</td>
	<td><%=Rs("OrderTcRate")%></td>
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
ElseIf Rs("OrderState")=5 Then'--扣了用户的点,即时提成成功
 Response.write "即时提成"
ElseIf Rs("OrderState")=6 Then'--扣了用户的点，等待确认
 Response.write "等待确认"
ElseIf Rs("OrderState")=7 Then'--扣了用户的点，确认成功
 Response.write "确认成功"
End If
%>    </td>
    <td>  
        <%
	If Rs("UserName")<>"" Then
	 Response.write server.HTMLEncode(Rs("UserName"))
	Else
	 Response.write "缺"
	End If
	%>    </td>


<td><%=Rs("LowUnionUserName")%></td>
<td>
<%
If Rs("OrderState")=2 Or Rs("OrderState")=6 Then
 Response.write "<a href='javascript:;' onclick=""$(function () { confirm('确定要把此订单设置为成功吗', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdUser.aspx?Action=ordermodifysave&OrderCode="& Rs("OrderCode") &"')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});"" class=""btn_add""><i class=""mdi mdi-plus""></i> 成功</a>"
 Response.write " <a href='javascript:;' onclick=""$(function () { confirm('确定要把此订单设置为失败吗', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdUser.aspx?Action=ordermodify_2save&OrderCode="& Rs("OrderCode") &"')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});"" class=""btn_del""><i class=""mdi mdi-window-close""></i> 失败</a>"
End If
%></td>
  </tr>
  
<tr>
<td colspan="13" style="border-color: #826666">
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

<tr>
    <td colspan="13">
<script>

function mysubmit(dotype)
{
var dotypestr


if(dotype=="ordermoremodifysave"){
 dotypestr="你确定要把所选择的订单设置为成功状态吗?";
}
else if(dotype=="ordermoremodify_2save"){
 dotypestr="你确定要把所选择的订单设置为失败状态吗?";
}

document.form_orderlist.dotype.value = dotype;

if(confirm(dotypestr)){
 document.form_orderlist.submit();
}
 
}
</script>

<input type=hidden name="dotype" value="">

<a href="#" onclick="javascript:mysubmit('ordermoremodifysave');" class="btn btn-primary"><span>修改所选择订单为成功状态</span></a>
<a href="#" onclick="javascript:mysubmit('ordermoremodify_2save');" class="btn btn-primary"><span>修改所选择订单为失败状态</span></a>
</td>
  </tr>
</table>
</form>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>


<script>
$(function(){

$("#search").click(function(){

 if(isNaN($('#SlefPageSize').val())){
  alert('每页显示请输入数字', '', function () {$("#SlefPageSize").focus();});
  return false
 }

 var searchurl ="?Action=<%=Action%>";
 searchurl += '&OrderCode=' + $('#OrderCode').val();
 searchurl += '&OrderUser=' + $('#OrderUser').val();
 searchurl += '&UserName=' + $('#UserName').val();
 searchurl += '&LowUnionUserName=' + $('#LowUnionUserName').val();
 searchurl += '&OrderState=' + $('#OrderState').val();
 searchurl += '&AddTime=' + $('#AddTime').val();
 searchurl += '&SlefPageSize=' + $('#SlefPageSize').val();

 location.href=searchurl;
});

});
</script>

  
<table class="tb_3"><tr class="tr_1"> 
      <td colspan="2">查询</td>
    <tr>
      <td class="td_r">订单号：</td>
      <td><input name="OrderCode" type="text" id="OrderCode" value="<%=OrderCode%>" size="20"></td></tr>
    <tr>
      <td class="td_r">订单人：</td>
      <td><input name="OrderUser" type="text" id="OrderUser" value="<%=OrderUser%>" size="20"></td></tr>
    <tr>
      <td class="td_r">网站主：</td>
      <td><input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="20"></td></tr>
    <tr>
    <tr>
      <td class="td_r">下级联盟子用户：</td>
      <td><input name="LowUnionUserName" type="text" id="LowUnionUserName" value="<%=LowUnionUserName%>" size="20"></td></tr>
    <tr>
      <td class="td_r">选择状态：</td>
      <td><select name="OrderState" id="OrderState">
        <option value=""<%If CStr(OrderState)="" Then Response.write " selected"%>>全部定单</option>
		<option value="1"<%If CStr(OrderState)="1" Then Response.write " selected"%>>即时确认的定单</option>
        <option value="2"<%If CStr(OrderState)="2" Then Response.write " selected"%>>等待确认的定单</option>
        <option value="3"<%If CStr(OrderState)="3" Then Response.write " selected"%>>确认成功的定单</option>
        <option value="4"<%If CStr(OrderState)="4" Then Response.write " selected"%>>确认失败的定单</option>
		<option value="5"<%If CStr(OrderState)="5" Then Response.write " selected"%>>已被扣点的定单</option>
      </select></td></tr>
    <tr>
      <td class="td_r">导入时间：</td>
      <td><input name="AddTime" type="text" id="AddTime" value="<%=AddTime%>" size="20">(格式如：1970-1-1)</td></tr>
    <tr>
      <td class="td_r">每页显示：</td>
      <td><input name="SlefPageSize" type="text" id="SlefPageSize" value="<%=SlefPageSize%>" size="10" />
      条</td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="submit" value="查询" class="btn btn-sm btn-primary" id="search"></td></tr>
</table>
