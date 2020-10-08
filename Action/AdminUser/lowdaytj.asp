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
AdUserName = ChkStr(Request("AdUserName"),1)
UserName = ChkStr(Trim(Request("UserName")),1)

PageUrl = "?Action="&Action&"&AdUserName="&AdUserName&"&UserName="&UserName
%>

<table class="tb_1">
  <tr class="tr_h">   
    <td colspan="6">	
	广告主:<%=AdUserName%> 用户:<%=UserName%> CPA用户每日统计报表</td>
  </tr>
  <tr class="tr_1"> 
    <td>日　期</td>
    <td>CPA用户总数</td>
    <td></td>
  </tr>
<%

Sql="select AddDate,count(1) as LowNum from CFWztg_LowUser Where 1=1"

If AdUserName<>"" Then Sql=Sql&" And AdUserName='"&AdUserName&"'"
If UserName<>"" Then Sql=Sql&" And AdUserName='"&UserName&"'"

Sql=Sql&" group by AddDate Order By AddDate Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not rs.eof then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 rs.pagesize=20
 totalrs=rs.RecordCount
 totalpage=rs.pageCount
 mypagesize=rs.pagesize
 FixedSize=Rs.PageSize
 rs.absolutepage=page
End If
%>

<%
While Not Rs.Eof And MyPageSize>0
%>
  <tr> 
    <td><%=Rs("AddDate")%></td>
    <td><%=Rs("LowNum")%></td>
    <td><a href="?Action=lowlist&AddDate=<%=Rs("AddDate")%>">[查看详细]</a></td>
  </tr>
<%
Rs2.Close
Mypagesize=Mypagesize-1
Rs.MoveNext
Wend
Rs.Close
%>


</table>


<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>


<form name="form_low" method="post" action="?Action=<%=Action%>">
<table class="tb_3"><tr class="tr_1"> 
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
      <td class="td_r">网站主：</td>
      <td><input name="UserName" type="text" id="UserName" value="<%=UserName%>"></td>
    </tr>
		<tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="submit" value="查询" class="btn btn-sm btn-primary"></td>
	</tr>
</table></form>