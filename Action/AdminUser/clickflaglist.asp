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
AD_ID=ChkStr(Request("AD_ID"),2)
AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then AddDate=CStr(Date)
Px=ChkStr(Request("Px"),1):If Px="" Then Px="ClickFlag_All"
%>
<script>
$(function(){

$("#search").click(function(){
 var searchurl = "?Action=<%=Action%>";
 searchurl += '&UserName=' + $('#UserName').val();
 searchurl += '&AddDate=' + $('#AddDate').val();
 searchurl += '&Ad_ID=' + $('#Ad_ID').val(); 

 location.href=searchurl;
});

});
</script>

<table style="margin-bottom:10px;">
<tr> 

<td>网站主：<input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="10">
日期：<select id='AddDate' name="AddDate">
<option value="">请选择查询日期</option>
<%
Sql="Select AddDate From CFWztg_ClickFlag_Day Where 1=1 Group By AddDate Order By AddDate Desc"
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
</select>

广告：<select id='Ad_ID' name="Ad_ID">
<option value=''<%If Ad_ID="" Then Response.write " selected"%>>全部广告</option>
<%
Sql="Select min(b.AdName) as AdName,a.Ad_ID From CFWztg_ClickFlag_Day a inner join cfwztg_ad b on a.ad_id=b.id Where 1=1 Group By a.Ad_ID Order By a.Ad_ID"
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

</select>
<input type="submit" name="search" id="search" value="查询" class="btn btn-sm btn-primary">
</td>

</tr>
</table>


<%

PageUrl = "?Action="&Action&"&UserName="&UserName&"&Ad_ID="&Ad_ID&"&AddDate="&AddDate

Call PxFilter(Px,"UserName,Ad_ID,Click_Counter,Click_2_Counter,ClickFlag_1,ClickFlag_4,ClickFlag_6,ClickFlag_10,ClickFlag_11,ClickFlag_13,ClickFlag_14,ClickFlag_15,ClickFlag_16,ClickFlag_27,ClickFlag_0,ClickFlag_All")
%>
<table class="tb_2">
<tr>
<td>
<div class="explain">
10-刷IP 或 27-防IP段 数量占比多的一般是自动换IP刷量作弊的，点击率高错误占比多的也有可能是作弊的
</div>
</td>
</tr>
</table>

<table class="tb_1">

<tr class="tr_1"> 
<td><a href="<%=PageUrl%>&Px=UserName">用户</a></td>
<td><a href="<%=PageUrl%>&Px=Ad_ID">广告</a></td>
<td><a href="<%=PageUrl%>&Px=Click_Counter">正常点击<br />(扣点后)</a></td>
<td><a href="<%=PageUrl%>&Px=Click_2_Counter">正常点击<br />(没有扣点)</a></td>
<td><a href="<%=PageUrl%>&Px=ClickFlag_6">6-点击<br />率过高</a></td>
<td><a href="<%=PageUrl%>&Px=ClickFlag_10">10-刷IP或<br />修改过参数</a></td>
<td><a href="<%=PageUrl%>&Px=ClickFlag_27">27-点击<br />防IP段生效</a></td>
<td><a href="<%=PageUrl%>&Px=ClickFlag_1">1-IP在系<br />统黑名单</a></td>
<td><a href="<%=PageUrl%>&Px=ClickFlag_4">4-IP在刷IP的<br />单个或段内</a></td>
<td><a href="<%=PageUrl%>&Px=ClickFlag_13">13-此设备<br />已经点击过</a></td>
<td><a href="<%=PageUrl%>&Px=ClickFlag_14">14-此IP<br />已经点击过</a></td>
<td><a href="<%=PageUrl%>&Px=ClickFlag_15">15-广<br />告扣点</a></td>
<td><a href="<%=PageUrl%>&Px=ClickFlag_16">16-用<br />户扣点</a></td>
<td><a href="<%=PageUrl%>&Px=ClickFlag_11">11-伪造<br />user-agent</a></td>
<td><a href="<%=PageUrl%>&Px=ClickFlag_0">其它无<br />效合计</a></td>
<td><a href="<%=PageUrl%>&Px=ClickFlag_All">全部无<br />效合计</a></td>
<td>操作</td>
</tr>
  

<%
'--全部，按用户搜索或按广告id搜索时

Sql="Select sum(b.Click_Counter) Click_Counter,sum(b.Click_2_Counter) Click_2_Counter,"

