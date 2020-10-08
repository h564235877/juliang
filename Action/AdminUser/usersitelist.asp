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
SiteUrl=ChkStr(Request("SiteUrl"),1)
SiteState=ChkStr(Request("SiteState"),2)

PageUrl = "?Action="&Action&"&UserName="&UserName&"&SiteUrl="&SiteUrl&"&SiteState="&SiteState

Sql="Select a.ID,a.UserName,a.SiteUrl,a.SiteState,a.AlexaRank,a.AddDate,b.SiteClassName From CFWztg_UserSite a Left Join CFWztg_SiteClass b on a.SiteClassID=b.ID Where 1=1"


If UserName<>"" Then Sql=Sql&" And a.UserName='"&UserName&"'"
If SiteUrl<>"" Then Sql=Sql&" And a.SiteUrl Like '%"&SiteUrl&"%'"
If SiteState<>"" Then Sql=Sql&" And a.SiteState="&SiteState

Sql=Sql&" Order By a.ID Desc"

Set Rs = Server.CreateObject("Adodb.RecordSet")
Rs.Open Sql,Conn,1,1

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
          
<table class="tb_1">
<tr class="tr_1"> 
<td>用户</td>
<td>网址</td>
<td>类型</td>
<td>审核状态</td>
<td>Alexa排名</td>
<td>时 间</td>
<td>操作</td>
</tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td><%=Rs("UserName")%></td>
<td>
<%
If Left(Lcase(Rs("SiteUrl")),7)="http://" Then
 Response.write "<a href='"&Rs("SiteUrl")&"' target='_blank'>"&Rs("SiteUrl")&"</a>"
Else
 Response.write "<a href='http://"&Rs("SiteUrl")&"' target='_blank'>"&Rs("SiteUrl")&"</a>"
End If
%>
</td>
<td><%=Rs("SiteClassName")%></td>
<td>
<%
If Rs("SiteState")=1 Then
Response.Write "审核中"
ElseIf Rs("SiteState")=2 Then
Response.Write "审核成功"
ElseIf Rs("SiteState")=3 Then
Response.Write "审核失败"
End if
%>
</td>
<td><%=Rs("AlexaRank")%></td>
<td><%=Rs("AddDate")%></td>
<td>
<a href="?Action=usersitemodify&ID=<%=Rs("ID")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>修改</a>

<a href="javascript:;" onclick="$(function () { confirm('你确定要删除吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=usersitedel&ID=<%=Rs("ID")%>&UserName=<%=Rs("UserName")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>删除</a>
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

<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>";
 searchurl += '&UserName=' + $('#UserName').val();
 searchurl += '&SiteUrl=' + $('#SiteUrl').val();
 searchurl += '&SiteState=' + $('#SiteState').val();

 location.href=searchurl;
});

});
</script>

<table class="tb_3">
<tr> 
<td>网站主：</td>
<td><input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="10"></td>
<td>网址：</td>
<td><input name="SiteUrl" type="text" id="SiteUrl" value="<%=SiteUrl%>" size="10"></td>
<td>审核状态：</td>
<td>
<select id='SiteState' name='SiteState'>
<option value=""<%If SiteState="" Then Response.Write " selected"%>>全部</option>
<option value="1"<%If SiteState="1" Then Response.Write " selected"%>>等待审核</option>
<option value="2"<%If SiteState="2" Then Response.Write " selected"%>>审核成功</option>
<option value="3"<%If SiteState="3" Then Response.Write " selected"%>>审核失败</option>
</select>
</td>
<td><input type="submit" name="submit" value="查询" class="btn btn-sm btn-primary" id="search"></td>
</tr>
</table>
