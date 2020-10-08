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
If Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" Then
 MyIp = ChkStr(Request.ServerVariables("REMOTE_ADDR"),1)
Else
 MyIp = ChkStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"),1)
 If InStr(MyIp, ",") > 0 Then MyIp = ChkStr(Left(MyIp, InStr(MyIp, ",") - 1),1)
End If

Px=ChkStr(Request("Px"),1):If Px="" Then  Px="AddTime"
AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then AddDate=CStr(Date)
Ad_ID=ChkStr(Request("Ad_ID"),2)
IpArea_2=ChkStr(Request("IpArea_2"),2)
Ip=ChkStr(Request("Ip"),1)
Ly=ChkStr(Request("Ly"),1)

If Request("SlefPageSize")="" Then SlefPageSize=50 Else SlefPageSize=CLng(ChkStr(Request("SlefPageSize"),2))

If SlefPageSize>100 Then Call AlertUrl("每页显示数输入不能大于100","?Action=iplist")
%>

<script>
$(function(){

$("#search").click(function(){

 if(isNaN($('#SlefPageSize').val())){
  alert('每页显示请输入数字', '', function () {$("#SlefPageSize").focus();});
  return false
 }

 var searchurl ="?Action=<%=Action%>";
 searchurl += '&AddDate=' + $('#AddDate').val();
 searchurl += '&Ad_ID=' + $('#Ad_ID').val();
 searchurl += '&IP=' + $('#IP').val();
 searchurl += '&IpArea_2=' + $('#IpArea_2').val();
 searchurl += '&Ly=' + $('#Ly').val();
 searchurl += '&SlefPageSize=' + $('#SlefPageSize').val();

 location.href=searchurl;
});

});
</script>

<table style="margin-bottom:10px;">
    <tr>   
    <td>
<select id='AddDate' name="AddDate">
<option value="">请选择查询日期</option>
<%
Sql="Select AddDate From CFWztg_Visit_Ip Where UserName='"&UserName&"' Group By AddDate Order By AddDate Desc"
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
<td><select id='Ad_ID' name="Ad_ID">

<option value="">所有广告</option>
<%
Sql="Select min(b.AdName) as AdName,a.Ad_ID From CFWztg_AD_Counter_Day a inner join cfwztg_ad b on a.ad_id=b.id Where a.UserName='"&UserName&"' Group By a.Ad_ID Order By a.Ad_ID"
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

<td>IP：</td>
<td><input name="IP" type="text" id="IP" value="<%=IP%>" size="10"></td>

<td>IP范围：</td>
<td><select name="IpArea_2" id="IpArea_2">
<option value=""<% If CStr(IpArea_2)="" Then Response.write " selected"%>>全部</option>
<option value="1"<% If CStr(IpArea_2)="1" Then Response.write " selected"%>>国内IP</option>
<option value="2"<% If CStr(IpArea_2)="2" Then Response.write " selected"%>>国外IP</option>
</select></td>

<td>来源：</td>
<td><input name="Ly" type="text" id="Ly" value="<%=Ly%>" size="10"></td>

<td>每页显示：</td>
<td><input name="SlefPageSize" type="text" id="SlefPageSize" value="<%=SlefPageSize%>" size="3">
条</td>

<td>&nbsp;</td>
<td><input type="submit" name="search" id="search" value="查询" class="btn btn-sm btn-primary"></td>
</tr>
</table>


<%
PageUrl = "?Action="&Action&"&Ad_ID="&Ad_ID&"&AddDate="&AddDate&"&Ip="&Ip&"&IpArea_2="&IpArea_2&"&Ly="&Ly&"&SlefPageSize="&SlefPageSize

Call PxFilter(Px,"SpaceTime,Ip,Ad_ID,Ly,Ly_2,Keyword,AddTime,LastTime,AgentStr,Alexa,WebWidth,WebHeight,WebTop,WebLeft,MouseTop,MouseLeft,ScreenWidth,ScreenHeight,ScreenColorDepth,HisLen,WinOri,Hwc,Vendor,Renderer,Cct,Ostype,BrowserType,ErrorClickTotal,PvTotal,LastUrl,LastTime,FirstShowTime,VisitTotal,LowUnionUserName,Unit_Cent")
 
Sql="Select Count(1) From CFWztg_Visit_Ip where UserName='"&UserName&"' And Datediff(d,AddDate,'"&AddDate&"')=0 And AdDuct=0"&SqlW
Set Rs=Conn.execute(Sql)
IpTotal=Rs(0)


