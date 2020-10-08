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
SeUserName=ChkStr(Request("SeUserName"),1)
StartDate=ChkStr(Request("StartDate"),3):If StartDate="" Then StartDate=Date()-7
EndDate=ChkStr(Request("EndDate"),3):If EndDate="" Then EndDate=Date()

PageUrl = "?Action="&Action&"&SeUserName="&SeUserName&"&StartDate="&StartDate&"&EndDate="&EndDate

if IsDate(StartDate) = False Or IsDate(EndDate) = False Or Cdate(StartDate)>Cdate(EndDate) Then  Call AlertBack("时间格式有错误或第一个输入的日期比第二个输入的日期要大!",1)
%>


<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>";
 searchurl += '&SeUserName=' + $('#SeUserName').val();
 searchurl += '&StartDate=' + $('#StartDate').val();
 searchurl += '&EndDate=' + $('#EndDate').val();

 location.href=searchurl;
});

});
</script>

     
<table>
<tr>
<td>客服名：<input name="SeUserName" type="text" id="SeUserName" value="<%=SeUserName%>" size="10" /></td>
<td>开始日期：</td>
<td><input name="StartDate" type="text" id="StartDate" value="<%=StartDate%>" size="10"onclick="fPopCalendar(event,this,this)" onfocus="this.select()"  /></td>
<td>结束日期：</td>
<td><input name="EndDate" type="text" id="EndDate" value="<%=EndDate%>" size="10"onclick="fPopCalendar(event,this,this)" onfocus="this.select()" /></td>
<td><input type="submit" name="submit" value="查询" class="btn btn-sm btn-primary" id="search" /></td>

<td>
<%
v1=weekday(date)

Response.write "&nbsp;&nbsp;&nbsp;&nbsp;<a href='?Action="&action&"&StartDate="&date()-1&"&EndDate="&date()-1&"'>昨天</a>"

Response.write "&nbsp;&nbsp;&nbsp;&nbsp;<a href='?Action="&action&"&StartDate="&date()&"&EndDate="&date()&"'>今天</a>"

Response.write "&nbsp;&nbsp;&nbsp;&nbsp;<a href='?Action="&action&"&StartDate="&dateadd("d",1-v1-7,date)&"&EndDate="&dateadd("d",1-v1-1,date)&"'>上周</a>"

Response.write "&nbsp;&nbsp;&nbsp;&nbsp;<a href='?Action="&action&"&StartDate="&dateadd("m",-1,year(date)&"-"&month(date)&"-1")&"&EndDate="&dateadd("d",-1,year(date)&"-"&month(date)&"-1")&"'>上月</a>"

Response.write "&nbsp;&nbsp;&nbsp;&nbsp;<a href='?Action="&action&"&StartDate="&dateadd("d",1-v1,date)&"&EndDate="&date&"'>本周</a>"

Response.write "&nbsp;&nbsp;&nbsp;&nbsp;<a href='?Action="&action&"&StartDate="&year(date)&"-"&month(date)&"-1&EndDate="&date&"'>本月</a>"
%>
</td>

</tr>
</table>

<table class="tb_2">
<tr>
<td>
<span class="title">
客服业绩统计 
<%If SeUserName="" Then Response.write "全部客服"  Else Response.write "客服"&SeUserName%> 
从<%=StartDate%>到<%=EndDate%>
</span>
</td>
</tr>
</table>


<table class="tb_2">
<tr>
<td>
<div class="explain">
提成里括号内的数字为网站主的广告投放业绩多少元钱，括号外为客服的提成多少元钱<br />
如果带日期的记录里客服用户名为空，是指当天所有没有选择客服的网站主的业绩
</div>
</td>
</tr>
</table>


<table class="tb_1">

  
  <tr class="tr_1">
    <td>日期</td>
    <td>客服用户名</td>
    <td>显示PV</td>
    <td>显示UV</td>
    <td>显示IP</td>
    <td>点击PV</td>
    <td>点击UV</td>
    <td>点击IP</td>
    <td>注册数</td>
    <td>订单数</td>
    <td>总提成</td>
    <td>CPC提成</td>
    <td>CPV提成</td>
    <td>CPA提成</td>
    <td>CPS提成</td>
    <td>操作</td>
  </tr>

<%

