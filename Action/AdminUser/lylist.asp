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
Px=ChkStr(Request("Px"),1):If Px="" Then  Px="IpCounter"
AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then AddDate=CStr(Date)

If Request("Assort")="" Then Assort=1 Else Assort=CInt(ChkStr(Request("Assort"),2))

UserName=ChkStr(Request("UserName"),1)
Ly=ChkStr(Request("Ly"),1)
Ad_ID=ChkStr(Request("Ad_ID"),2)

PageUrl = "?Action="&Action&"&UserName="&UserName&"&Ly="&Ly&"&Ad_ID="&Ad_ID&"&Assort="&Assort&"&AddDate="&AddDate

Call PxFilter(Px,"id,UserName,AD_ID,LyHead,Ly,IpCounter,AddTime,LastTime")
%>


<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>";
 searchurl += '&AddDate=' + $('#AddDate').val();
 searchurl += '&Assort=' + $('#Assort').val();
 searchurl += '&Ad_ID=' + $('#Ad_ID').val();
 searchurl += '&Ly=' + $('#Ly').val();
 searchurl += '&UserName=' + $('#UserName').val();

 location.href=searchurl;
});

});
</script>

<table style="margin-bottom:10px;">
<tr> 
      <td><select id='AddDate' name='AddDate'>
<option value=''>请选择日期</option>
<%
Sql="Select AddDate From CFWztg_Visit_Ly Group By AddDate Order By AddDate Desc"
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

<select id='Assort' name='Assort'>
<option value='1'<%If Assort=1 Then Response.write " selected"%>>投放页</option>
<option value='2'<%If Assort=2 Then Response.write " selected"%>>投放页的域名</option>
<option value='3'<%If Assort=3 Then Response.write " selected"%>>投放页的来源页</option>
<option value='4'<%If Assort=4 Then Response.write " selected"%>>投放页的来源域名</option>
</select>

<select id='Ad_ID' name="Ad_ID">

<option value="">全部广告</option>
<option value="-7"<%If Ad_ID="-7" Then Response.Write " selected"%>>全部轮循富媒体广告 </option>
<option value="-1"<%If Ad_ID="-1" Then Response.Write " selected"%>>全部轮循直链广告 </option>
<option value="-4"<%If Ad_ID="-4" Then Response.Write " selected"%>>全部轮循普通图片广告 </option>
<option value="-8"<%If Ad_ID="-8" Then Response.Write " selected"%>>全部轮循强弹广告 </option>
<option value="-9"<%If Ad_ID="-9" Then Response.Write " selected"%>>全部轮循退弹广告 </option>

<option value="-11"<%If Ad_ID="-11" Then Response.Write " selected"%>>全部混合富媒体广告 </option>
<option value="-5"<%If Ad_ID="-5" Then Response.Write " selected"%>>全部混合文字广告</option>
<option value="-6"<%If Ad_ID="-6" Then Response.Write " selected"%>>全部混合图片广告</option>
<option value="-10"<%If Ad_ID="-10" Then Response.Write " selected"%>>全部混合标签云广告 </option>

<%
Sql="Select min(b.AdName) as AdName,a.Ad_ID From CFWztg_AD_Counter_Day a inner join cfwztg_ad b on a.ad_id=b.id Where a.pv_counter>0 Group By a.Ad_ID Order By a.Ad_ID"
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
来源
<input name="Ly" type="text" id="Ly" value="<%=Ly%>" size="10">
网站主
<input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="10">

      <td><input type="submit" name="search"  id="search" value="查询" class="btn btn-sm btn-primary"></td>
</td>
    </tr>
  
</table>


<table class="tb_2">
<tr>
<td><div class="explain">可点击标题排序</div></td>
</tr>


</table>

<table class="tb_1">

  <tr class="tr_1"> 
    <td><a href="<%=PageUrl%>&Px=AdTime">序号</a></td>
    <td><a href="<%=PageUrl%>&Px=UserName">网站主</a></td>
    <td><a href="<%=PageUrl%>&Px=Ad_ID">广告编号</a></td>
    <td><a href="<%=PageUrl%>&Px=LyHead">来源域名</a></td>
	<td><a href="<%=PageUrl%>&Px=Ly">来源页面</a></td>
    <td><a href="<%=PageUrl%>&Px=IpCounter">点击数量</a></td>
    <td><a href="<%=PageUrl%>&Px=AddTime">开始时间</a></td>
    <td><a href="<%=PageUrl%>&Px=LastTime">最后访问时间</a></td>
  </tr>
  <%

PageUrl = "?Action="&Action&"&UserName="&UserName&"&Ly="&Ly&"&Ad_ID="&Ad_ID&"&Assort="&Assort&"&AddDate="&AddDate