Sql="Select Top 2000 *,datediff(s,firstshowtime,addtime) SpaceTime From CFWztg_Visit_Ip WITH(NOLOCK) where UserName='"&UserName&"' And Datediff(d,AddDate,'"&AddDate&"')=0 And AdDuct=0"&SqlW
Sql=Sql&" Order By "&Px&" Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.pagesize = SlefPageSize
 TotalRs=Rs.RecordCount
 TotalPage=Rs.PageCount
 MyPageSize=Rs.PageSize
 FixedSize=Rs.PageSize
 Rs.AbsolutePage=Page
End If
%>

<table class="tb_2">
<tr>
<td><div class="explain">
点击标题可排序,总共IP记录<%=IpTotal%>条<%If IpTotal>2000 Then Response.write ",只显示最新2000条"%>
</div>
</td>
</tr>
</table>


<table class="tb_1">
  <tr class="tr_1"> 
    <td><a href="<%=PageUrl%>&Px=AddTime">序号</a></td>
    <td><a href="<%=PageUrl%>&Px=IP">IP</a></td>
    <td><a href="<%=PageUrl%>&Px=Ad_ID">广告</a></td>
    <td><a href="<%=PageUrl%>&Px=FirstShowTime">初显</a></td>
	<td><a href="<%=PageUrl%>&Px=AddTime">点时</a></td>
	<td><a href="<%=PageUrl%>&Px=SpaceTime">显间</a></td>
	<td><a href="<%=PageUrl%>&Px=VisitTotal">显次</a>/<a href="<%=PageUrl%>&Px=HisLen">历史</a></td>
	<td><a href="<%=PageUrl%>&Px=ErrorClickTotal">无效</a></td>
    <td><a href="<%=PageUrl%>&Px=ScreenWidth">屏宽</a>/<a href="<%=PageUrl%>&Px=WebWidth">页宽</a></td>
    <td><a href="<%=PageUrl%>&Px=ScreenHeight">屏高</a>/<a href="<%=PageUrl%>&Px=WebHeight">页高</a></td>
    <td><a href="<%=PageUrl%>&Px=WebTop">页顶</a></td>
    <td><a href="<%=PageUrl%>&Px=WebLeft">页左</a></td>
    <td><a href="<%=PageUrl%>&Px=MouseTop">鼠顶</a></td>
    <td><a href="<%=PageUrl%>&Px=MouseLeft">鼠左</a></td>
    <td><a href="<%=PageUrl%>&Px=WinOri">方向</a></td>
    <td><a href="<%=PageUrl%>&Px=Hwc">核数</a></td>
    <td><a href="<%=PageUrl%>&Px=Vendor">CPU</a></td>
    <td><a href="<%=PageUrl%>&Px=Renderer">GPU</a></td>
    <td><a href="<%=PageUrl%>&Px=Cct">网络</a></td>
  </tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2"> 
    <td style="font-weight:bold;"><%=Rs.RecordCount-Rs.Pagesize*(Page)+MyPageSize%></td>
    <td><%
If MyIp=Rs("Ip") Then
 Response.Write "<font color=ff0000>"&Rs("Ip")&"</font>"
Else
 Response.Write Rs("Ip")
End If

 If Rs("IpArea")<>"" Then
  Response.write "<br>"&Rs("IpArea")
 End If
%></td>
    <td><a href="?Action=<%=Action%>&AddDate=<%=AddDate%>&Ad_ID=<%=Rs("Ad_ID")%>"><%=Rs("Ad_ID")%></a>[<a href="?Action=iplist&Ad_ID=<%=Rs("Ad_ID")%>&AddDate=<%=Rs("AddDate")%>">查</a>]</td>
	<td><%=GetTurnTime(Hour(Rs("FirstShowTime")))&":"&GetTurnTime(Minute(Rs("FirstShowTime")))&":"&GetTurnTime(Second(Rs("FirstShowTime")))%></td>
    <td><%=GetTurnTime(Hour(Rs("AddTime")))&":"&GetTurnTime(Minute(Rs("AddTime")))&":"&GetTurnTime(Second(Rs("AddTime")))%></td>
    <td>
<%
If isnull(Rs("FirstShowTime"))=False Or Rs("FirstShowTime")="" Then
 Response.write DateDiff("s",Rs("FirstShowTime"),Rs("AddTime"))&"秒"
