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
Px=ChkStr(Request("Px"),1):If Px="" Then  Px="ID"
AdUserName=ChkStr(Request("AdUserName"),1)
UserState=ChkStr(Request("UserState"),2)

PageUrl = "?Action="&Action&"&AdUserName="&AdUserName&"&UserState="&UserState

Call PxFilter(Px,"ID,UserName,Total_Cent,Spend_Cent,Spare_Cent,UserState,QQ")

Sql="Select Top 2000 * From CFWztg_User where UserType=2"

IF AdUserName<>"" Then Sql=Sql&" And UserName Like '%"&AdUserName&"%'"
IF UserState<>"" Then Sql=Sql&" And UserState="&UserState


Sql=Sql&" Order By "&Px&" Desc"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.pagesize=20
 TotalRs=Rs.RecordCount
 TotalPage=Rs.PageCount
 MyPageSize=Rs.PageSize
 FixedSize=Rs.PageSize
 Rs.AbsolutePage=Page
End If
%>


<a href="?Action=aduseradd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>广告主新增</span></a>

<form name="form4" method="post" action="?Action=delseluser">
<table class="tb_1">
<tr class="tr_1"> 
<td><a href="<%=PageUrl%>&Px=ID">广告主ID</a></td>
<td><a href="<%=PageUrl%>&Px=AdUserName">广告主用户名</a></td>
<td><a href="<%=PageUrl%>&Px=Total_Cent">总金额</a></td>
<td><a href="<%=PageUrl%>&Px=Spend_Cent">已花费</a></td>
<td><a href="<%=PageUrl%>&Px=Spare_Cent">剩余金额</a></td>
<td><a href="<%=PageUrl%>&Px=UserState">账号状态</a></td>
<td><a href="<%=PageUrl%>&Px=QQ">QQ号码</a></td>
<td>操作</td>
</tr>
  
<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td><%=Rs("ID")%></td>
<td><%=Rs("UserName")%></td>
<td><%=GetTurnCent(Rs("Total_Cent"))%>元</td>
<td><%=GetTurnCent(Rs("Spend_Cent"))%>元</td>
<td><%=GetTurnCent(Rs("Spare_Cent"))%>元</td>
<td><%
If Rs("UserState")=0 Then
 Response.Write "<font color=#ff0000>无效</font>"
ElseIf Rs("UserState")=1 Then
 Response.Write "有效"
ElseIf Rs("UserState")=2 Then
 Response.Write "邮件审核中"
ElseIf Rs("UserState")=3 Then
 Response.Write "管理员审核中"
End If
%></td>
<td><a href="http://wpa.qq.com/msgrd?v=3&uin=<%=Rs("QQ")%>&site=qq&menu=yes" target="_blank"><%=Rs("QQ")%></a></td>

<td>
<a href="?Action=adusermodify&AdUserName=<%=rs("UserName")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>修改</a>
<a href="javascript:;" onclick="$(function () { confirm('删除前请确定此用户没有剩余金额，确定要删除吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=aduserdel&AdUserName=<%=rs("UserName")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>删除</a>
<a href="?Action=adusergo&AdUserName=<%=rs("UserName")%>" target="_blank" class="btn_add"><i class="mdi mdi-eye"></i>查看</a>
</td>

</tr>
<%
Rs.MoveNext
MyPageSize=MyPageSize-1
Wend
Rs.Close
%>

</table>
</form>
       

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>       
  

<script>
$(function(){

$("#search").click(function(){

 var searchurl ="?Action=<%=Action%>";
 searchurl += '&AdUserName=' + $('#AdUserName').val();
 searchurl += '&UserState=' + $('#UserState').val();

 location.href=searchurl;
});

});

</script> 

<table class="tb_3">
<tr> 
<td>广告主用户名</td>
<td><input name="AdUserName" type="text" id="AdUserName" value="<%=AdUserName%>"size="10"></td>
<td>帐号状态</td>
<td><select name="UserState" id="UserState">
<option value=""<%If CStr(UserState)="" Then Response.write " selected"%>>全部</option>
<option value="0"<%If CStr(UserState)="0" Then Response.write " selected"%>>无效</option>
<option value="1"<%If CStr(UserState)="1" Then Response.write " selected"%>>有效</option>
<option value="2"<%If CStr(UserState)="2" Then Response.write " selected"%>>邮件审核中</option>
<option value="3"<%If CStr(UserState)="3" Then Response.write " selected"%>>管理员审核中</option>
</select></td>
<td><input type="submit" name="submit" value="查询" class="btn btn-sm btn-primary" id="search"></td>
</tr>
</table>