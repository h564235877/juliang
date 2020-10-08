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
AddDate=ChkStr(Request("AddDate"),3)

If UserName="" Or IsDate(AddDate) = False Then Call AlertBack("缺少参数!",1)


Sql="select"&chr(10)
Sql=Sql&"d.username,d.ad_id,max(d.adname) adname,"&chr(10)
Sql=Sql&"sum(d.Pv_Counter) Pv_Counter,"&chr(10)
Sql=Sql&"sum(d.Uv_Counter) Uv_Counter,"&chr(10)
Sql=Sql&"sum(d.Display_Counter) Display_Counter,"&chr(10)
Sql=Sql&"sum(d.ClickPv_Counter) ClickPv_Counter,"&chr(10)
Sql=Sql&"sum(d.ClickUv_Counter) ClickUv_Counter,"&chr(10)
Sql=Sql&"sum(d.Click_Counter) Click_Counter,"&chr(10)
Sql=Sql&"sum(d.Reg_Counter) Reg_Counter,"&chr(10)
Sql=Sql&"sum(d.Order_Counter) Order_Counter,"&chr(10)
Sql=Sql&"sum(d.User_Income_Cent) User_Income_Cent,"&chr(10)
Sql=Sql&"sum(d.User_Income_CPC) User_Income_CPC,"&chr(10)
Sql=Sql&"sum(d.User_Income_CPM) User_Income_CPM,"&chr(10)
Sql=Sql&"sum(d.User_Income_CPA) User_Income_CPA,"&chr(10)
Sql=Sql&"sum(d.User_Income_CPS) User_Income_CPS,"&chr(10)
Sql=Sql&"sum(d.SeUser_Income_Cent) SeUser_Income_Cent,"&chr(10)
Sql=Sql&"sum(d.SeUser_Income_CPC) SeUser_Income_CPC,"&chr(10)
Sql=Sql&"sum(d.SeUser_Income_CPM) SeUser_Income_CPM,"&chr(10)
Sql=Sql&"sum(d.SeUser_Income_CPA) SeUser_Income_CPA,"&chr(10)
Sql=Sql&"sum(d.SeUser_Income_CPS) SeUser_Income_CPS"&chr(10)

Sql=Sql&"from ("&chr(10)
Sql=Sql&"select top 1000"&chr(10)
Sql=Sql&"a.username,a.ad_id,max(c.adname) adname,max(b.upusername) upusername,"&chr(10)
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
Sql=Sql&"from CFWztg_AD_Counter_Day a inner join CFWztg_User b on a.username=b.username inner join cfwztg_ad c on a.ad_id=c.id"&chr(10)
Sql=Sql&"where a.adddate='"& AddDate&"' And a.Username='"&Username&"' and b.upusername='"&SeUserName&"'"&chr(10)
Sql=Sql&"group by a.username,a.ad_id) d group by d.username,d.ad_id order by SeUser_Income_Cent desc"&chr(10)


Set Rs = Server.CreateObject("Adodb.RecordSet")
Rs.Open Sql,Conn,1,1
%>

<a href="?Action=daytj" class="actionBtn" style="margin-top:10px;"><i class="mdi mdi-keyboard-return"></i>返回列表</a>
<table class="tb_2">
<tr>
<td><span class="title">网站主 <%=UserName%> 在 <%=AddDate%> 所有广告</span></td>

</tr>
</table>


<table class="tb_2">
<tr>
<td>
<div class="explain">
提成里括号内的数字为网站主的广告投放业绩多少元钱，括号外为客服的提成多少元钱
</div>
</td>
</tr>
</table>


<table class="tb_1">
  <tr class="tr_1"> 
    <td>网站主</td>
    <td>广告ID</td>
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
  </tr>
  <%
While Not Rs.Eof
%>
  <tr class="tr_2"> 
    <td><%=Rs("UserName")%></td>
    <td><%=Rs("adname")&"["&Rs("Ad_ID")&"]"%></td>
    <td><%=Rs("Pv_Counter")%></td>
    <td><%=Rs("Uv_Counter")%></td>
    <td><%=Rs("Display_Counter")%></td>
    <td><%=Rs("ClickPv_Counter")%></td>
    <td><%=Rs("ClickUv_Counter")%></td>
    <td><%=Rs("Click_Counter")%></td>
    <td><%=Rs("Reg_Counter")%></td>
    <td><%=Rs("Order_Counter")%></td>
    
<td><%=GetTurnCent(Rs("SeUser_Income_Cent"))%>(<%=GetTurnCent(Rs("User_Income_Cent"))%>)</td>
<td><%=GetTurnCent(Rs("SeUser_Income_CPC"))%>(<%=GetTurnCent(Rs("User_Income_CPC"))%>)</td>
<td><%=GetTurnCent(Rs("SeUser_Income_CPM"))%>(<%=GetTurnCent(Rs("User_Income_CPM"))%>)</td>
<td><%=GetTurnCent(Rs("SeUser_Income_CPA"))%>(<%=GetTurnCent(Rs("User_Income_CPA"))%>)</td>
<td><%=GetTurnCent(Rs("SeUser_Income_CPS"))%>(<%=GetTurnCent(Rs("User_Income_CPS"))%>)</td>


  </tr>
  <%
Rs.MoveNext
Wend
%>
</table>