End If
%>
</td>
    <td><%=Rs("VisitTotal")%>/<%=Rs("HisLen")%></td>
	<td><%=Rs("ErrorClickTotal")%></td>
	<td><%=Rs("ScreenWidth")%>/<%=Rs("WebWidth")%></td>
	<td><%=Rs("ScreenHeight")%>/<%=Rs("WebHeight")%></td>
    <td><%=Rs("WebTop")%></td>
    <td><%=Rs("WebLeft")%></td>
    <td><%=Rs("MouseTop")%></td>
    <td><%=Rs("MouseLeft")%></td>
    <td><%=Rs("WinOri")%></td>
    <td><%=Rs("Hwc")%></td>
    <td style="word-wrap:break-word;word-break:break-all;width:70px;"><%=Rs("Vendor")%></td>
    <td style="word-wrap:break-word;word-break:break-all;width:100px;"><%=Rs("Renderer")%></td>
    <td><%=Rs("Cct")%></td>
  </tr>

<tr> 
<td colspan="23" class="td_1" style="word-wrap: break-word;word-break:break-all;">
<a href="<%=PageUrl%>&Px=Ly_2">投放页的来源页</a>:<%
If Rs("Ly_2")<>"" Then
 If Len(Rs("Ly_2"))>90 Then
  Response.Write "<a href='"&Rs("Ly_2")&"' target='_blank'>"&server.HTMLEncode(Left(Rs("Ly_2"),43)&"...."&Mid(Rs("Ly_2"),Len(Rs("Ly_2"))-43))&"</a>"
 Else
  Response.Write "<a href='"&Rs("Ly_2")&"' target='_blank'>"&server.HTMLEncode(Rs("Ly_2"))&"</a>"
 End If 
End If
%></td>
</tr>

<tr> 
<td colspan="23" class="td_1" style="word-wrap: break-word;word-break:break-all;">
<a href="<%=PageUrl%>&Px=Ly">投放页</a>:<%
If Rs("Ly")="" Then
 Response.write "直接浏览器访问"
Else
 Response.Write "<a href='"&Rs("Ly")&"' target='_blank'>"
 If Rs("WebTitle")<>"" Then
  Response.write server.HTMLEncode(Rs("WebTitle")) &"_"&  server.HTMLEncode(Rs("Ly"))
 Else
  Response.write server.HTMLEncode(Rs("Ly"))
 End If 
 Response.write "</a>"
End If
%></td>
</tr>

<%If Rs("LastUrl")<>"" Then%>
<tr> 
<td colspan="23" class="td_1" style="word-wrap: break-word;word-break:break-all;">
<a href="<%=PageUrl%>&Px=LastUrl">最后浏览页面信息</a>(<a href="<%=PageUrl%>&Px=LastTime"><%=GetTurnTime(Hour(Rs("LastTime")))&":"&GetTurnTime(Minute(Rs("LastTime")))&":"&GetTurnTime(Second(Rs("LastTime")))%></a> 停留<%=DateDiff("s",Rs("AddTime"),Rs("LastTime"))%>秒)):<%
If Rs("LastUrl")="" Then
 Response.write "直接浏览器访问"
Else
 Response.Write "<a href='"&Rs("LastUrl")&"' target='_blank'>"&server.HTMLEncode(Rs("LastUrl"))&"</a>"
End If
%></td>
</tr>
<%End If%>

<tr> 
<td colspan="23" class="td_1" style="word-wrap: break-word;word-break:break-all;">
<a href="<%=PageUrl%>&Px=AgentStr">参数</a>:<%=Rs("AgentStr")%></td>
</tr>

<tr>
  <td colspan="23" class="td_1" style="border-color: #826666">
[<a href="<%=PageUrl%>&Px=BrowserType">浏览器</a>:<%=Rs("BrowserType")%>]
[<a href="<%=PageUrl%>&Px=OsType">操作系统</a>:<%=Rs("OsType")%>]
[<a href="<%=PageUrl%>&Px=ScreenColorDepth">屏幕色彩</a>:<%=Rs("ScreenColorDepth")%>位]
[<a href="<%=PageUrl%>&Px=Alexa">Alexa</a>:<%
If Rs("Alexa")=1 Then
 Response.write "已安装"
Else
 Response.write "未安装"
End If

%>]
[<a href="<%=PageUrl%>&Px=Unit_Cent">单价</a>:<%=GetTurnCent(Rs("Unit_Cent"))%>]

[<a href="<%=PageUrl%>&Px=PvTotal">点击确认PV</a>:<%=Rs("PvTotal")%>]
[<a href="<%=PageUrl%>&Px=keyword">搜索引擎关键字</a>:<%="<a href='"&Rs("Ly_2")&"' target='_blank'>"&server.HTMLEncode(UTF2GB(Rs("Keyword")))&"</a>"%>]
[<a href="<%=PageUrl%>&Px=LowUnionUserName">下级联盟用户名</a>:<%=server.HTMLEncode(Rs("LowUnionUserName"))%>]
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

