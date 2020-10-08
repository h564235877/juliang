<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>


<%If Action="inputdata" Then%>

<script>
$(function(){

$("#submit").click(function(){

if($('#ad_id').val()==""){
 alert('没有选择广告', '', function () {$("#ad_id").focus();});
 return false;
}

if($('#adddate').val()==""){
 alert('没有填写日期', '', function () {$("#adddate").focus();});
 return false;
}

if(isDate($('#adddate').val())==false){
 alert('填写日期格式错误', '', function () {$("#adddate").focus();});
 return false;
}

if($('#username').val()==""){
 alert('没有填写网站主', '', function () {$("#username").focus();});
 return false;
}

if($('#RndRate').val()==""){
 alert('没有填写正负随机量', '', function () {$("#RndRate").focus();});
 return false;
}

if($('#RndRate').val()<0||$('#RndRate').val()>1000){
 alert('填写正负随机量必须>=0且<=1000', '', function () {$("#RndRate").focus();});
 return false;
}

return true;

});

});

</script> 


<form name="form4" method="post" action="?Action=inputdataconfirm">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2"><strong>第一步填写导入数据</strong></td>
</tr>
<tr>
<td class="td_r">选择广告：</td>
<td>
<select id='ad_id' name='ad_id'>
<option value="">选择广告</option>
<%
Sql="Select AdName,ID,Unit_Cent,clickstate From CFWztg_AD Where (clickstate=1 or clickstate=2 or clickstate=3) Order By ID"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("ID")&"'"
 Response.Write ">"&Rs("AdName")
 Response.write "[广告ID:"&Rs("ID")&"]"
 Response.write "[广告单价:"&GetTurnCent(Rs("Unit_Cent"))&"元]"
 If Rs("clickstate")=1 Then
  Response.write "[点击获利]"
 ElseIf Rs("clickstate")=2 Then
  Response.write "[显示获利]"
 ElseIf Rs("clickstate")=3 Then
  Response.write "[注册获利]"
 End If
 Response.write "</option>"
Rs.MoveNext
Wend
%>
</select>
*
</td>
</tr>
  
<tr>
<td class="td_r">录入数据在哪天：</td>
<td><input name="adddate" type="text" id="adddate" value="1970-01-01">*(格式如:2000-01-01,如填写1970-01-01则表示执行当天)</td>
</tr>
<tr> 

<tr>
<td class="td_r">给哪个网站主：</td>
<td><input name="username" type="text" id="username" value="">
*</td>
</tr>
<tr> 
<td class="td_r">显示量Pv_Counter新加多少：</td>
<td><input name="Pv_Counter" type="text" id="Pv_Counter" value=""></td>
</tr>
<tr> 
<td class="td_r">显示量Uv_Counter新加多少：</td>
<td><input name="Uv_Counter" type="text" id="Uv_Counter" value=""></td>
</tr>
<tr> 
<td class="td_r">显示量Display_Counter新加多少：</td>
<td><input name="Display_Counter" type="text" id="Display_Counter" value="">显示计费的值</td>
</tr>
<tr> 
<td class="td_r">点击量ClickPv_Counter新加多少：</td>
<td><input name="ClickPv_Counter" type="text" id="ClickPv_Counter" value=""></td>
</tr>
<tr> 
<td class="td_r">点击量ClickUv_Counter新加多少：</td>
<td><input name="ClickUv_Counter" type="text" id="ClickUv_Counter" value=""></td>
</tr>
<tr> 
<td class="td_r">点击量Click_Counter新加多少：</td>
<td><input name="Click_Counter" type="text" id="Click_Counter" value="">点击计费的值</td>
</tr>
<tr> 
<td class="td_r">注册量Reg_Counter新加多少：</td>
<td><input name="Reg_Counter" type="text" id="Reg_Counter" value="">注册计费的值</td>
</tr>
<tr>
  <td class="td_r">正负随机量：</td>
<td><input name="RndRate" type="text" id="RndRate" value="0">
‰(在填写的基数上，上下千分之几浮动，0则不浮动)</td>
</tr>
<tr> 
<td>&nbsp;</td>
<td><input type="submit" name="submit" id="submit" value="确认进入第二步" class="btn btn-primary">
</td>
</tr>
</table>
</form>

<%End If%>


