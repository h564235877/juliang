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
Sql="Select a.ID,a.SiteUrl,a.SiteState,a.AlexaRank,a.AddDate,b.SiteClassName From CFWztg_UserSite a Left Join CFWztg_SiteClass b on a.SiteClassID=b.ID  Where a.UserName='"&UserName&"' Order By a.ID Desc"
Set Rs = Server.CreateObject("Adodb.RecordSet")
Rs.Open Sql,Conn,1,1
%>

<a href="?Action=usersiteadd" class="actionBtn add" style="margin-top:10px;"><i class="mdi mdi-plus"></i><span>增加要审核的网站</span></a>
<%If RsSet("SiteAutoPass")=1 Then%>
<table class="tb_2">
<tr>
<td>
<div class="explain">
注：新加入的站点系统自动即时通过审核成功
</div>
</td>
</tr>
</table>
<%End If%>


<table class="tb_1">
  <tr class="tr_1"> 
    <td>网址</td>
    <td>类型</td>
    <td>审核状态</td>
	<td>Alexa排名</td>
    <td>时 间</td>
    <td>操作</td>
  </tr>
  <%
While Not Rs.Eof
I=I+1
%>
  <tr class="tr_2"> 
    <td><%=Rs("SiteUrl")%></td>
    <td><%=Rs("SiteClassName")%></td>
    <td>
        <%
	If Rs("SiteState")=1 Then
	 Response.Write "审核中"
	ElseIf Rs("SiteState")=2 Then
	 Response.Write "审核成功"
	ElseIf Rs("SiteState")=3 Then
	 Response.Write "审核失败"
	End if%>
    </td>
	<td><%=Rs("AlexaRank")%> </td>
    <td><%=Rs("AddDate")%></td>
    <td>
<a href="javascript:;" onclick="$(function () { confirm('你确定要删除吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../User.aspx?Action=usersitedel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> 删除</a>

	</td>
  </tr>
<%
Rs.MoveNext
Wend
%>
</table>