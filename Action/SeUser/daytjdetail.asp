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

<a href="?Action=daytj" class="actionBtn" style="margin-top:10px;"><i class="mdi mdi-keyboard-return"></i>�����б�</a>
<table class="tb_2">
<tr>
<td><span class="title">��վ�� <%=UserName%> �� <%=AddDate%> ���й��</span></td>

</tr>
</table>


<table class="tb_2">
<tr>
<td>
<div class="explain">
����������ڵ�����Ϊ��վ���Ĺ��Ͷ��ҵ������ԪǮ��������Ϊ�ͷ�����ɶ���ԪǮ
</div>
</td>
</tr>
</table>


<table class="tb_1">
  <tr class="tr_1"> 
    <td>��վ��</td>
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


