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
AdUserName=ChkStr(Request("AdUserName"),1)
UserName=ChkStr(Trim(Request("UserName")),1)
LowUserName=ChkStr(Trim(Request("LowUserName")),1)
LowUnionUserName=ChkStr(Trim(Request("LowUnionUserName")),1)
AddDate=ChkStr(Trim(Request("AddDate")),3)

Px=ChkStr(Request("Px"),1):If Px="" Then Px="addtime"

PageUrl = "?Action="&Action&"&AdUserName="&AdUserName&"&UserName="&UserName&"&LowUserName="&LowUserName&"&LowUnionUserName="&LowUnionUserName&"&AddDate="&AddDate

Call PxFilter(Px,"ID,AdUserName,UserName,LowUserName,Spare_Cent,LowUnionUserName,AddTime")

If Lcase(Px)="id" Then
 Px_2="a.id"
 
ElseIf Lcase(Px)="adusername" Then
 Px_2="a.adusername"
 
ElseIf Lcase(Px)="username" Then
 Px_2="a.username"
 
ElseIf Lcase(Px)="lowusername" Then
 Px_2="a.lowusername"
 
ElseIf Lcase(Px)="spare_cent" Then
 Px_2="b.spare_cent"
 
ElseIf Lcase(Px)="lowunionusername" Then
 Px_2="a.lowunionusername"
 
ElseIf Lcase(Px)="addtime" Then
 Px_2="a.addtime"
 
Else
 Px_2="b.spare_cent"
 
End If

MaxListRs = 2000

Sql="Select Top "&MaxListRs&" a.id,a.adusername,a.username,a.lowusername,IsNull(b.spare_cent,0) spare_cent,a.lowunionusername,a.addtime From CFWztg_LowUser a Left join CFWztg_User b on a.LowUserName=b.UserName where 1=1"
If AdUserName<>"" Then Sql=Sql&" And a.AdUserName='"&AdUserName&"'"
If UserName<>"" Then Sql=Sql&" And a.UserName='"&UserName&"'"
If LowUserName<>"" Then Sql=Sql&" And a.LowUserName='"&LowUserName&"'"
If LowUnionUserName<>"" Then Sql=Sql&" And a.LowUnionUserName='"&LowUnionUserName&"'"
If AddDate<>"" Then Sql=Sql&" And DateDiff(d,a.AddDate,'"&AddDate&"')=0"
Sql=Sql&" Order By "&Px_2&" Desc"


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
%>

<form name="form_lowlist" id="form_lowlist" method="post" action="../../AdminUser.aspx?Action=lowseldel">
<table class="tb_1">  

<tr class="tr_1"> 
  <td><input name="chkall" type="checkbox" id="chkall" onclick="selectcheckbox(this.form)" value="check"></td>
    <td><a href="<%=PageUrl%>&Px=AdUserName">广告主</a></td>
	<td><a href="<%=PageUrl%>&Px=UserName">网站主</a></td>
	<td><a href="<%=PageUrl%>&Px=LowUserName">推荐的用户名</a></td>
    <td><a href="<%=PageUrl%>&Px=Spare_Cent">剩余金额</a></td>
	<td><a href="<%=PageUrl%>&Px=LowUnionUserName">下级联盟用户名</a></td>
    <td><a href="<%=PageUrl%>&Px=AddTime">时 间</a></td>
    <td>操作</td>
</tr>

<%
While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2"> 
      <td> 
<%
Response.write "<input name='ID_Sel' type='checkbox' id='ID_Sel' value='"&rs("ID")&"'>"
%>
        </td>
    <td><%=Rs("AdUserName")%></td>
	<td><%=Rs("UserName")%></td>
    <td><%=server.HTMLEncode(Rs("LowUserName"))%></td>
    <td><%=FormatNumber(Rs("Spare_Cent"),2,-1,0,0)%>元</td>
    <td><%=Rs("LowUnionUserName")%></td>
	<td><%=Rs("AddTime")%></td>
    <td><%
Response.write "<a href=""javascript:;"" onclick=""$(function () { confirm('每个推荐会员名都是有用的,如果你确定这个推荐会员名是测试用的数据可以删除，确定要删除这个推荐吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=lowdel&ID="& Rs("ID") &"')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});"" class=""btn_del""><i class=""mdi mdi-window-close""></i> 删除</a>"
%></td>
  </tr>
  <%
MyPageSize = MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>
</table>
</form>

<a href="javascript:;" onclick="$(function () { confirm('你确定要删除选择的记录吗?', '', function (isConfirm) {if (isConfirm) {$('#form_lowlist').submit();}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-window-close"></i>删除选择</a>


<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>


<script>
$(function(){

$("#search").click(function(){

 var searchurl ="?Action=<%=Action%>";
 searchurl += '&AdUserName=' + $('#AdUserName').val();
 searchurl += '&UserName=' + $('#UserName').val();
 searchurl += '&LowUserName=' + $('#LowUserName').val();
 searchurl += '&AddDate=' + $('#AddDate').val();

 location.href=searchurl;
});

});
</script>


<table class="tb_3">
<tr class="tr_1"> 
<td colspan="2">查询</td>
<tr>
<td class="td_r">广告主：</td>
<td><select name="AdUserName" id='AdUserName'>
<option value="">全部广告主</option>
<%
Sql="Select AdUserName From CFWztg_LowUser Group By AdUserName Order By AdUserName"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("AdUserName")&"'"
 If AdUserName=Rs("AdUserName") Then Response.Write " selected"
 Response.Write ">"&Rs("AdUserName")&"</option>"
Rs.MoveNext
Wend
%>
</select></td>
</tr>
<tr>
<td class="td_r">用户名：</td>
<td><input name="UserName" type="text" id="UserName" value="<%=UserName%>"></td>
</tr>
<tr>
<td class="td_r">推荐的用户名：</td>
<td><input name="LowUserName" type="text" id="LowUserName" value="<%=LowUserName%>"></td>
</tr>
<tr>
<td class="td_r">下级联盟用户名：</td>
<td><input name="LowUnionUserName" type="text" id="LowUnionUserName" value="<%=LowUnionUserName%>"></td>
</tr>
<tr>
<td class="td_r">日期：</td>
<td><input name="AddDate" type="text" id="AddDate" value="<%=AddDate%>"></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" name="submit" value="查询" class="btn btn-sm btn-primary" id="search"></td>
</tr>
</table>