<%If Action="inputdataconfirm" Then%>
<%
ad_id=ChkStr(Request("ad_id"),2)
adddate=ChkStr(Request("adddate"),3)
username=ChkStr(Request("username"),1)
Pv_Counter=ChkStr(Request("Pv_Counter"),2)
Uv_Counter=ChkStr(Request("Uv_Counter"),2)
Display_Counter=ChkStr(Request("Display_Counter"),2)
ClickPv_Counter=ChkStr(Request("ClickPv_Counter"),2)
ClickUv_Counter=ChkStr(Request("ClickUv_Counter"),2)
Click_Counter=ChkStr(Request("Click_Counter"),2)
Reg_Counter=ChkStr(Request("Reg_Counter"),2)
RndRate=ChkStr(Request("RndRate"),2)

If ad_id="" Then Call AlertBack("没有选择广告",1)
If adddate="" Then Call AlertBack("没有填写日期",1)
If username="" Then Call AlertBack("没有填写网站主",1)
If RndRate<0 Or RndRate>1000 Then Call AlertBack("随机浮动率需在0-1000之间",1)

If Pv_Counter="" Then Pv_Counter=0
If Uv_Counter="" Then Uv_Counter=0
If Display_Counter="" Then Display_Counter=0
If ClickPv_Counter="" Then ClickPv_Counter=0
If ClickUv_Counter="" Then ClickUv_Counter=0
If Click_Counter="" Then Click_Counter=0
If Reg_Counter="" Then Reg_Counter=0
If RndRate="" Then RndRate=0

Set Rs= Server.CreateObject("ADODB.Recordset")
Sql="Select Count(1) From CFWztg_User Where UserName='"&UserName&"' And UserType=1"
Rs.Open Sql,Conn,3,2
IF Rs(0)=0 Then Call AlertBack("此网站主并不存在",1)
%>
<br>
<form name="form4" method="post" action="../../index.asp?Action=inputdatasave&saveid=0">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2"><strong>第二步确认导入数据</strong></td>
</tr>
<tr>
<td class="td_r">选择的广告：</td>
<td>
<select id='ad_id' name='ad_id'>
<%
Sql="Select AdName,ID,Unit_Cent,clickstate From CFWztg_AD Where ID="&ad_id
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("ID")&"'"
 Response.Write ">"&Rs("AdName")
 Response.write "[广告ID:"&Rs("ID")&"]"
 Response.write "[广告单价:"&GetTurnCent(Rs("Unit_Cent"))&"元]"
 If Rs("clickstate")=1 Then
  Response.write "[点击获利]"
 ElseIf Rs("clickstate")=2 Then
  Response.write "[显示获利]"
 ElseIf Rs("clickstate")=3 Then
  Response.write "[注册获利]"
 End If
 Response.write "</option>"
 
Unit_Cent=CDBL(Rs("Unit_Cent"))
clickstate=Rs("clickstate")

Rs.MoveNext
Wend
%>
</select>
</td>
</tr>

<tr>
<td class="td_r">录入数据在哪天：</td>
<td><input name="adddate" type="text" id="adddate" value="<%=adddate%>" readonly>(格式如:2000-01-01,如填写1970-01-01则表示执行当天)</td>
</tr>
<tr> 

<tr>
<td class="td_r">给哪个网站主：</td>
<td><input name="username" type="text" id="username" value="<%=username%>" readonly>
</td>
</tr>
<tr> 
<td class="td_r">显示量Pv_Counter新加多少：</td>
<td><input name="Pv_Counter" type="text" id="Pv_Counter" value="<%=Pv_Counter%>" readonly></td>
</tr>
<tr> 
<td class="td_r">显示量Uv_Counter新加多少：</td>
<td><input name="Uv_Counter" type="text" id="Uv_Counter" value="<%=Uv_Counter%>" readonly></td>
</tr>
<tr> 
<td class="td_r">显示量Display_Counter新加多少：</td>
<td><input name="Display_Counter" type="text" id="Display_Counter" value="<%=Display_Counter%>" readonly>显示计费的值</td>
</tr>
<tr> 
<td class="td_r">点击量ClickPv_Counter新加多少：</td>
<td><input name="ClickPv_Counter" type="text" id="ClickPv_Counter" value="<%=ClickPv_Counter%>" readonly></td>
</tr>
<tr> 
<td class="td_r">点击量ClickUv_Counter新加多少：</td>
<td><input name="ClickUv_Counter" type="text" id="ClickUv_Counter" value="<%=ClickUv_Counter%>" readonly></td>
</tr>
<tr> 
<td class="td_r">点击量ClickPv_Counter新加多少：</td>
<td><input name="Click_Counter" type="text" id="Click_Counter" value="<%=Click_Counter%>" readonly>点击计费的值</td>
</tr>
<tr> 
<td class="td_r">注册量Reg_Counter新加多少：</td>
<td><input name="Reg_Counter" type="text" id="Reg_Counter" value="<%=Reg_Counter%>" readonly>注册计费的值</td>
</tr>
<tr>
<td class="td_r">正负随机量：</td>
<td><input name="RndRate" type="text" id="RndRate" value="<%=RndRate%>">
‰(在填写的基数上，上下千分之几浮动，0则不浮动)</td>
</tr>
<tr> 
<td></td>
<td>
<input name="CheckCode" type="hidden" id="CheckCode" value="<%=Md5(ad_id&adddate&username&SysCode,2)%>">
<input type="submit" name="submit" value="确认立即执行" class="btn btn-primary" onClick="return confirm('确定要立即执行吗?')">  <a href="?Action=inputdata" style="margin-left:20px;">取消返回</a></td>
</tr>

