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
UserName=ChkStr(Request("UserName"),1)
Ad_ID=ChkStr(Request("Ad_ID"),2)
ClickFlag=ChkStr(Request("ClickFlag"),2)
Ip=ChkStr(Request("Ip"),1)
Ly=ChkStr(Request("Ly"),1)
If Request("SlefPageSize")="" Then SlefPageSize=50 Else SlefPageSize=CLng(ChkStr(Request("SlefPageSize"),2))

If SlefPageSize>200 Then Call AlertUrl("每页显示数输入不能大于200","?Action=iplist")
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
 searchurl += '&UserName=' + $('#UserName').val();
 searchurl += '&Ad_ID=' + $('#Ad_ID').val();
 searchurl += '&ClickFlag=' + $('#ClickFlag').val();
 searchurl += '&IP=' + $('#IP').val();
 searchurl += '&Ly=' + $('#Ly').val();
 searchurl += '&SlefPageSize=' + $('#SlefPageSize').val();

 location.href=searchurl;
});

});
</script>


<table style="margin-bottom:10px;">
      <td><select id='AddDate' name="AddDate">
<option value="">请选择日期</option>
<%
Sql="Select AddDate From CFWztg_Invalid_Ip Group By AddDate Order By AddDate Desc"
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
%>
</select></td>

      <td>网站主</td>
      <td><input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="10"></td>

      <td>广告</td>
      <td><select id='Ad_ID' name="Ad_ID">

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
Rs.Close
%>

</select></td>

      <td>错误类型</td>
      <td><input name="ClickFlag" type="text" id="ClickFlag" value="<%=ClickFlag%>" size="5"></td>

      <td>IP</td>
      <td><input name="IP" type="text" id="IP" value="<%=IP%>" size="10"></td>

      <td>来源</td>
      <td><input name="Ly" type="text" id="Ly" value="<%=Ly%>" size="10"></td>

      <td>每页</td>
      <td><input name="SlefPageSize" type="text" id="SlefPageSize" value="<%=SlefPageSize%>" size="3">
      条</td>

      <td>&nbsp;</td>
      <td><input type="submit" name="submit" value="查询" class="btn btn-sm btn-primary" id="search"></td>
    </tr>
</table>


<%

PageUrl = "?Action="&Action&"&Ad_ID="&Ad_ID&"&AddDate="&AddDate&"&UserName="&UserName&"&ClickFlag="&ClickFlag&"&Ip="&Ip&"&Ly="&Ly&"&SlefPageSize="&SlefPageSize

Call PxFilter(Px,"spacetime,UserName,Ip,ClickFlag,Ad_ID,Ly,Ly_2,Keyword,AddTime,AgentStr,Alexa,WebWidth,WebHeight,WebTop,WebLeft,MouseTop,MouseLeft,ScreenWidth,ScreenHeight,ScreenColorDepth,HisLen,WinOri,Hwc,Vendor,Renderer,Cct,Ostype,BrowserType,FirstShowTime,VisitTotal,ClickTotal,LowUnionUserName")


 If UserName<>"" Then SqlW=" And UserName='"&UserName&"'"
 If Ad_ID<>"" Then SqlW=SqlW&" And Ad_ID="&Ad_ID
 If ClickFlag<>"" Then SqlW=SqlW&" And ClickFlag="&ClickFlag
 If Ip<>"" Then SqlW=SqlW&" And Ip Like '%"&Ip&"%'"
 If Ly<>"" Then SqlW=SqlW&" And Ly Like '%"&Ly&"%'"
 

Sql="Select Count(1) From CFWztg_Invalid_Ip where Datediff(d,AddDate,'"&AddDate&"')=0"&SqlW
Set Rs=Conn.execute(Sql)
IpTotal=Rs(0)
Rs.Close


Sql="Select Top 2000 *,datediff(s,firstshowtime,addtime) SpaceTime From CFWztg_Invalid_Ip WITH(NOLOCK) where Datediff(d,AddDate,'"&AddDate&"')=0"&SqlW
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
<td>
<div class="explain">
点击标题可排序,总共IP记录<%=IpTotal%>条<%If IpTotal>2000 Then Response.write ",只显示最新2000条"%>
</div>
</td>
</tr>
</table>


<table class="tb_1">
  <tr  class="tr_1"> 
    <td><a href="<%=PageUrl%>&Px=AddTime">序号</a></td>
    <td><a href="<%=PageUrl%>&Px=UserName">网站主</a></td>
    <td><a href="<%=PageUrl%>&Px=IP">IP</a></td>
    <td><a href="<%=PageUrl%>&Px=ClickFlag">错误类型</a></td>
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
    <td><%=Rs("UserName")%>[<a href="?Action=<%=Action%>&UserName=<%=Rs("UserName")%>">搜</a>][<a href="?Action=clickflaglist&UserName=<%=Rs("UserName")%>&Ad_ID=<%=Rs("Ad_ID")%>&AddDate=<%=Rs("AddDate")%>">查</a>]</td>
    <td><%
If MyIp=Rs("Ip") Then
 Response.Write "<font color=ff0000>"&Rs("Ip")&"</font>"
Else
 Response.Write Rs("Ip")
End If
%></td>
    <td><a href="?Action=<%=Action%>&AddDate=<%=AddDate%>&ClickFlag=<%=Rs("ClickFlag")%>"><%=Rs("ClickFlag")&"-"&GetClickFlagDesc(Rs("ClickFlag"))%></a></td>
    <td><a href="?Action=<%=Action%>&AddDate=<%=AddDate%>&Ad_ID=<%=Rs("Ad_ID")%>"><%=Rs("Ad_ID")%></a></td>
    <td><%=GetTurnTime(Hour(Rs("FirstShowTime")))&":"&GetTurnTime(Minute(Rs("FirstShowTime")))&":"&GetTurnTime(Second(Rs("FirstShowTime")))%></td>
	<td><%=GetTurnTime(Hour(Rs("AddTime")))&":"&GetTurnTime(Minute(Rs("AddTime")))&":"&GetTurnTime(Second(Rs("AddTime")))%></td>
    <td>
<%
If isnull(Rs("FirstShowTime"))=false Then
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
<td colspan="24" class="td_1" style="word-wrap: break-word;word-break:break-all;">
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
<td colspan="24" class="td_1" style="word-wrap: break-word;word-break:break-all;">
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



<tr> 
<td colspan="24" class="td_1" style="word-wrap: break-word;word-break:break-all;">
<a href="<%=PageUrl%>&Px=AgentStr">参数</a>:<%=Rs("AgentStr")%></td>
</tr>

<tr>
  <td colspan="24" class="td_1" style="border-color: #826666">
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

  <tr> 
    <td colspan="24" class="td_3">
<a href="javascript:;" onclick="$(function () { confirm('确定要删除<%=AddDate%>此天的所有无效IP吗??', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=invalidipdel&AddDate=<%=AddDate%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> 删除<%=AddDate%>此天的所有无效IP</a>

<a href="javascript:;" onclick="$(function () { confirm('确定要删除<%=AddDate%>此天以前的所有无效IP??', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=invalidipbeforedel&AddDate=<%=AddDate%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> 删除<%=AddDate%>此天以前的所有无效IP</a>

</td>
  </tr>
</table>



<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
