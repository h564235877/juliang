<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
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

If SlefPageSize>100 Then Call AlertUrl("ÿҳ��ʾ�����벻�ܴ���100","?Action=iplist")
%>

<script>
$(function(){

$("#search").click(function(){

 if(isNaN($('#SlefPageSize').val())){
  alert('ÿҳ��ʾ����������', '', function () {$("#SlefPageSize").focus();});
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
<option value="">��ѡ���ѯ����</option>
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

<td>���ID��</td>
<td><select id='Ad_ID' name="Ad_ID">

<option value="">���й��</option>
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

<td>IP��</td>
<td><input name="IP" type="text" id="IP" value="<%=IP%>" size="10"></td>

<td>IP��Χ��</td>
<td><select name="IpArea_2" id="IpArea_2">
<option value=""<% If CStr(IpArea_2)="" Then Response.write " selected"%>>ȫ��</option>
<option value="1"<% If CStr(IpArea_2)="1" Then Response.write " selected"%>>����IP</option>
<option value="2"<% If CStr(IpArea_2)="2" Then Response.write " selected"%>>����IP</option>
</select></td>

<td>��Դ��</td>
<td><input name="Ly" type="text" id="Ly" value="<%=Ly%>" size="10"></td>

<td>ÿҳ��ʾ��</td>
<td><input name="SlefPageSize" type="text" id="SlefPageSize" value="<%=SlefPageSize%>" size="3">
��</td>

<td>&nbsp;</td>
<td><input type="submit" name="search" id="search" value="��ѯ" class="btn btn-sm btn-primary"></td>
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
������������,�ܹ�IP��¼<%=IpTotal%>��<%If IpTotal>2000 Then Response.write ",ֻ��ʾ����2000��"%>
</div>
</td>
</tr>
</table>


<table class="tb_1">
  <tr class="tr_1"> 
    <td><a href="<%=PageUrl%>&Px=AddTime">���</a></td>
    <td><a href="<%=PageUrl%>&Px=IP">IP</a></td>
    <td><a href="<%=PageUrl%>&Px=Ad_ID">���</a></td>
    <td><a href="<%=PageUrl%>&Px=FirstShowTime">����</a></td>
	<td><a href="<%=PageUrl%>&Px=AddTime">��ʱ</a></td>
	<td><a href="<%=PageUrl%>&Px=SpaceTime">�Լ�</a></td>
	<td><a href="<%=PageUrl%>&Px=VisitTotal">�Դ�</a>/<a href="<%=PageUrl%>&Px=HisLen">��ʷ</a></td>
	<td><a href="<%=PageUrl%>&Px=ErrorClickTotal">��Ч</a></td>
    <td><a href="<%=PageUrl%>&Px=ScreenWidth">����</a>/<a href="<%=PageUrl%>&Px=WebWidth">ҳ��</a></td>
    <td><a href="<%=PageUrl%>&Px=ScreenHeight">����</a>/<a href="<%=PageUrl%>&Px=WebHeight">ҳ��</a></td>
    <td><a href="<%=PageUrl%>&Px=WebTop">ҳ��</a></td>
    <td><a href="<%=PageUrl%>&Px=WebLeft">ҳ��</a></td>
    <td><a href="<%=PageUrl%>&Px=MouseTop">��</a></td>
    <td><a href="<%=PageUrl%>&Px=MouseLeft">����</a></td>
    <td><a href="<%=PageUrl%>&Px=WinOri">����</a></td>
    <td><a href="<%=PageUrl%>&Px=Hwc">����</a></td>
    <td><a href="<%=PageUrl%>&Px=Vendor">CPU</a></td>
    <td><a href="<%=PageUrl%>&Px=Renderer">GPU</a></td>
    <td><a href="<%=PageUrl%>&Px=Cct">����</a></td>
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
    <td><a href="?Action=<%=Action%>&AddDate=<%=AddDate%>&Ad_ID=<%=Rs("Ad_ID")%>"><%=Rs("Ad_ID")%></a>[<a href="?Action=iplist&Ad_ID=<%=Rs("Ad_ID")%>&AddDate=<%=Rs("AddDate")%>">��</a>]</td>
	<td><%=GetTurnTime(Hour(Rs("FirstShowTime")))&":"&GetTurnTime(Minute(Rs("FirstShowTime")))&":"&GetTurnTime(Second(Rs("FirstShowTime")))%></td>
    <td><%=GetTurnTime(Hour(Rs("AddTime")))&":"&GetTurnTime(Minute(Rs("AddTime")))&":"&GetTurnTime(Second(Rs("AddTime")))%></td>
    <td>
<%
If isnull(Rs("FirstShowTime"))=False Or Rs("FirstShowTime")="" Then
 Response.write DateDiff("s",Rs("FirstShowTime"),Rs("AddTime"))&"��"
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
<a href="<%=PageUrl%>&Px=Ly_2">Ͷ��ҳ����Դҳ</a>:<%
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
<a href="<%=PageUrl%>&Px=Ly">Ͷ��ҳ</a>:<%
If Rs("Ly")="" Then
 Response.write "ֱ�����������"
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
<a href="<%=PageUrl%>&Px=LastUrl">������ҳ����Ϣ</a>(<a href="<%=PageUrl%>&Px=LastTime"><%=GetTurnTime(Hour(Rs("LastTime")))&":"&GetTurnTime(Minute(Rs("LastTime")))&":"&GetTurnTime(Second(Rs("LastTime")))%></a> ͣ��<%=DateDiff("s",Rs("AddTime"),Rs("LastTime"))%>��)):<%
If Rs("LastUrl")="" Then
 Response.write "ֱ�����������"
Else
 Response.Write "<a href='"&Rs("LastUrl")&"' target='_blank'>"&server.HTMLEncode(Rs("LastUrl"))&"</a>"
End If
%></td>
</tr>
<%End If%>

<tr> 
<td colspan="23" class="td_1" style="word-wrap: break-word;word-break:break-all;">
<a href="<%=PageUrl%>&Px=AgentStr">����</a>:<%=Rs("AgentStr")%></td>
</tr>

<tr>
  <td colspan="23" class="td_1" style="border-color: #826666">
[<a href="<%=PageUrl%>&Px=BrowserType">�����</a>:<%=Rs("BrowserType")%>]
[<a href="<%=PageUrl%>&Px=OsType">����ϵͳ</a>:<%=Rs("OsType")%>]
[<a href="<%=PageUrl%>&Px=ScreenColorDepth">��Ļɫ��</a>:<%=Rs("ScreenColorDepth")%>λ]
[<a href="<%=PageUrl%>&Px=Alexa">Alexa</a>:<%
If Rs("Alexa")=1 Then
 Response.write "�Ѱ�װ"
Else
 Response.write "δ��װ"
End If

%>]
[<a href="<%=PageUrl%>&Px=Unit_Cent">����</a>:<%=GetTurnCent(Rs("Unit_Cent"))%>]

[<a href="<%=PageUrl%>&Px=PvTotal">���ȷ��PV</a>:<%=Rs("PvTotal")%>]
[<a href="<%=PageUrl%>&Px=keyword">��������ؼ���</a>:<%="<a href='"&Rs("Ly_2")&"' target='_blank'>"&server.HTMLEncode(UTF2GB(Rs("Keyword")))&"</a>"%>]
[<a href="<%=PageUrl%>&Px=LowUnionUserName">�¼������û���</a>:<%=server.HTMLEncode(Rs("LowUnionUserName"))%>]
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