Sql="select"&chr(10)
Sql=Sql&"max(b.upusername) upusername,"&chr(10)
Sql=Sql&"sum(a.Pv_Counter) Pv_Counter,"&chr(10)
Sql=Sql&"sum(a.Uv_Counter) Uv_Counter,"&chr(10)
Sql=Sql&"sum(a.Display_Counter) Display_Counter,"&chr(10)
Sql=Sql&"sum(a.ClickPv_Counter) ClickPv_Counter,"&chr(10)
Sql=Sql&"sum(a.ClickUv_Counter) ClickUv_Counter,"&chr(10)
Sql=Sql&"sum(a.Click_Counter) Click_Counter,"&chr(10)
Sql=Sql&"sum(a.Reg_Counter) Reg_Counter,"&chr(10)
Sql=Sql&"sum(a.Order_Counter) Order_Counter,"&chr(10)
Sql=Sql&"sum(a.User_Income_Cent) User_Income_Cent,"&chr(10)
Sql=Sql&"sum(a.User_Income_CPC) User_Income_CPC,"&chr(10)
Sql=Sql&"sum(a.User_Income_CPM) User_Income_CPM,"&chr(10)
Sql=Sql&"sum(a.User_Income_CPA) User_Income_CPA,"&chr(10)
Sql=Sql&"sum(a.User_Income_CPS) User_Income_CPS,"&chr(10)
Sql=Sql&"sum(a.SeUser_Income_Cent) SeUser_Income_Cent,"&chr(10)
Sql=Sql&"sum(a.SeUser_Income_CPC) SeUser_Income_CPC,"&chr(10)
Sql=Sql&"sum(a.SeUser_Income_CPM) SeUser_Income_CPM,"&chr(10)
Sql=Sql&"sum(a.SeUser_Income_CPA) SeUser_Income_CPA,"&chr(10)
Sql=Sql&"sum(a.SeUser_Income_CPS) SeUser_Income_CPS"&chr(10)
Sql=Sql&"from CFWztg_AD_Counter_Day a inner join CFWztg_User b on a.username=b.username"&chr(10)

If SeUserName<>"" Then Sql=Sql&" and b.upusername='"&SeUserName&"'"&chr(10)

Sql=Sql&"where a.adddate >='"&StartDate&"' and a.adddate <='"&EndDate&"'"&chr(10)


Set Rs=Conn.Execute(Sql)
%>
 <tr class="tr_3">
     <td>汇总</td>
 
    <td></td>
    <td><%=Rs("Pv_Counter")%></td>
    <td><%=Rs("Uv_Counter")%></td>
    <td><%=Rs("Display_Counter")%></td>
    <td><%=Rs("ClickPv_Counter")%></td>
    <td><%=Rs("ClickUv_Counter")%></td>
    <td><%=Rs("Click_Counter")%></td>
    <td><%=Rs("Reg_Counter")%></td>
    <td><%=Rs("Order_Counter")%></td>
    
<td>￥<%=FormatNumber(Rs("SeUser_Income_Cent"),2,-1,0,0)%><br>(￥<%=FormatNumber(Rs("User_Income_Cent"),2,-1,0,0)%>)</td>
<td>￥<%=FormatNumber(Rs("SeUser_Income_CPC"),2,-1,0,0)%><br>(￥<%=FormatNumber(Rs("User_Income_CPC"),2,-1,0,0)%>)</td>
<td>￥<%=FormatNumber(Rs("SeUser_Income_CPM"),2,-1,0,0)%><br>(￥<%=FormatNumber(Rs("User_Income_CPM"),2,-1,0,0)%>)</td>
<td>￥<%=FormatNumber(Rs("SeUser_Income_CPA"),2,-1,0,0)%><br>(￥<%=FormatNumber(Rs("User_Income_CPA"),2,-1,0,0)%>)</td>
<td>￥<%=FormatNumber(Rs("SeUser_Income_CPS"),2,-1,0,0)%><br>(￥<%=FormatNumber(Rs("User_Income_CPS"),2,-1,0,0)%>)</td>
<td></td>

  </tr>
  
  
<%
Rs.Close

Sql="select"&chr(10)
Sql=Sql&"c.adddate,"&chr(10)
Sql=Sql&"c.upusername,"&chr(10)
Sql=Sql&"sum(c.Pv_Counter) Pv_Counter,"&chr(10)
Sql=Sql&"sum(c.Uv_Counter) Uv_Counter,"&chr(10)
Sql=Sql&"sum(c.Display_Counter) Display_Counter,"&chr(10)
Sql=Sql&"sum(c.ClickPv_Counter) ClickPv_Counter,"&chr(10)
Sql=Sql&"sum(c.ClickUv_Counter) ClickUv_Counter,"&chr(10)
Sql=Sql&"sum(c.Click_Counter) Click_Counter,"&chr(10)
Sql=Sql&"sum(c.Reg_Counter) Reg_Counter,"&chr(10)
Sql=Sql&"sum(c.Order_Counter) Order_Counter,"&chr(10)
Sql=Sql&"sum(c.User_Income_Cent) User_Income_Cent,"&chr(10)
Sql=Sql&"sum(c.User_Income_CPC) User_Income_CPC,"&chr(10)
Sql=Sql&"sum(c.User_Income_CPM) User_Income_CPM,"&chr(10)
Sql=Sql&"sum(c.User_Income_CPA) User_Income_CPA,"&chr(10)
Sql=Sql&"sum(c.User_Income_CPS) User_Income_CPS,"&chr(10)
Sql=Sql&"sum(c.SeUser_Income_Cent) SeUser_Income_Cent,"&chr(10)
Sql=Sql&"sum(c.SeUser_Income_CPC) SeUser_Income_CPC,"&chr(10)
Sql=Sql&"sum(c.SeUser_Income_CPM) SeUser_Income_CPM,"&chr(10)
Sql=Sql&"sum(c.SeUser_Income_CPA) SeUser_Income_CPA,"&chr(10)
Sql=Sql&"sum(c.SeUser_Income_CPS) SeUser_Income_CPS"&chr(10)

