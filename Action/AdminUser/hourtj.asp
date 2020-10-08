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

AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then AddDate=CStr(Date)

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
<%Sql="Select AddDate From CFWztg_AD_Counter_Hour Group By AddDate Order By AddDate Desc"
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
      <td>网站主</td>
      <td><input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="10"></td>
      <td>广告ID：</td>
      <td><select id='Ad_ID' name="Ad_ID">
<option value="">所有广告</option>

<%
Sql="Select ID,PlanName From CFWztg_Plan Where PlanState=2"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='-" & Rs("ID")&"'"
 If Ad_ID=Cstr("-" & Rs("ID")) Then Response.Write " selected"
 Response.Write ">广告计划："&Rs("PlanName")&"["&Rs("ID")&"]</option>"
Rs.MoveNext
Wend
Rs.Close

Sql="Select min(b.AdName) as AdName,a.Ad_ID From CFWztg_AD_Counter_Hour a inner join cfwztg_ad b on a.ad_id=b.id Where 1=1 Group By a.Ad_ID Order By a.Ad_ID"
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("Ad_ID")&"'"
 If Ad_ID=CStr(Rs("Ad_ID")) Then Response.Write " selected"
 Response.Write ">"&Rs("AdName")&"["&Rs("Ad_ID")&"]</option>"
Rs.MoveNext
Wend
Rs.Close
%>

</select></td>
      <td><input type="submit" name="search"  id="search" value="查询" class="btn btn-primary"></td>
    </tr>
</table>
  
<%
Sql="Select AddHour,Sum(a.Pv_Counter) As Pv_Counter,Sum(a.Uv_Counter) As Uv_Counter,Sum(a.Display_Counter) As Display_Counter,Sum(a.ClickPv_Counter) As ClickPv_Counter,Sum(a.ClickUv_Counter) As ClickUv_Counter,Sum(a.Click_Counter) As Click_Counter,Sum(a.Reg_Counter) As Reg_Counter,Sum(a.Pv_2_Counter) As Pv_2_Counter,Sum(a.Uv_2_Counter) As Uv_2_Counter,Sum(a.Display_2_Counter) As Display_2_Counter,Sum(a.ClickPv_2_Counter) As ClickPv_2_Counter,Sum(a.ClickUv_2_Counter) As ClickUv_2_Counter,Sum(a.Click_2_Counter) As Click_2_Counter From CFWztg_AD_Counter_Hour a WITH(NOLOCK) inner join cfwztg_ad b WITH(NOLOCK) on a.ad_id=b.id where a.AddDate='"&AddDate&"'"

If UserName<>"" Then Sql=Sql&" And a.UserName='"&UserName&"'"

If Ad_ID="" Then
ElseIf CInt(Ad_ID)<0 Then
 Sql=Sql&"And b.Plan_ID="&Abs(Ad_ID)
Else
 Sql=Sql&"And a.Ad_ID="&Ad_ID
End If

Sql=Sql&" Group By a.AddHour Order By a.AddHour Desc"

Set Rs=Conn.Execute(Sql)
%>

<table class="tb_2">

<tr>
<td>
<div class="explain">
列表里注括号内为显示给广告主的实际未扣点的数字，括号外为显示给网站主的扣过点后的数字</div>
</td>
</tr>
</table>

<table class="tb_1">

  <tr class="tr_1"> 
    <td>小时</td>
    <td>显示PV</td>
    <td>显示UV</td>
    <td>显示IP</td>
    <td>点击PV</td>
    <td>点击UV</td>
    <td>点击IP</td>
    <td>注册数</td>
    <td>点击率</td>
    <td>详细推广记录</td>
  </tr>
  <%
While Not Rs.Eof
I=I+1
%>
  <tr> 
    <td style="font-weight:bold;"><%=Rs("AddHour")%>-<%=Rs("AddHour")+1%></td>
    <td><%=Rs("Pv_Counter")%>(<%=Rs("Pv_2_Counter")%>)</td>
    <td><%=Rs("Uv_Counter")%>(<%=Rs("Uv_2_Counter")%>)</td>
    <td><%=Rs("Display_Counter")%>(<%=Rs("Display_2_Counter")%>)</td>
    <td><%=Rs("ClickPv_Counter")%>(<%=Rs("ClickPv_2_Counter")%>)</td>
    <td><%=Rs("ClickUv_Counter")%>(<%=Rs("ClickUv_2_Counter")%>)</td>
    <td><%=Rs("Click_Counter")%>(<%=Rs("Click_2_Counter")%>)</td>
    <td><%=Rs("Reg_Counter")%></td>
    <td><%=FormatNumber(MyRate2(Rs("Click_Counter"),Rs("Display_Counter")),1,-1,0,0)%>‰</td>
    <td><a href="?Action=lylist&AddDate=<%=AddDate%>" class="btn_add"><i class="mdi mdi-eye"></i> 查看</a></td>
  </tr>
  <%
Rs.MoveNext
Wend
%>

</table>

