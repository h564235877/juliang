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

Sql="Select * From CFWztg_UserDeduct where 1=1"
IF UserName<>"" Then Sql=Sql&" And UserName Like '%"&UserName&"%'"
Sql=Sql&" Order By ID Desc"

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

<table class="tb_2">
<tr>
<td>
<div class="explain">
1.扣款操作请在普通用户列表选择用户里操作,这里只列出管理员扣用户款项的记录！<br>
2.所扣的款项并不退回给广告主，收入归管理员所得!总体：广告主广告发布款项=用户的结算款项+管理员手工扣除用户的款项+设置的扣点率扣的款项
</div>
</td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td>网站主</td>
<td>扣除款项</td>
<td>扣款时间</td>
<td>操作</td>
</tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td><%=rs("UserName")%></td>
<td><%=GetTurnCent(Rs("Deduct_Cent"))&"元"%></td>
<td><%=rs("AddTime")%></td>
<td>
<a href="javascript:;" onclick="$(function () { confirm('你确定要删除吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=userdeductdel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> 删除</a>
</td>
</tr>
<%
MyPageSize=MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>

<form name="form2" method="post" action="?Action=<%=Action%>">
<table class="tb_3">
<tr>
<td>网站主：</td>
<td><input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="10"></td>
<td><input type="submit" name="submit" value="查询" class="btn btn-sm btn-primary"></td>
</TR>
</table>
</form>