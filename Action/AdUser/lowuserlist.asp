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
<tr class="tr_1"> 
<td>网站主</td>
<td>推荐的会员名</td>
<td>时间</td>
<td>操　作</td>
</tr>
<%
UserName=ChkStr(Request("UserName"),1)
LowUserName=ChkStr(Request("LowUserName"),1)
AddDate=ChkStr(Request("AddDate"),3)

PageUrl = "?Action="&Action&"&UserName="&UserName&"&LowUserName="&LowUserName&"&AddDate="&AddDate

MaxListRs = 2000

Sql="Select Top "&MaxListRs&" * From CFWztg_LowUser Where AdUserName='"&AdUserName&"'"
If UserName<>"" Then Sql=Sql&" And UserName='"&UserName&"'"
If LowUserName<>"" Then Sql=Sql&" And LowUserName='"&LowUserName&"'"
If AddDate<>"" Then Sql=Sql&" And AddDate='"&AddDate&"'"
Sql=Sql&"  Order By AddTime Desc"

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

While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td><%=Rs("UserName")%></td>
<td><%=server.HTMLEncode(Rs("LowUserName"))%></td>
<td><%=Rs("AddTime")%></td>
<td><a href="?Action=orderadd&OrderCode=<%=Rs("LowUserName")%>&OrderUser=<%=Rs("LowUserName")%>&OrderTcRate=100&TcObject=1" class="btn_add"><i class="fa fa-plus"></i> 给提成</a></td>
</tr>
<%
MyPageSize = MyPageSize-1
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
 searchurl += '&LowUserName=' + $('#LowUserName').val();
 searchurl += '&adddate=' + $('#adddate').val();

 location.href=searchurl;
});

});
</script>
 
<table class="tb_3">
<tr class="tr_1">
<td colspan="2">查询</td>
</tr>
<tr>
<td class="td_r">推广人：</td>
<td><input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="15"></td>
</tr>
<tr>
<td class="td_r">推荐会员名：</td>
<td><input name="LowUserName" type="text" id="LowUserName" value="<%=LowUserName%>" size="15"></td>
</tr>
<tr>
<td class="td_r">日期：</td>
<td><select name="adddate" id="adddate" size="1">
<option value="">所有日期</option>
<%
Sql="Select AddDate From CFWztg_LowUser Where AdUserName = '"& AdUserName &"' Group By AddDate Order By AddDate Desc"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("AddDate")&"'"
 If Request("AddDate")=Cstr(Rs("AddDate")) Then Response.Write " selected"
 Response.Write ">"&Rs("AddDate")&"</option>"
Rs.MoveNext
Wend
%>
</select></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" name="submit" value="查询" class="btn btn-sm btn-primary" id="search"></td>
</tr>
</table>
