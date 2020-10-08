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
SpendState=ChkStr(Request("SpendState"),2)
If Request("SpendType")="" Then SpendType = 0 Else SpendType = CInt(ChkStr(Request("SpendType"),2))

StartDate=ChkStr(Request("StartDate"),3):If StartDate="" Then StartDate="2000-1-1"
EndDate=ChkStr(Request("EndDate"),3):If EndDate="" Then EndDate=Date()


PageUrl = "?Action="&Action&"&UserName="&UserName&"&SpendState="&SpendState&"&SpendType="&SpendType&"&StartDate="&StartDate&"&EndDate="&EndDate

%>

<div class="tabs_header">
<ul class="tabs">
<li <%If SpendType=-1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&SpendType=-1"><span>所有结算记录</span></a></li>
<li <%If SpendType=0 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&SpendType=0"><span>剩余金额结算记录</span></a></li>
<li <%If SpendType=1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&SpendType=1"><span>提成推荐用户结算记录</span></a></li>
<li <%If SpendType=2 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&SpendType=2"><span>销售商品结算记录</span></a></li>
</ul>
</div>

<div class="explain">
<%
If SpendType=0 Then
 Response.write "剩余金额包括投放广告收入，推荐用户提成和销售商品提成<br>"
ElseIf SpendType=1 Then
 Response.write "提成推荐用户的收入系统自动结算并打入用户的剩余金额里<br>"
ElseIf SpendType=2 Then
 Response.write "销售商品的收入系统自动结算并打入你用户剩余金额里<br>"
End If

If RsSet("UserSpendType")=0 Then'手工结算时
  Response.write "当前为用户手工申请结算方式，如需为用户自动申请结算，请在系统参数设置里设置"
Else
 Response.write "<a href=""javascript:;"" class=""btn btn-primary"" onclick=""$(function () { confirm('确定要为所有用户提交结算申请吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=userautospendsave')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});""><span>为所有用户提交结算申请</span></a>当前为自动结算方式，周期"&RsSet("UserSpendType")&"天"
End If

Response.write "，当前设置的每次最低结算标准" & GetTurnCent(RsSet("LowSpendCent")) & "元"
%>
</div>




<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>";
 searchurl += '&UserName=' + $('#UserName').val();
 searchurl += '&SpendState=' + $('#SpendState').val();
 searchurl += '&SpendType=' + $('#SpendType').val();
 searchurl += '&StartDate=' + $('#StartDate').val();
 searchurl += '&EndDate=' + $('#EndDate').val();

 location.href=searchurl;
});

});
</script>


<table class="tb_2">
<%
SqlW="DateDiff(d,'"&StartDate&"',SpendTime) >=0 and DateDiff(d,SpendTime,'"&EndDate&"')>=0"
If UserName<>"" Then SqlW=SqlW&" And UserName='"&UserName&"'"
If SpendState<>"" Then SqlW=SqlW&" And SpendState="&SpendState
If SpendType>=0 Then SqlW=SqlW&" And SpendType="&SpendType


Sql="Select sum(Spend_Cent) From CFWztg_Spend Where " & SqlW
Set Rs=Conn.Execute(Sql)
Spend_Cent_Total=Rs(0)
Rs.Close

Sql="Select * From CFWztg_Spend Where "&SqlW&" Order By ID Desc"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
%>

<tr>
<td class="td_r">网站主：</td>
<td><input name="UserName" type="text" id="UserName" value="<%=UserName%>" style="width:60px;"></td>
<td>状态：</td>
<td><select name="SpendState" id="SpendState">
<option value=""<%If CStr(SpendState)="" Then Response.write " selected"%>>全部</option>
<option value="1"<%If CStr(SpendState)="1" Then Response.write " selected"%>>结算审核中</option>
<option value="2"<%If CStr(SpendState)="2" Then Response.write " selected"%>>结算成功</option>
<option value="3"<%If CStr(SpendState)="3" Then Response.write " selected"%>>结算失败</option>
</select></td>
<td>类型：</td>
<td><select name="SpendType" id="SpendType">
<option value="-1"<%If SpendType=-1 Then Response.write " selected"%>>全部</option>
<option value="0"<%If SpendType=0 Then Response.write " selected"%>>剩余金额结算</option>
<option value="1"<%If SpendType=1 Then Response.write " selected"%>>提成推荐用户结算</option>
<option value="2"<%If SpendType=2 Then Response.write " selected"%>>销售商品销售结算</option>
</select></td>

<td>
从
<input name="StartDate" type="text" id="StartDate" value="<%=StartDate%>" size="8" onclick="fPopCalendar(event,this,this)" onfocus="this.select()"  />
到
<input name="EndDate" type="text" id="EndDate" value="<%=EndDate%>" size="8" onclick="fPopCalendar(event,this,this)" onfocus="this.select()" />
</td>

