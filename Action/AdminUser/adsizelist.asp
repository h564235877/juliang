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
Sql="Select * From CFwztg_AdSize Order By Direction,Width Desc,Height Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
%>
<table class="tb_2">
<td>
<span class="title">广告尺寸列表</span>
<a href="?Action=adsizeadd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>新增广告尺寸</span></a>
</td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td>序号</td>
<td>方向</td>
<td>宽x高</td>
<td>操作</td>
</tr>
  <%
I=0
While Not Rs.Eof
I=I+1
%>
<tr class="tr_2"> 
<td><%=I%></td>
<td>
<%
If Rs("Direction")=1 Then
 Response.write "横向"
ElseIf Rs("Direction")=2 Then
 Response.write "纵向"
ElseIf Rs("Direction")=3 Then
 Response.write "方形"
End If
%>
</td>
<td><%=Rs("Width")%>x<%=Rs("Height")%></td>
<td>
<a href="?Action=adsizemodify&ID=<%=rs("ID")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>修改</a>
<a href="javascript:;" onclick="$(function () { confirm('你确定要删除吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=adsizedel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>删除</a>
</td>
</tr>
<%
Rs.MoveNext
Wend
%>
</table>
     