Call PxFilter(Px,"id,UserName,AD_ID,LyHead,Ly,IpCounter,AddTime,LastTime")


If Assort=1 Or Assort=3 Then

 Sql="Select a.*,b.adname From CFWztg_Visit_Ly a inner join CFWztg_AD b on a.ad_id=b.id Where Datediff(d,a.AddDate,'"&AddDate&"')=0"

 If UserName<>"" Then Sql=Sql&" And a.UserName='"&UserName&"'"
 If Ly<>"" Then Sql=Sql&" And a.Ly Like '%"&Ly&"%'"
If Ad_ID="" Then
ElseIf CInt(Ad_ID)<0 Then
 Sql=Sql&" And b.Ad_Class="&Abs(Ad_ID) &chr(10)
Else
 Sql=Sql&" And a.Ad_ID="&Ad_ID &chr(10)
End If
 If Assort=1 Then Sql=Sql&" And a.LyType=1"
 If Assort=3 Then Sql=Sql&" And a.LyType=2"


Sql=Sql&" Order By a."&Px&" Desc"

End If

If Assort=2 Or Assort=4 Then

Sql="Select Max(a.ID) ID,a.UserName,a.Ad_ID,a.LyHead,Max(a.Ly) Ly,Sum(a.IpCounter) IpCounter,Max(a.AddTime) AddTime,Max(a.LastTime) LastTime,max(b.adname) adname From CFWztg_Visit_Ly a inner join CFWztg_AD b on a.ad_id=b.id Where Datediff(d,a.AddDate,'"&AddDate&"')=0 "

 If UserName<>"" Then Sql=Sql&" And UserName='"&UserName&"'"
 If Ly<>"" Then Sql=Sql&" And Ly Like '%"&Ly&"%'"
If Ad_ID="" Then
ElseIf CInt(Ad_ID)<0 Then
 Sql=Sql&" And b.Ad_Class="&Abs(Ad_ID) &chr(10)
Else
 Sql=Sql&" And a.Ad_ID="&Ad_ID &chr(10)
End If
 If Assort=2 Then Sql=Sql&" And LyType=1"
 If Assort=4 Then Sql=Sql&" And LyType=2"

 Sql=Sql&" Group By a.UserName,a.Ad_ID,a.LyHead Order By "&Px&" Desc"

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

While Not Rs.Eof And MyPageSize>0
%>
  <tr>
    <td style="font-weight:bold;"><%=Rs.RecordCount-Rs.Pagesize*(Page)+MyPageSize%></td>
    <td><a href="?Action=<%=Action%>&UserName=<%=Rs("UserName")%>&AddDate=<%=AddDate%>"><%=Rs("UserName")%></a></td>
    <td><a href="?Action=<%=Action%>&Ad_ID=<%=Rs("Ad_ID")%>&AddDate=<%=AddDate%>"><%=Rs("adname")%>[<%=Rs("Ad_ID")%>]</a></td>
    <td>  
<%
If Rs("LyHead")="" Then
 Response.write "直接浏览器访问"
Else
 Response.Write "<a href='http://"&Rs("LyHead")&"' target='_blank'>"&server.HTMLEncode(Rs("LyHead"))&"</a>"
End If
%>
    </td>
	
<td>  
<%
If Rs("Ly")="" Then
 Response.write "直接浏览器访问"
Else
 Response.Write "<a href='"&Rs("Ly")&"' target='_blank'>"
 If Rs("WebTitle")<>"" Then Response.write Rs("WebTitle")&"<br>"
 Response.write server.HTMLEncode(Left(BreakUrl(Rs("Ly"),2),30))
 Response.write "</a>"
End If
%>
    </td>
    <td><%=Rs("IpCounter")%></td>
    <td><%=GetTurnTime(Hour(Rs("AddTime")))&":"&GetTurnTime(Minute(Rs("AddTime")))&":"&GetTurnTime(Second(Rs("AddTime")))%></td>
    <td><%=GetTurnTime(Hour(Rs("LastTime")))&":"&GetTurnTime(Minute(Rs("LastTime")))&":"&GetTurnTime(Second(Rs("LastTime")))%></td>
  </tr>
  <%
MyPageSize=MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>
  <tr> 
    <td colspan="9" class="td_3">
<a href="javascript:;" onclick="$(function () { confirm('确定要删除<%=AddDate%>此天的所有来源吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=lydel&AddDate=<%=AddDate%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> 删除<%=AddDate%>此天的所有来源</a>

<a href="javascript:;" onclick="$(function () { confirm('确定要删除<%=AddDate%>此天以前的所有来源吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=lybeforedel&AddDate=<%=AddDate%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> 删除<%=AddDate%>此天以前的所有来源</a>


  </tr>
</table>


<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>

