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
AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then AddDate=CStr(Date)
Ad_ID=ChkStr(Request("Ad_ID"),2)
%>

<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>";
 searchurl += '&AddDate=' + $('#AddDate').val();
 searchurl += '&Ad_ID=' + $('#Ad_ID').val();

 location.href=searchurl;
});

});
</script>

<table style="margin-bottom:10px;">
<tr>
<td>
<select id='AddDate' name='AddDate'>
<option value="">请选择日期</option>
<%
Sql="Select AddDate From CFWztg_Area_Day Where UserName='"&UserName&"' Group By AddDate Order By AddDate Desc"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("AddDate")&"'"
 If CDate(AddDate)=Rs("AddDate") Then Response.Write " selected"
 Response.Write ">"&Rs("AddDate")&"</option>"
Rs.MoveNext
Wend
%>
</select>

<select id='Ad_ID' name="Ad_ID">
<option value="">请选择广告</option>
<%
Sql="Select min(b.AdName) as AdName,a.Ad_ID From CFWztg_Area_Day a inner join cfwztg_ad b on a.ad_id=b.id Where a.UserName='"&UserName&"' Group By a.Ad_ID Order By a.Ad_ID Desc"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("Ad_ID")&"'"
 If Request("Ad_ID")=Cstr(Rs("Ad_ID")) Then Response.Write " selected"
 Response.Write ">"&Rs("AdName")&"["&Rs("Ad_ID")&"]</option>"
Rs.MoveNext
Wend
%>
</select>
<input type="submit" name="search"  id="search" value="查询" class="btn btn-sm btn-primary"></td>

</tr>
</table>

<%
PageUrl = "?Action="&Action&"&AddDate="&AddDate&"&Ad_ID="&Ad_ID

Sql="Select Sum(IpCounter) From CFWztg_Area_Day where UserName='"&UserName&"' And  Datediff(d,AddDate,'"&AddDate&"')=0"
If AD_ID<>"" Then Sql=Sql & " And Ad_ID="&Ad_ID

Set Rs=Conn.Execute(Sql)
IpTotal=Rs(0)

If AD_ID="" Then 
 Sql="Select  min(IpArea) IpArea,sum(IPcounter) IPcounter From CFWztg_Area_Day where UserName='"&UserName&"'  And Datediff(d,AddDate,'"&AddDate&"')=0 Group By IpArea Order By IpCounter Desc"
Else
 Sql="Select * From CFWztg_Area_Day where UserName='"&UserName&"'  And Ad_ID="&Ad_ID&" And Datediff(d,AddDate,'"&AddDate&"')=0 Order By IpCounter Desc"
End If


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


<table class="tb_1">
  <tr class="tr_1"> 
    <td>序号</td>
    <td>地区</td>
    <td colspan="2">数量</td>
  </tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
  <tr> 
    <td style="font-weight:bold;"><%=Rs.RecordCount-Rs.Pagesize*(Page)+MyPageSize%></td>
    <td>  <%=Rs("IpArea")%> </td>
    <td> 
        <%=Rs("IpCounter")%>
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
