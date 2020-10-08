<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<table class="tb_1">
<%
UserName=ChkStr(Request("UserName"),1)

PageUrl = "?Action="&Action&"&UserName="&UserName

Sql="Select ID,UserName,QQ,Phone,EMail,AddTime From CFWztg_User where UpUserName='"&SeUserName&"' And UserType=1"

If UserName<>"" Then Sql=Sql&" And UserName='"&UserName&"'"

Sql=Sql&" Order By AddTime Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.PageSize = 20
 TotalRs = Rs.RecordCount
 TotalPage = Rs.PageCount
 MyPageSize = Rs.PageSize
 Rs.AbsolutePage = Page
End If
%>
<tr class="tr_1"> 
    <td>网站主ID</td>
    <td>网站主名称</td>
    <td>QQ</td>
    <td>手机</td>
    <td>Email</td>
	<td>注册时间</td>
  </tr>

<%
While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2"> 
    <td><%=Rs("ID")%></td>
    <td><%=Rs("UserName")%></td>
    <td><%=Rs("QQ")%></td>
    <td><%=Rs("Phone")%></td>
    <td><%=Rs("EMail")%></td>
	<td><%=Rs("AddTime")%></td>
  </tr>
  <%
MyPageSize = MyPageSize-1
Rs.MoveNext
Wend
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
 location.href=searchurl;
});

});

</script> 

<table class="tb_3">
<tr class="tr_1"> 
<td colspan="2">查询</td>
<tr>
<td class="td_r">网站主：</td>
<td><input name="UserName" type="text" id="UserName" value="<%=UserName%>"></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" name="submit" value="查询" class="btn btn-sm btn-primary" id="search"></td>
</tr>
</table>

