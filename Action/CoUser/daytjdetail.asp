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
UserName=ChkStr(Request("UserName"),1)
AddDate=ChkStr(Request("AddDate"),3)

If UserName="" Or IsDate(AddDate) = False Then Call AlertBack("ȱ�ٲ���!",1)

Sql="select"&chr(10)
Sql=Sql&"c.adusername,c.ad_id,max(adname) adname,"&chr(10)
Sql=Sql&"sum(c.Pv_2_Counter) Pv_2_Counter,"&chr(10)
Sql=Sql&"sum(c.Uv_2_Counter) Uv_2_Counter,"&chr(10)
Sql=Sql&"sum(c.Display_2_Counter) Display_2_Counter,"&chr(10)
Sql=Sql&"sum(c.ClickPv_2_Counter) ClickPv_2_Counter,"&chr(10)
Sql=Sql&"sum(c.ClickUv_2_Counter) ClickUv_2_Counter,"&chr(10)
Sql=Sql&"sum(c.Click_2_Counter) Click_2_Counter,"&chr(10)
Sql=Sql&"sum(c.Reg_2_Counter) Reg_2_Counter,"&chr(10)
Sql=Sql&"sum(c.Order_2_Counter) Order_2_Counter,"&chr(10)
Sql=Sql&"sum(c.AdUser_Spend_Cent) AdUser_Spend_Cent,"&chr(10)
Sql=Sql&"sum(c.AdUser_Spend_CPC) AdUser_Spend_CPC,"&chr(10)
Sql=Sql&"sum(c.AdUser_Spend_CPM) AdUser_Spend_CPM,"&chr(10)
Sql=Sql&"sum(c.AdUser_Spend_CPA) AdUser_Spend_CPA,"&chr(10)
Sql=Sql&"sum(c.AdUser_Spend_CPS) AdUser_Spend_CPS,"&chr(10)
Sql=Sql&"sum(c.CoUser_Income_Cent) CoUser_Income_Cent,"&chr(10)
Sql=Sql&"sum(c.CoUser_Income_CPC) CoUser_Income_CPC,"&chr(10)
Sql=Sql&"sum(c.CoUser_Income_CPM) CoUser_Income_CPM,"&chr(10)
Sql=Sql&"sum(c.CoUser_Income_CPA) CoUser_Income_CPA,"&chr(10)
Sql=Sql&"sum(c.CoUser_Income_CPS) CoUser_Income_CPS"&chr(10)
Sql=Sql&"from ("&chr(10)
Sql=Sql&"select top 1000"&chr(10)
Sql=Sql&"b.adusername,a.ad_id,max(adname) adname,"&chr(10)
Sql=Sql&"sum(a.Pv_2_Counter) Pv_2_Counter,"&chr(10)
Sql=Sql&"sum(a.Uv_2_Counter) Uv_2_Counter,"&chr(10)
Sql=Sql&"sum(a.Display_2_Counter) Display_2_Counter,"&chr(10)
Sql=Sql&"sum(a.ClickPv_2_Counter) ClickPv_2_Counter,"&chr(10)
Sql=Sql&"sum(a.ClickUv_2_Counter) ClickUv_2_Counter,"&chr(10)
Sql=Sql&"sum(a.Click_2_Counter) Click_2_Counter,"&chr(10)
Sql=Sql&"sum(a.Reg_2_Counter) Reg_2_Counter,"&chr(10)
Sql=Sql&"sum(a.Order_2_Counter) Order_2_Counter,"&chr(10)
Sql=Sql&"sum(a.AdUser_Spend_Cent) AdUser_Spend_Cent,"&chr(10)
Sql=Sql&"sum(a.AdUser_Spend_CPC) AdUser_Spend_CPC,"&chr(10)
Sql=Sql&"sum(a.AdUser_Spend_CPM) AdUser_Spend_CPM,"&chr(10)
Sql=Sql&"sum(a.AdUser_Spend_CPA) AdUser_Spend_CPA,"&chr(10)
Sql=Sql&"sum(a.AdUser_Spend_CPS) AdUser_Spend_CPS,"&chr(10)
Sql=Sql&"sum(a.CoUser_Income_Cent) CoUser_Income_Cent,"&chr(10)
Sql=Sql&"sum(a.CoUser_Income_CPC) CoUser_Income_CPC,"&chr(10)
Sql=Sql&"sum(a.CoUser_Income_CPM) CoUser_Income_CPM,"&chr(10)
Sql=Sql&"sum(a.CoUser_Income_CPA) CoUser_Income_CPA,"&chr(10)
Sql=Sql&"sum(a.CoUser_Income_CPS) CoUser_Income_CPS"&chr(10)
Sql=Sql&"from CFWztg_AD_Counter_Day a inner join CFWztg_AD b on a.ad_id=b.id"&chr(10)
Sql=Sql&"where a.adddate ='"&AddDate&"'"&chr(10)
Sql=Sql&"group by b.adusername,a.ad_id) c  inner join CFWztg_User d on c.adusername=d.username and d.upusername='"&CoUserName&"'"&chr(10)