Sql= Sql & "sum(a.ClickFlag_6) ClickFlag_6,"
Sql= Sql & "sum(a.ClickFlag_10) ClickFlag_10,"
Sql= Sql & "sum(a.ClickFlag_13) ClickFlag_13,"
Sql= Sql & "sum(a.ClickFlag_14) ClickFlag_14,"
Sql= Sql & "sum(a.ClickFlag_15) ClickFlag_15,"
Sql= Sql & "sum(a.ClickFlag_16) ClickFlag_16,"
Sql= Sql & "sum(a.ClickFlag_27) ClickFlag_27,"
Sql= Sql & "sum(a.ClickFlag_1) ClickFlag_1,"
Sql= Sql & "sum(a.ClickFlag_4) ClickFlag_4,"
Sql= Sql & "sum(a.ClickFlag_11) ClickFlag_11,"
Sql= Sql & "sum(a.ClickFlag_2+a.ClickFlag_3+a.ClickFlag_5+a.ClickFlag_7+a.ClickFlag_8+a.ClickFlag_9+a.ClickFlag_12+a.ClickFlag_17+a.ClickFlag_18+a.ClickFlag_19+a.ClickFlag_20+a.ClickFlag_21+a.ClickFlag_22+a.ClickFlag_23+a.ClickFlag_24+a.ClickFlag_25+a.ClickFlag_26+a.ClickFlag_28+a.ClickFlag_29+a.ClickFlag_30+a.ClickFlag_31+a.ClickFlag_32+a.ClickFlag_33+a.ClickFlag_34+a.ClickFlag_35+a.ClickFlag_36+a.ClickFlag_37+a.ClickFlag_38+a.ClickFlag_39+a.ClickFlag_40+a.ClickFlag_41+a.ClickFlag_42+a.ClickFlag_43+a.ClickFlag_44) ClickFlag_0,"
Sql= Sql & "sum(a.ClickFlag_1+a.ClickFlag_2+a.ClickFlag_3+a.ClickFlag_4+a.ClickFlag_5+a.ClickFlag_6+a.ClickFlag_7+a.ClickFlag_8+a.ClickFlag_9+a.ClickFlag_10+a.ClickFlag_11+a.ClickFlag_12+a.ClickFlag_13+a.ClickFlag_14+a.ClickFlag_15+a.ClickFlag_16+a.ClickFlag_17+a.ClickFlag_18+a.ClickFlag_19+a.ClickFlag_20+a.ClickFlag_21+a.ClickFlag_22+a.ClickFlag_23+a.ClickFlag_24+a.ClickFlag_25+a.ClickFlag_26+a.ClickFlag_27+a.ClickFlag_28+a.ClickFlag_29+a.ClickFlag_30+a.ClickFlag_31+a.ClickFlag_32+a.ClickFlag_33+a.ClickFlag_34+a.ClickFlag_35+a.ClickFlag_36+a.ClickFlag_37+a.ClickFlag_38+a.ClickFlag_39+a.ClickFlag_40+a.ClickFlag_41+a.ClickFlag_42+a.ClickFlag_43+a.ClickFlag_44) ClickFlag_All"
 
 
Sql= Sql & " From CFWztg_ClickFlag_Day a WITH(NOLOCK) inner join CFWztg_AD_Counter_Day b WITH(NOLOCK) on a.username=b.username and a.ad_id=b.ad_id and a.AddDate=b.AddDate where  Datediff(d,a.AddDate,'"&AddDate&"')=0"

If UserName<>"" Then Sql=Sql & " And a.UserName='"&UserName&"'"
If AD_ID<>"" Then Sql=Sql & " And a.Ad_ID="&Ad_ID

 
Set Rs=Conn.Execute(Sql)

%>

<tr class="tr_3"> 
<td>汇总</td>
<td></td>
<td><%=Rs("Click_Counter")%></td>
<td><%=Rs("Click_2_Counter")%></td>
<td><%=Rs("ClickFlag_6")%></td>
<td><%=Rs("ClickFlag_10")%></td>
<td><%=Rs("ClickFlag_27")%></td>
<td><%=Rs("ClickFlag_1")%></td>
<td><%=Rs("ClickFlag_4")%></td>
<td><%=Rs("ClickFlag_13")%></td>
<td><%=Rs("ClickFlag_14")%></td>
<td><%=Rs("ClickFlag_15")%></td>
<td><%=Rs("ClickFlag_16")%></td>
<td><%=Rs("ClickFlag_11")%></td>
<td><%=Rs("ClickFlag_0")%></td>
<td><%=Rs("ClickFlag_All")%></td>
<td></td>
</tr>

  
<%

Sql="Select b.username username ,b.ad_id ad_id,b.Click_Counter Click_Counter,b.Click_2_Counter Click_2_Counter,"