<tr> 
<td>&nbsp;</td>
<td>或复制下面的链接在浏览器中打开执行或在计划任务中执行(注:saveid值为0时链接可以多次打开执行多次，其它同一数值只能执行一次，需在管理员已登录状态下才能生效):<br>
<textarea name="rec1" cols="60" rows="5">http://<%=HttpPath(1)%>/index.asp?Action=inputdatasave&saveid=0&ad_id=<%=ad_id%>&adddate=<%=adddate%>&username=<%=username%>&Pv_Counter=<%=Pv_Counter%>&Uv_Counter=<%=Uv_Counter%>&Display_Counter=<%=Display_Counter%>&ClickPv_Counter=<%=ClickPv_Counter%>&ClickUv_Counter=<%=ClickUv_Counter%>&Click_Counter=<%=Click_Counter%>&Reg_Counter=<%=Reg_Counter%>&RndRate=<%=RndRate%>&CheckCode=<%=Md5(ad_id&adddate&username&SysCode,2)%>
</textarea> 
</td>
</tr>

</table>
</form>


<table class="tb_1">
<tr class="tr_1"> 
<td colspan="13"><strong>旧数据和新数据情况,括号外为网站主的数据,括号内为广告主的数据</strong></td>
</tr>
<tr> 
<td>旧新数据</td>
<td>广告ID</td>
<td>日　期</td>
<td>网站主</td>
<td>显示PV</td>
<td>显示UV</td>
<td>显示IP</td>
<td>点击PV</td>
<td>点击UV</td>
<td>点击IP</td>
<td>注册数</td>
<td>网站主收入</td>
<td>广告主花费</td>
<td>&nbsp;</td>
</tr>
<%
Sql="Select b.AdName,b.plan_id,b.Unit_Cent,b.clickstate,c.planname,a.UserName,a.Ad_ID"

Sql=Sql&",a.Pv_Counter,a.Uv_Counter,a.Display_Counter,a.ClickPv_Counter,a.ClickUv_Counter,a.Click_Counter,a.Reg_Counter,a.Order_Counter"
Sql=Sql&",a.Reg_Counter,a.Pv_2_Counter,a.Uv_2_Counter,a.Display_2_Counter,a.ClickPv_2_Counter,a.ClickUv_2_Counter,a.Click_2_Counter,a.Reg_2_Counter,a.Order_2_Counter"
Sql=Sql&",a.User_Income_Cent,a.User_Income_CPC,a.User_Income_CPM,a.User_Income_CPA,a.User_Income_CPS"
Sql=Sql&",a.SeUser_Income_Cent,a.SeUser_Income_CPC,a.SeUser_Income_CPM,a.SeUser_Income_CPA,a.SeUser_Income_CPS"
Sql=Sql&",a.AdUser_Spend_Cent,a.AdUser_Spend_CPC,a.AdUser_Spend_CPM,a.AdUser_Spend_CPA,a.AdUser_Spend_CPS"
Sql=Sql&",a.CoUser_Income_Cent,a.CoUser_Income_CPC,a.CoUser_Income_CPM,a.CoUser_Income_CPA,a.CoUser_Income_CPS"
Sql=Sql&" From CFWztg_AD_Counter_Day a inner join cfwztg_ad b on a.ad_id=b.id inner join cfwztg_plan c on b.plan_id=c.id Where 1=1"
Sql=Sql&" And a.ad_id="&ad_id&" And a.AddDate='"&AddDate&"' And a.username='"&username&"'"



Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