Sql=Sql&" and d.username='"&UserName&"'"&chr(10)

Sql=Sql&"group by c.adusername,c.ad_id order by CoUser_Income_Cent desc"&chr(10)


Set Rs = Server.CreateObject("Adodb.RecordSet")
Rs.Open Sql,Conn,1,1
%>


<a href="?Action=daytj" class="actionBtn" style="margin-top:10px;"><i class="mdi mdi-keyboard-return"></i>�����б�</a>
<table class="tb_2">
<tr>
<td><span class="title">����� <%=UserName%> �� <%=AddDate%> ���й��</span></td>

</tr>
</table>


<table class="tb_2">
<tr>
<td>
<div class="explain">
����������ڵ�����Ϊ������Ĺ�����Ķ���ԪǮ��������Ϊ�������ɶ���ԪǮ
</div>
</td>
</tr>
</table>


<table class="tb_1">
  <tr class="tr_1"> 
    <td>�����</td>
    <td>���ID</td>
    <td>��ʾPV</td>
    <td>��ʾUV</td>
    <td>��ʾIP</td>
    <td>���PV</td>
    <td>���UV</td>
    <td>���IP</td>
    <td>ע����</td>
    <td>������</td>
    <td>�����</td>
    <td>CPC���</td>
    <td>CPV���</td>
    <td>CPA���</td>
    <td>CPS���</td>
  </tr>
<%
While Not Rs.Eof
%>
  <tr class="tr_2"> 
    <td><%=Rs("AdUserName")%></td>
    <td><%=Rs("adname")&"["&Rs("Ad_ID")&"]"%></td>
    <td><%=Rs("Pv_2_Counter")%></td>
    <td><%=Rs("Uv_2_Counter")%></td>
    <td><%=Rs("Display_2_Counter")%></td>
    <td><%=Rs("ClickPv_2_Counter")%></td>
    <td><%=Rs("ClickUv_2_Counter")%></td>
    <td><%=Rs("Click_2_Counter")%></td>
    <td><%=Rs("Reg_2_Counter")%></td>
    <td><%=Rs("Order_2_Counter")%></td>
    
<td><%=GetTurnCent(Rs("CoUser_Income_Cent"))%>(<%=GetTurnCent(Rs("AdUser_Spend_Cent"))%>)</td>
<td><%=GetTurnCent(Rs("CoUser_Income_CPC"))%>(<%=GetTurnCent(Rs("AdUser_Spend_CPC"))%>)</td>
<td><%=GetTurnCent(Rs("CoUser_Income_CPM"))%>(<%=GetTurnCent(Rs("AdUser_Spend_CPM"))%>)</td>
<td><%=GetTurnCent(Rs("CoUser_Income_CPA"))%>(<%=GetTurnCent(Rs("AdUser_Spend_CPA"))%>)</td>
<td><%=GetTurnCent(Rs("CoUser_Income_CPS"))%>(<%=GetTurnCent(Rs("AdUser_Spend_CPS"))%>)</td>


</tr>
<%
Rs.MoveNext
Wend
%>
</table>


