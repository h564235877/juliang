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
Sql="Select * From CFWztg_SysInfoClass Order By ID"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
%>

<a href="?Action=infoclassadd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>新增帮助分类</span></a>

<table class="tb_1">
<tr class="tr_1"> 
<td>分类ID</td>
<td>分类名</td>
<td>操作</td>
</tr>
<%
I=0
While Not Rs.Eof
I=I+1
%>
<tr class="tr_2"> 
<td><%=Rs("ID")%></td>
<td><%=Rs("InfoClassName")%></td>
<td>
<%
'--只有分类ID大于4的分类才显示操作项
If Rs("ID")>4 Then%>
<a href="?Action=infoclassmodify&ID=<%=rs("ID")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>修改</a>

<a href="javascript:;" onclick="$(function () { confirm('你确定要删除吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=infoclassdel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>删除</a>
<%
Else
Response.write "默认分类不能修改或删除"
End If
%>
</td>
</tr>
<%
Rs.MoveNext
Wend
%>
</table>
