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
Ad_ID=ChkStr(Request("Ad_ID"),2)
AdType=ChkStr(Request("AdType"),2)
AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then AddDate=CStr(Date)
Px=ChkStr(Lcase(Request("Px")),1):If Px="" Then Px="IpCounter"
%>

<script>
$(function(){

$("#search").click(function(){
 var searchurl = "?Action=<%=Action%>";
 searchurl += '&AddDate=' + $('#AddDate').val();
 searchurl += '&UserName=' + $('#UserName').val(); 
 searchurl += '&Ad_ID=' + $('#Ad_ID').val(); 

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

<td>网站主：</td>
<td><input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="10"></td>

<td>广告ID：</td>
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
%>
</select>
</td>

<td>广告类型：</td>
<td><select name="AdType">
<option value=""<%If AdType="" Then Response.write " selected"%>>全部</option>
<option value="1"<%If AdType="1" Then Response.write " selected"%>>直接文字或直接图片广告</option>
<option value="2"<%If AdType="2" Then Response.write " selected"%>>网页等脚本广告</option>
</select></td>

<td>&nbsp;</td>
<td><input type="submit" name="search"  id="search" value="查询" class="btn btn-sm btn-primary"></td>
</tr>
</table>

<table class="tb_2">
<tr>
<td>
<div class="explain">
点击标题排序</div>
</td>
</tr>
</table>
  
<%
PageUrl = "?Action="&Action&"&AddDate="&AddDate&"&UserName="&UserName&"&Ad_ID="&Ad_ID&"&AdType="&AdType

Call PxFilter(Px,"UserName,Ad_ID,Ad_Class,IpCounter,ClickWebLyCounter,KeywordCounter,ClickWebCounter,ClickFlagCounter,AlexaCounter,errorrate,AdAffirm_1,AdAffirm_2,AdAffirm_3")


Sql="Select a.*,b.ad_class,(convert(bigint,a.ClickFlagCounter)*1000/case when a.IpCounter=0 then 1 else a.IpCounter end) as ErrorRate  From CFWztg_Client_Day a inner join CFWztg_AD b on a.ad_id=b.id"

Sql=Sql&" Where a.AddDate='"&AddDate&"'"

If UserName<>"" Then Sql=Sql&" And a.UserName='"&UserName&"'"
If Ad_ID<>"" Then Sql=Sql&" And a.Ad_ID="&Ad_ID

If AdType="1" Then Sql=Sql&" And (b.Ad_Class=1 Or b.Ad_Class=2)"
If AdType="2" Then Sql=Sql&" And (b.Ad_Class<>1 And b.Ad_Class<>2)"

If Px="ad_class" Then
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
<td><a href="<%=PageUrl%>&Px=UserName">网站主</a></td>
<td><a href="<%=PageUrl%>&Px=Ad_ID">广告ID</a></td>
<td><a href="<%=PageUrl%>&Px=Ad_Class">广告类型</a></td>
<td><a href="<%=PageUrl%>&Px=IpCounter">有效</a></td>
<td><a href="<%=PageUrl%>&Px=ClickFlagCounter">无效</a></td>
<td>第<a href="<%=PageUrl%>&Px=AdAffirm_1">1</a>/<a href="<%=PageUrl%>&Px=AdAffirm_2">2</a>/<a href="<%=PageUrl%>&Px=AdAffirm_3">3</a>次确认数</a></td>
<td><a href="<%=PageUrl%>&Px=ClickWebLyCounter">点来页</a></td>
<td><a href="<%=PageUrl%>&Px=KeywordCounter">关键字</a></td>
<td><a href="<%=PageUrl%>&Px=ClickWebCounter">点击页</a></td>
<td><a href="<%=PageUrl%>&Px=AlexaCounter">Alexa</a></td>
<td><a href="<%=PageUrl%>&Px=ErrorRate">无效点击率</a></td>
<td></td>
</tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td><a href='?Action=<%=Action%>&AddDate=<%=AddDate%>&UserName=<%=Rs("UserName")%>'><%=Rs("UserName")%></a></td>
<td><a href='?Action=<%=Action%>&AddDate=<%=AddDate%>&Ad_ID=<%=Rs("Ad_ID")%>'><%=Rs("Ad_ID")%></a></td>
<td><%=GetAdClassName(Rs("Ad_Class"))%></td>
<td><%=Rs("IpCounter")%></td>
<td><%=Rs("ClickFlagCounter")%>[<a href='?Action=clickflaglist&username=<%=Rs("UserName")%>&adddate=<%=AddDate%>&ad_id=<%=Rs("Ad_ID")%>'>查</a>]</td>
<td><%=Rs("AdAffirm_1")%>/<%=Rs("AdAffirm_2")%>/<%=Rs("AdAffirm_3")%></td>
<td><%=Rs("ClickWebLyCounter")%></td>
<td><%=Rs("KeywordCounter")%></td>
<td><%=Rs("ClickWebCounter")%></td>
<td><%=Rs("AlexaCounter")%></td>
<td><%=FormatNumber(CDbl(Rs("ErrorRate")),0,-1,0,0)%>‰</td>

<td><a href="?Action=iplist&UserName=<%=Rs("UserName")%>&Ad_ID=<%=Rs("Ad_ID")%>&AddDate=<%=Rs("AddDate")%>">[查看]</a></td>
</tr>

<tr> 
<td colspan="20">
IE8(<%=Rs("Browser1")%>) | 9(<%=Rs("Browser2")%>) | 10(<%=Rs("Browser3")%>) | 搜狗(<%=Rs("Browser4")%>) | 360(<%=Rs("Browser5")%>) | Chrome(<%=Rs("Browser6")%>) | 火狐(<%=Rs("Browser7")%>) | 其它(<%=Rs("BrowserOther")%>)</td>
</tr>

<tr> 
<td colspan="20">
Windows 7(<%=Rs("Os1")%>) | 10(<%=Rs("Os2")%>) | XP(<%=Rs("Os3")%>) | 安卓(<%=Rs("Os4")%>) | iPhone(<%=Rs("Os5")%>) | 其它(<%=Rs("OsOther")%>)</td>
</tr>

<tr> 
<td colspan="20">
屏幕宽:1024(<%=Rs("ScreenWidth1")%>) | 1280(<%=Rs("ScreenWidth2")%>) | 1440(<%=Rs("ScreenWidth3")%>) | 1152(<%=Rs("ScreenWidth4")%>) | 1680(<%=Rs("ScreenWidth5")%>) | 800(<%=Rs("ScreenWidth6")%>) | 1600(<%=Rs("ScreenWidth7")%>) | 1920(<%=Rs("ScreenWidth8")%>) | 1360(<%=Rs("ScreenWidth9")%>) | 其它(<%=Rs("ScreenWidthOther")%>)</td>
</tr>

<tr> 
<td colspan="20">
屏幕高:768(<%=Rs("ScreenHeight1")%>) | 800(<%=Rs("ScreenHeight2")%>) | 900(<%=Rs("ScreenHeight3")%>) | 1024(<%=Rs("ScreenHeight4")%>) | 864(<%=Rs("ScreenHeight5")%>) | 1050(<%=Rs("ScreenHeight6")%>) | 960(<%=Rs("ScreenHeight7")%>) | 720(<%=Rs("ScreenHeight8")%>) | 600(<%=Rs("ScreenHeight9")%>) | 其它(<%=Rs("ScreenHeightOther")%>)</td>
</tr>

<tr> 
<td colspan="20" style="border-color: #826666">
屏幕色彩:32位(<%=Rs("ScreenColorDepth1")%>) | 16位(<%=Rs("ScreenColorDepth2")%>) | 24位(<%=Rs("ScreenColorDepth3")%>) | 其它(<%=Rs("ScreenColorDepthOther")%>) | </td>
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



