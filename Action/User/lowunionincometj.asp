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
LowUnionUserName=ChkStr(Request("LowUnionUserName"),1)
AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then AddDate=CStr(Date)


Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_User where UserName='"&UserName&"'"
Rs.open Sql,Conn,1,1
AgentPower=Rs("AgentPower")

If AgentPower=2 Then
Response.write Rs("LowUnionUserName")
Else
Response.write "此项只有代理商可查看"
Response.end
End If
%>


<script>
$(function(){

$("#search").click(function(){
 var searchurl = "?Action=<%=Action%>";
 searchurl += '&AddDate=' + $('#AddDate').val();
 searchurl += '&LowUnionUserName=' + $('#LowUnionUserName').val(); 

 location.href=searchurl;
});

});
</script>
<table style="margin-bottom:10px;">
<tr>
<td>
<select id='AddDate' name='AddDate'>
<option value="">请选择查询日期</option>
<%Sql="Select AddDate From CFWztg_LowUnion_Income Where UserName='"&UserName&"' Group By AddDate Order By AddDate Desc"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
DateSelStr=DateSelStr&"<option value='"&Rs("AddDate")&"'"
If CDate(AddDate)=Rs("AddDate") Then DateSelStr=DateSelStr&" selected":DateSel=1
DateSelStr=DateSelStr&">"&Rs("AddDate")&"</option>"
Rs.MoveNext
Wend
Rs.Close
If DateSel<>1 Then Response.write "<option value='"&Date&"' selected>"&Date&"</option>"&DateSelStr Else Response.write DateSelStr  
%>
</select>
</td>
      <td>用户名：</td>
      <td><input name="LowUnionUserName" type="text" id="LowUnionUserName" value="<%=LowUnionUserName%>" size="10"></td>
      
<td><input type="submit" name="search"  id="search" value="查询" class="btn btn-sm btn-primary"></td>
    </tr>
</table>

  
<%
PageUrl = "?Action="&Action&"&LowUnionUserName="&LowUnionUserName&"&AddDate="&AddDate

Sql="Select Sum(Total_Cent) From CFWztg_LowUnion_Income Where UserName='"&UserName&"' And AddDate='"&AddDate&"'"
Set Rs = Conn.Execute(Sql)
Total_Cent = Rs(0)

Sql="Select * From CFWztg_LowUnion_Income Where UserName='"&UserName&"' And AddDate='"&AddDate&"'"
If LowUnionUserName<>"" Then Sql=Sql&" And LowUnionUserName='"&LowUnionUserName&"'"
Sql=Sql&" Order By Total_Cent Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.pagesize=50
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
<span class="title">下级联盟用户收入排行统计 日期:<%=AddDate%> 下级联盟用户:<%=LowUnionUserName%></span></td>
  </tr>
</table>

<table class="tb_1">
  <tr class="tr_1"> 
    <td>下级联盟用户</td>

    <td>收入</td>
  </tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2"> 
    <td><%=Rs("LowUnionUserName")%></td>
    <td><%=GetTurnCent(Rs("Total_Cent"))%>元</td>
  </tr>
  <%
Mypagesize=Mypagesize-1
Rs.MoveNext
Wend
Rs.Close
%>
  <tr> 
    <td colspan="9">统计：下级联盟用户总收入<%=GetTurnCent(Total_Cent)%>元</td>
  </tr>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>