Sql= Sql & "a.ClickFlag_6 ClickFlag_6,"
Sql= Sql & "a.ClickFlag_10 ClickFlag_10,"
Sql= Sql & "a.ClickFlag_13 ClickFlag_13,"
Sql= Sql & "a.ClickFlag_14 ClickFlag_14,"
Sql= Sql & "a.ClickFlag_15 ClickFlag_15,"
Sql= Sql & "a.ClickFlag_16 ClickFlag_16,"
Sql= Sql & "a.ClickFlag_27 ClickFlag_27,"
Sql= Sql & "a.ClickFlag_1 ClickFlag_1,"
Sql= Sql & "a.ClickFlag_4 ClickFlag_4,"
Sql= Sql & "a.ClickFlag_11 ClickFlag_11,"
Sql= Sql & "(a.ClickFlag_2+a.ClickFlag_3+a.ClickFlag_5+a.ClickFlag_7+a.ClickFlag_8+a.ClickFlag_9+a.ClickFlag_12+a.ClickFlag_17+a.ClickFlag_18+a.ClickFlag_19+a.ClickFlag_20+a.ClickFlag_21+a.ClickFlag_22+a.ClickFlag_23+a.ClickFlag_24+a.ClickFlag_25+a.ClickFlag_26+a.ClickFlag_28+a.ClickFlag_29+a.ClickFlag_30+a.ClickFlag_31+a.ClickFlag_32+a.ClickFlag_33+a.ClickFlag_34+a.ClickFlag_35+a.ClickFlag_36+a.ClickFlag_37+a.ClickFlag_38+a.ClickFlag_39+a.ClickFlag_40+a.ClickFlag_41+a.ClickFlag_42+a.ClickFlag_43+a.ClickFlag_44) ClickFlag_0,"
Sql= Sql & "(a.ClickFlag_1+a.ClickFlag_2+a.ClickFlag_3+a.ClickFlag_4+a.ClickFlag_5+a.ClickFlag_6+a.ClickFlag_7+a.ClickFlag_8+a.ClickFlag_9+a.ClickFlag_10+a.ClickFlag_11+a.ClickFlag_12+a.ClickFlag_13+a.ClickFlag_14+a.ClickFlag_15+a.ClickFlag_16+a.ClickFlag_17+a.ClickFlag_18+a.ClickFlag_19+a.ClickFlag_20+a.ClickFlag_21+a.ClickFlag_22+a.ClickFlag_23+a.ClickFlag_24+a.ClickFlag_25+a.ClickFlag_26+a.ClickFlag_27+a.ClickFlag_28+a.ClickFlag_29+a.ClickFlag_30+a.ClickFlag_31+a.ClickFlag_32+a.ClickFlag_33+a.ClickFlag_34+a.ClickFlag_35+a.ClickFlag_36+a.ClickFlag_37+a.ClickFlag_38+a.ClickFlag_39+a.ClickFlag_40+a.ClickFlag_41+a.ClickFlag_42+a.ClickFlag_43+a.ClickFlag_44) ClickFlag_All"
 
 
Sql= Sql & " From CFWztg_ClickFlag_Day a inner join CFWztg_AD_Counter_Day b on a.username=b.username and a.ad_id=b.ad_id and a.AddDate=b.AddDate where  Datediff(d,a.AddDate,'"&AddDate&"')=0"

If UserName<>"" Then Sql=Sql & " And a.UserName='"&UserName&"'"
If AD_ID<>"" Then Sql=Sql & " And a.Ad_ID="&Ad_ID

Sql=Sql&" Order By "&Px&" Desc"
 

 
Set Rs=Conn.Execute(Sql)

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not rs.eof then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 rs.pagesize=50
 totalrs=rs.RecordCount
 totalpage=rs.pageCount
 mypagesize=rs.pagesize
 FixedSize=Rs.PageSize
 rs.absolutepage=page
End If

While Not Rs.Eof And MyPageSize>0
%>
<tr> 
<td style="font-weight:bold;"><%=Rs("UserName")%></td>
<td style="font-weight:bold;"><%=Rs("Ad_ID")%></td>
<td><%=Rs("Click_Counter")%></td>
<td><%=Rs("Click_2_Counter")%></td>
<td><%=Rs("ClickFlag_6")%></td>
<td><%=Rs("ClickFlag_10")%></td>
<td><%=Rs("ClickFlag_27")%></td>
<td><%=Rs("ClickFlag_1")%></td>
<td><%=Rs("ClickFlag_4")%></td>
<td><%=Rs("ClickFlag_13")%></td>
<td><%=Rs("ClickFlag_14")%></td>
<td><%=Rs("ClickFlag_15")%></td>
<td><%=Rs("ClickFlag_16")%></td>
<td><%=Rs("ClickFlag_11")%></td>
<td><%=Rs("ClickFlag_0")%></td>
<td><%=Rs("ClickFlag_All")%></td>
<td>
<a href="?Action=invalidiplist&UserName=<%=Rs("UserName")%>&Ad_ID=<%=Rs("Ad_ID")%>&AddDate=<%=AddDate%>" class="btn_add"><i class="mdi mdi-eye"></i> 无效IP</a>
<a href="?Action=clickflagdetail&UserName=<%=Rs("UserName")%>&Ad_ID=<%=Rs("Ad_ID")%>&AddDate=<%=AddDate%>" class="btn_add"><i class="mdi mdi-eye"></i> 详细</a>
</td>

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