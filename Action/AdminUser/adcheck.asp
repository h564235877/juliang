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
CheckState=CInt(ChkStr(Request("CheckState"),2))

PageUrl = "?Action="&Action&"&CheckState="&CheckState

Sql="Select a.* From CFWztg_AD_Check a inner join CFWztg_AD b on a.ad_id=b.id Where 1=1"
If CheckState<>0 Then Sql=Sql&" And a.CheckState="&CheckState
Sql=Sql&" Order By a.CheckState,a.LastTime Desc"

Set Rs = Server.CreateObject("Adodb.RecordSet")
Rs.Open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.pagesize=20
 TotalRs=Rs.RecordCount
 TotalPage=Rs.PageCount
 MyPageSize=Rs.PageSize
 FixedSize=rs.pagesize
 Rs.AbsolutePage=Page
End If
%>


<table class="tb_2">
<tr> 
<td>
<select id='checkstate' onChange="window.location=document.getElementById('checkstate').options[document.getElementById('checkstate').selectedIndex].value">
<option value="?Action=adcheck&CheckState=0"<%If CheckState=0 Then Response.Write " selected"%>>全部审核状态</option>
<option value="?Action=adcheck&CheckState=1"<%If CheckState=1 Then Response.Write " selected"%>>等待审核</option>
<option value="?Action=adcheck&CheckState=2"<%If CheckState=2 Then Response.Write " selected"%>>审核成功</option>
<option value="?Action=adcheck&CheckState=3"<%If CheckState=3 Then Response.Write " selected"%>>审核失败</option>
</select>
</td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td>广告ID</td>
<td>审核状态</td>
<td>提交时间</td>
<td>操作</td>
</tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td><%=Rs("AD_ID")%></td>
<td>
<%
If Rs("CheckState")=1 Then
 Response.write "审核中"
ElseIf Rs("CheckState")=2 Then
 Response.write "审核成功"
ElseIf Rs("CheckState")=3 Then
 Response.write "审核失败"
End If
%>
</td>
<td><%=Rs("LastTime")%></td>
<td>
<a href='?Action=adcheckmodify&Ad_ID=<%=Rs("Ad_ID")%>' class="btn_edit"><i class="mdi mdi-pencil"></i> 审核</a>
<a href="javascript:;" onclick="$(function () { confirm('你确定要删除吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=adcheckdel&Ad_ID=<%=Rs("Ad_ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> 删除</a>
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
</td>
</tr>
</table>