if Not Rs.Eof Then
a_AdName=Rs("AdName")
a_Pv_Counter=Rs("Pv_Counter")
a_Uv_Counter=Rs("Uv_Counter")
a_Display_Counter=Rs("Display_Counter")
a_ClickPv_Counter=Rs("ClickPv_Counter")
a_ClickUv_Counter=Rs("ClickUv_Counter")
a_Click_Counter=Rs("Click_Counter")
a_Reg_Counter=Rs("Reg_Counter")

b_Pv_Counter=Rs("Pv_2_Counter")
b_Uv_Counter=Rs("Uv_2_Counter")
b_Display_Counter=Rs("Display_2_Counter")
b_ClickPv_Counter=Rs("ClickPv_2_Counter")
b_ClickUv_Counter=Rs("ClickUv_2_Counter")
b_Click_Counter=Rs("Click_2_Counter")
b_Reg_Counter=Rs("Reg_2_Counter")

a_User_Income_Cent=CDBL(Rs("User_Income_Cent"))
a_AdUser_Spend_Cent=CDBL(Rs("AdUser_Spend_Cent"))

Else
a_AdName="无数据"
a_Pv_Counter=0
a_Uv_Counter=0
a_Display_Counter=0
a_ClickPv_Counter=0
a_ClickUv_Counter=0
a_Click_Counter=0
a_Reg_Counter=0

b_Pv_Counter=0
b_Uv_Counter=0
b_Display_Counter=0
b_ClickPv_Counter=0
b_ClickUv_Counter=0
b_Click_Counter=0
b_Reg_Counter=0

a_User_Income_Cent=0
a_AdUser_Spend_Cent=0



End If


If clickstate=1 Then
Add_Cent=Unit_Cent*Click_Counter
ElseIf clickstate=2 Then
Add_Cent=Unit_Cent*Display_Counter
ElseIf clickstate=3 Then
Add_Cent=Unit_Cent*Reg_Counter
End If
%>

<tr> 
<td>旧数据-></td>
<td><%Response.write a_AdName&"["&Ad_ID&"]"%></td>
<td><%=adddate%></td>
<td><%=username%></td>
<td><%=a_Pv_Counter%>(<%=b_Pv_Counter%>)</td>
<td><%=a_Uv_Counter%>(<%=b_Uv_Counter%>)</td>
<td><%=a_Display_Counter%>(<%=b_Display_Counter%>)</td>
<td><%=a_ClickPv_Counter%>(<%=b_ClickPv_Counter%>)</td>
<td><%=a_ClickUv_Counter%>(<%=b_ClickUv_Counter%>)</td>
<td><%=a_Click_Counter%>(<%=b_Click_Counter%>)</td>
<td><%=a_Reg_Counter%>(<%=b_Reg_Counter%>)</td>
<td><%=GetTurnCent(a_User_Income_Cent)%></td>	
<td><%=GetTurnCent(a_AdUser_Spend_Cent)%></td>
</tr>


<tr> 
<td>新数据-></td>
<td><%Response.write a_AdName&"["&Ad_ID&"]"%></td>
<td><%=adddate%></td>
<td><%=username%></td>
<td><%=a_Pv_Counter+Pv_Counter%>(<%=b_Pv_Counter+Pv_Counter%>)</td>
<td><%=a_Uv_Counter+Uv_Counter%>(<%=b_Uv_Counter+Uv_Counter%>)</td>
<td><%=a_Display_Counter+Display_Counter%>(<%=b_Display_Counter+Display_Counter%>)</td>
<td><%=a_ClickPv_Counter+ClickPv_Counter%>(<%=b_ClickPv_Counter+ClickPv_Counter%>)</td>
<td><%=a_ClickUv_Counter+ClickUv_Counter%>(<%=b_ClickUv_Counter+ClickUv_Counter%>)</td>
<td><%=a_Click_Counter+Click_Counter%>(<%=b_Click_Counter+Click_Counter%>)</td>
<td><%=a_Reg_Counter+Reg_Counter%>(<%=b_Reg_Counter+Reg_Counter%>)</td>
<td><%=GetTurnCent(a_User_Income_Cent+Add_Cent)%></td>	
<td><%=GetTurnCent(a_AdUser_Spend_Cent+Add_Cent)%></td>
</tr>

</table>  
<%End If%>