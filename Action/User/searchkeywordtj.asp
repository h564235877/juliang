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
Ad_ID=ChkStr(Request("Ad_ID"),2)
AdType=ChkStr(Request("AdType"),2)
Px=ChkStr(Request("Px"),1):If Px="" Then Px="IpCounter"
AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then AddDate=CStr(Date)
%>

<script>
$(function(){

$("#search").click(function(){
 var searchurl = "?Action=<%=Action%>";
 searchurl += '&AddDate=' + $('#AddDate').val();
 searchurl += '&Ad_ID=' + $('#Ad_ID').val(); 
 searchurl += '&AdType=' + $('#AdType').val(); 

 location.href=searchurl;
});

});
</script>

<table style="margin-bottom:10px;">
<tr>
<td>
<select id='AddDate' name='AddDate'>
<option value="">请选择查询日期</option>
<%Sql="Select AddDate From CFWztg_Client_Day Group By AddDate Order By AddDate Desc"
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

<td>广告ID：</td>
<td>
<select id='Ad_ID' name="Ad_ID">
<option value="">所有广告</option>
<%
Sql="Select min(b.AdName) as AdName,a.Ad_ID From CFWztg_AD_Counter_Day a inner join cfwztg_ad b on a.ad_id=b.id Where 1=1 Group By a.Ad_ID Order By a.Ad_ID"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("Ad_ID")&"'"
 If Ad_ID=Cstr(Rs("Ad_ID")) Then Response.Write " selected"
 Response.Write ">"&Rs("AdName")&"["&Rs("Ad_ID")&"]</option>"
Rs.MoveNext
Wend
%>
</select>
</td>

<td>广告类型：</td>
<td><select name="AdType" id="AdType">
<option value=""<%If AdType="" Then Response.write " selected"%>>全部</option>
<option value="1"<%If AdType="1" Then Response.write " selected"%>>直接文字或直接图片广告</option>
<option value="2"<%If AdType="2" Then Response.write " selected"%>>网页等脚本广告</option>
</select>
</td>

<td><input type="submit" name="search"  id="search" value="查询" class="btn btn-sm btn-primary"></td>
</tr>
</table>

<%
PageUrl = "?Action="&Action&"&AddDate="&AddDate&"&Ad_ID="&Ad_ID&"&AdType="&AdType

Call PxFilter(Px,"UserName,Ad_ID,Ad_Class,SiteFlag,KeyWord,IpCounter,AddTime,LastTime,Ly,Ly_2")

Sql="Select a.*,b.ad_class  From CFWztg_SearchKeyword_Day a inner join CFWztg_AD b on a.ad_id=b.id"
Sql=Sql&" Where a.AddDate='"&AddDate&"' And a.UserName='"&UserName&"'"
If Ad_ID<>"" Then Sql=Sql&" And a.Ad_ID="&Ad_ID
If AdType="1" Then Sql=Sql&" And (b.Ad_Class=1 Or b.Ad_Class=2)"
If AdType="2" Then Sql=Sql&" And (b.Ad_Class<>1 And b.Ad_Class<>2)"

If LCase(Px)="ad_class" Then
 Sql=Sql&" Order By b."&Px&" Desc"
Else
 Sql=Sql&" Order By a."&Px&" Desc"
End If


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
    <td><a href="<%=PageUrl%>&Px=AddTime">序号</a></td>
    <td><a href="<%=PageUrl%>&Px=Ad_ID">广告ID</a></td>
	<td><a href="<%=PageUrl%>&Px=Ad_Class">广告类型</a></td>
    <td><a href="<%=PageUrl%>&Px=SiteFlag">搜索引擎</a></td>
    <td><a href="<%=PageUrl%>&Px=Keyword">搜索关键字</a></td>
	<td><a href="<%=PageUrl%>&Px=IpCounter">数量</a></td>
	<td><a href="<%=PageUrl%>&Px=AddTime">最初时间</a></td>
	<td><a href="<%=PageUrl%>&Px=LastTime">最后时间</a></td>
  </tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2">
    <td style="font-weight:bold;"><%=Rs.RecordCount-Rs.Pagesize*(Page)+MyPageSize%></td>
    <td><a href='?Action=<%=Action%>&AddDate=<%=AddDate%>&Ad_ID=<%=Rs("Ad_ID")%>'><%=Rs("Ad_ID")%></a></td>
<td><%=GetAdClassName(Rs("Ad_Class"))%></td>
<td><%=Rs("SiteFlag")%></td>
<td><%=UTF2GB(Rs("KeyWord"))%></td>
<td><%=Rs("IpCounter")%></td>
<td><%=Rs("AddTime")%></td>
<td><%=Rs("LastTime")%></td>
</tr>

<tr>
  <td colspan="12">
<a href="<%=PageUrl%>&Px=Ly_2">此关键字最后的来源页面</a>：
<%
If Rs("LastLy_2")<>"" Then
 If Len(Rs("LastLy_2"))>90 Then
  Response.Write "<a href='"&Rs("LastLy_2")&"' target='_blank'>"&server.HTMLEncode(Left(Rs("LastLy_2"),43)&"...."&Mid(Rs("LastLy"),Len(Rs("LastLy"))-43))&"</a>"
 Else
  Response.Write "<a href='"&Rs("LastLy_2")&"' target='_blank'>"&server.HTMLEncode(Rs("LastLy_2"))&"</a>"
 End If 
End If
%></td>
</tr>

<tr> 
<td colspan="12" style="border-color: #826666"><a href="<%=PageUrl%>&Px=Ly">投放页</a>：
<%
If Rs("LastLy")<>"" Then
 If Len(Rs("LastLy"))>90 Then
  Response.Write "<a href='"&Rs("LastLy")&"' target='_blank'>"&server.HTMLEncode(Left(Rs("LastLy"),43)&"...."&Mid(Rs("LastLy"),Len(Rs("LastLy"))-43))&"</a>"
 Else
  Response.Write "<a href='"&Rs("LastLy")&"' target='_blank'>"&server.HTMLEncode(Rs("LastLy"))&"</a>"
 End If 
End If
%></td>
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
