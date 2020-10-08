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
Px=ChkStr(Request("Px"),1):If Px="" Then  Px="Click_Counter"
Ad_ID=ChkStr(Request("Ad_ID"),2)
OtherClass=ChkStr(Request("OtherClass"),1)
AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then AddDate=CStr(Date)

%>

<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>&AddDate=<%=AddDate%>"
 searchurl += '&AddDate=' + $('#AddDate').val();
 searchurl += '&Ad_ID=' + $('#Ad_ID').val();
 searchurl += '&OtherClass=' + $('#OtherClass').val();

 location.href=searchurl;
});

});
</script>

<table style="margin-bottom:10px;">
<tr>
<td>
<select id='AddDate' name='AddDate'>
<option value="">请选择查询日期</option>
<%Sql="Select AddDate From CFWztg_Other_Day Group By AddDate Order By AddDate Desc"
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

<td class="td_r">广告ID：</td>
<td>
<select id='Ad_ID' name="Ad_ID">
<option value="">请选择广告</option>
<%
Sql="Select min(b.AdName) as AdName,a.Ad_ID From CFWztg_Other_Day a inner join cfwztg_ad b on a.ad_id=b.id Group By a.Ad_ID Order By a.Ad_ID Desc"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("Ad_ID")&"'"
 If Ad_ID=Cstr(Rs("Ad_ID")) Then Response.Write " selected"
 Response.Write ">"&Rs("AdName")&"["&Rs("Ad_ID")&"]</option>"
Rs.MoveNext
Wend
%></select>
</td>

<td class="td_r">分类：</td>
<td><Select  name="OtherClass" id="OtherClass">
<option value="">请选择分类</option>
<%
Sql="Select OtherClass From CFWztg_Other_Day Group By OtherClass Order By OtherClass Desc"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("OtherClass")&"'"
 If OtherClass=Cstr(Rs("OtherClass")) Then Response.Write " selected"
 Response.Write ">"&Rs("OtherClass")&"</option>"
 OtherClass_2=Rs("OtherClass")
Rs.MoveNext
Wend
%>
</select></td>
<td><input type="submit" name="search"  id="search" value="查询" class="btn btn-sm btn-primary"></td>
</tr>
</table>
 
 
<%
If Ad_ID="" Then Ad_ID=CStr(Ad_ID_2)

If OtherClass="" Then OtherClass=OtherClass_2

PageUrl = "?Action="&Action&"&Ad_ID="&Ad_ID&"&OtherClass="&OtherClass&"&AddDate="&AddDate

Call PxFilter(Px,"ID,OtherFlag,ClickPv_Counter,ClickUv_Counter,Click_Counter,AddTime,LastTime,Ly,Ly_2")

Sql="Select Top 2000 a.OtherFlag,a.ClickPv_Counter,a.ClickUv_Counter,a.Click_Counter,a.AddTime,a.LastTime,a.Ly,a.Ly_2 From CFWztg_Other_Day a inner join cfwztg_ad b on a.ad_id=b.id Where 1=1"
If UserName<>"" Then Sql=Sql&" And a.UserName='"&UserName&"'"
If Ad_ID<>"" Then Sql=Sql&" And a.Ad_ID="&Ad_ID
If OtherClass<>"" Then Sql=Sql&" And a.OtherClass='"&OtherClass&"'"
If AddDate<>"" Then Sql=Sql&" And a.AddDate='"&AddDate&"'"
 Sql=Sql & " Order By a."&Px&" Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1


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
    <td><a href="<%=PageUrl%>&Px=ID">序号</a></td>
    <td><a href="<%=PageUrl%>&Px=OtherFlag">标识</a></td>
    <td><a href="<%=PageUrl%>&Px=ClickPv_Counter">点击PV</a></td>
    <td><a href="<%=PageUrl%>&Px=ClickUv_Counter">点击UV</a></td>
    <td><a href="<%=PageUrl%>&Px=Click_Counter">点击IP</a></td>
    <td><a href="<%=PageUrl%>&Px=LastTime">最后时间</a></td>
  </tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
  <tr> 
    <td style="font-weight:bold;"><%=Rs.RecordCount-Rs.Pagesize*(Page)+MyPageSize%></td>
    <td><%=Rs("OtherFlag")%></td>
    <td><%=Rs("ClickPv_Counter")%></td>
    <td><%=Rs("ClickUv_Counter")%></td>
    <td><%=Rs("Click_Counter")%></td>
    <td><%=GetTurnTime(Hour(Rs("LastTime")))&":"&GetTurnTime(Minute(Rs("LastTime")))&":"&GetTurnTime(Second(Rs("LastTime")))%></td>
  </tr>
  
<%If Rs("Ly")<>"" Then%>
<tr>
<td colspan="6"><a href="<%=PageUrl%>&Px=Ly">点击页：</a><%
Response.Write "<a href='"&Rs("Ly")&"' target='_blank'>"&server.HTMLEncode(Rs("Ly"))&"</a>"
%></td>
</tr>
<%End If%>

<%If Rs("Ly_2")<>"" Then%>
<tr>
<td colspan="6"><a href="<%=PageUrl%>&Px=Ly_2">来源页：</a><%
Response.Write "<a href='"&Rs("Ly_2")&"' target='_blank'>"&server.HTMLEncode(Rs("Ly_2"))&"</a>"
%></td>
</tr>
<%End If%>

<tr>
<td colspan="6" style="border-bottom: 1px dotted #FF0000;empty-cells:show;"><a href="<%=PageUrl%>&Px=AddTime">开始时间：</a><%=GetTurnTime(Hour(Rs("AddTime")))&":"&GetTurnTime(Minute(Rs("AddTime")))&":"&GetTurnTime(Second(Rs("AddTime")))%></td>
</tr>


<%
Mypagesize=Mypagesize-1
Rs.MoveNext
Wend
Rs.Close
%>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
  