<td><input type="submit" name="submit" value="查询" class="btn btn-sm btn-primary" id="search"></td>


<td>
<%
v1=weekday(date)

Response.write "&nbsp;&nbsp;<a href='?Action="&action&"&SpendType="&SpendType&"&StartDate="&date()-1&"&EndDate="&date()-1&"'>昨天</a>"

Response.write "&nbsp;&nbsp;<a href='?Action="&action&"&SpendType="&SpendType&"&StartDate="&date()&"&EndDate="&date()&"'>今天</a>"

Response.write "&nbsp;&nbsp;<a href='?Action="&action&"&SpendType="&SpendType&"&StartDate="&dateadd("d",1-v1-7,date)&"&EndDate="&dateadd("d",1-v1-1,date)&"'>上周</a>"

Response.write "&nbsp;&nbsp;<a href='?Action="&action&"&SpendType="&SpendType&"&StartDate="&dateadd("m",-1,year(date)&"-"&month(date)&"-1")&"&EndDate="&dateadd("d",-1,year(date)&"-"&month(date)&"-1")&"'>上月</a>"

Response.write "&nbsp;&nbsp;<a href='?Action="&action&"&SpendType="&SpendType&"&StartDate="&dateadd("d",1-v1,date)&"&EndDate="&date&"'>本周</a>"

Response.write "&nbsp;&nbsp;<a href='?Action="&action&"&SpendType="&SpendType&"&StartDate="&year(date)&"-"&month(date)&"-1&EndDate="&date&"'>本月</a>"
%>
</td>

<td>
(总计金额：￥<%=FormatNumber(Spend_Cent_Total,2,-1,0,0)%>元)
</td>
</tr>

</table>


<form name="form_spendlist" id="form_spendlist" method="post" action="../../AdminUser.aspx?Action=userspendseldel">
<table class="tb_1">
<tr class="tr_1">
<td><input name="chkall" type="checkbox" id="chkall" onclick="selectcheckbox(this.form)" value="check"></td>
<td>结算ID</td>
<td>用户</td>
<td>结算金额</td>    
<td>申请时间</td>
<td>结算状态</td>
<td>结算类型</td>
<td>审核状态</td>
<td>管理员说明</td>
<td>操作</td>
</tr>
<%


If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.pagesize=20
 TotalRs=Rs.RecordCount
 TotalPage=Rs.PageCount
 MyPageSize=Rs.PageSize
 FixedSize=Rs.PageSize
 Rs.AbsolutePage=Page
End If

While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2">
<td> 
<%
If Rs("AdminCheck")=1 And (Rs("SpendState")=2 Or Rs("SpendState")=3) Then
 Response.write "<input name='ID_Sel' type='checkbox' id='ID_Sel' value='"&rs("ID")&"'>"
End If
%>
</td>
<td><%=rs("ID")%></td>
<td><%=rs("UserName")%></td>
<td><%=GetTurnCent(rs("Spend_Cent"))%>元</td>
<td><%=rs("SpendTime")%></td>
<td> 
<%
If Rs("SpendState")=1 Then
Response.Write "结算审核中"
ElseIf Rs("SpendState")=2 Then
Response.Write "结算成功"
ElseIf Rs("SpendState")=3 Then
Response.Write "结算失败,"&Rs("SpendAbortFeedBack")
End If%>
</td>
<td> 
<%
If Rs("SpendType")=0 Then
 Response.Write "手工结算"
ElseIf Rs("SpendType")=1 Then
 Response.Write "推广提成"
ElseIf Rs("SpendType")=2 Then
 Response.Write "商品销售提成"
End If%>
</td>
<td>
<%If Rs("AdminCheck")=1 Then
Response.Write "已审核"
Else
Response.Write "未审核"
End If%>
</td>

<td> 
<%=Rs("AdminDesc")%>
</td>

<td>
<%If Rs("AdminCheck")=0 Then%>
<a href="?Action=userspendmodify&ID=<%=Rs("ID")%>" class="btn_add"><i class="mdi mdi-pencil"></i>审核</a> 
<%End If%>
<%If Rs("AdminCheck")=1 Then%>
<a href="?Action=userspendmodify&ID=<%=Rs("ID")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>修改</a> 
<%End If%>
<%If Rs("AdminCheck")=1 And (Rs("SpendState")=2 Or Rs("SpendState")=3) Then%>
<a href="javascript:;" onclick="$(function () { confirm('你确定要删除吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=userspenddel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> 删除</a>

<%End If%>
</td>
</tr>
<%
MyPageSize=MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>
</table>
</form>

<a href="javascript:;" onclick="$(function () { confirm('你确定要删除选择的记录吗?', '', function (isConfirm) {if (isConfirm) {$('#form_spendlist').submit();}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-window-close"></i>删除选择</a>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>