Sql=Sql&"from ("&chr(10)
Sql=Sql&"select top 1000"&chr(10)
Sql=Sql&"min(a.adddate) adddate,"&chr(10)
Sql=Sql&"a.username,max(b.upusername) upusername,"&chr(10)
Sql=Sql&"sum(a.Pv_Counter) Pv_Counter,"&chr(10)
Sql=Sql&"sum(a.Uv_Counter) Uv_Counter,"&chr(10)
Sql=Sql&"sum(a.Display_Counter) Display_Counter,"&chr(10)
Sql=Sql&"sum(a.ClickPv_Counter) ClickPv_Counter,"&chr(10)
Sql=Sql&"sum(a.ClickUv_Counter) ClickUv_Counter,"&chr(10)
Sql=Sql&"sum(a.Click_Counter) Click_Counter,"&chr(10)
Sql=Sql&"sum(a.Reg_Counter) Reg_Counter,"&chr(10)
Sql=Sql&"sum(a.Order_Counter) Order_Counter,"&chr(10)
Sql=Sql&"sum(a.User_Income_Cent) User_Income_Cent,"&chr(10)
Sql=Sql&"sum(a.User_Income_CPC) User_Income_CPC,"&chr(10)
Sql=Sql&"sum(a.User_Income_CPM) User_Income_CPM,"&chr(10)
Sql=Sql&"sum(a.User_Income_CPA) User_Income_CPA,"&chr(10)
Sql=Sql&"sum(a.User_Income_CPS) User_Income_CPS,"&chr(10)
Sql=Sql&"sum(a.SeUser_Income_Cent) SeUser_Income_Cent,"&chr(10)
Sql=Sql&"sum(a.SeUser_Income_CPC) SeUser_Income_CPC,"&chr(10)
Sql=Sql&"sum(a.SeUser_Income_CPM) SeUser_Income_CPM,"&chr(10)
Sql=Sql&"sum(a.SeUser_Income_CPA) SeUser_Income_CPA,"&chr(10)
Sql=Sql&"sum(a.SeUser_Income_CPS) SeUser_Income_CPS"&chr(10)
Sql=Sql&"from CFWztg_AD_Counter_Day a inner join CFWztg_User b on a.username=b.username"&chr(10)

If SeUserName<>"" Then Sql=Sql&" and b.upusername='"&SeUserName&"'"&chr(10)

Sql=Sql&"where a.adddate >='"&StartDate&"' and a.adddate <='"&EndDate&"'"&chr(10)
Sql=Sql&"group by a.adddate,a.username) c group by c.upusername,c.adddate order by AddDate Desc,SeUser_Income_Cent desc"&chr(10)



Set Rs = Server.CreateObject("Adodb.RecordSet")
Rs.Open Sql,Conn,1,1

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not rs.eof then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 rs.pagesize=20
 totalrs=rs.RecordCount
 totalpage=rs.pageCount
 mypagesize=rs.pagesize
 FixedSize=Rs.PageSize
 rs.absolutepage=page
End If


While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2"> 
    <td><%=Rs("AddDate")%></td>
    <td><%=Rs("UpUserName")%></td>
    <td><%=Rs("Pv_Counter")%></td>
    <td><%=Rs("Uv_Counter")%></td>
    <td><%=Rs("Display_Counter")%></td>
    <td><%=Rs("ClickPv_Counter")%></td>
    <td><%=Rs("ClickUv_Counter")%></td>
    <td><%=Rs("Click_Counter")%></td>
    <td><%=Rs("Reg_Counter")%></td>
    <td><%=Rs("Order_Counter")%></td>
    
<td><%=GetTurnCent(Rs("SeUser_Income_Cent"))%><br>(<%=GetTurnCent(Rs("User_Income_Cent"))%>)</td>
<td><%=GetTurnCent(Rs("SeUser_Income_CPC"))%><br>(<%=GetTurnCent(Rs("User_Income_CPC"))%>)</td>
<td><%=GetTurnCent(Rs("SeUser_Income_CPM"))%><br>(<%=GetTurnCent(Rs("User_Income_CPM"))%>)</td>
<td><%=GetTurnCent(Rs("SeUser_Income_CPA"))%><br>(<%=GetTurnCent(Rs("User_Income_CPA"))%>)</td>
<td><%=GetTurnCent(Rs("SeUser_Income_CPS"))%><br>(<%=GetTurnCent(Rs("User_Income_CPS"))%>)</td>
<td>
<%if Rs("UpUserName")<>"" Then%>
<a href="?Action=seuserscoredetail&SeUserName=<%=Rs("UpUserName")%>&AddDate=<%=Rs("AddDate")%>">详细</a>
<%End If%>
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
