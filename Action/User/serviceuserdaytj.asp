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
StartDate=ChkStr(Request("StartDate"),3):If StartDate="" Then StartDate=Date()
EndDate=ChkStr(Request("EndDate"),3):If EndDate="" Then EndDate=Date()

if IsDate(StartDate) = False Or IsDate(EndDate) = False Or Cdate(StartDate)>Cdate(EndDate) Then Call AlertBack("ʱ���ʽ�д�����һ����������ڱȵڶ������������Ҫ��!",1)


Sql="select username,ServiceUserNick,"

Sql=Sql&"(select IsNull(sum(b1.user_income_cent),0) from CFWztg_AD_Counter_Day b1 where b1.adddate >='"&StartDate&"' and b1.adddate <='"&EndDate&"' and  b1.username in (select b2.username from CFWztg_User b2 where b2.myserviceusername=a.username)) income_cent,"

Sql=Sql&"(select IsNull(sum(c1.ordercent * c1.ordertcrate/100),0) as tccent from CFWztg_AdUser_Order c1 Where c1.addtime >='"&StartDate&"' and c1.addtime <='"&EndDate&"'  And (c1.OrderState=1 or c1.OrderState=3) and c1.username in (select c2.username from CFWztg_User c2 where c2.myserviceusername=a.username)) income_cent_cps"

Sql=Sql&" from CFWztg_User a where serviceuser=1 "


Set Rs = Server.CreateObject("Adodb.RecordSet")
Rs.Open Sql,Conn,1,1
%>
     
<table class="tb_2">
<tr>
<td><span class="title">�ͷ�ҵ��ͳ�� ��<%=StartDate%>��<%=EndDate%></span></td>

</tr>
</table>
     
<table class="tb_1">

  <tr class="tr_1"> 
    <td>�ͷ��û���</td>
    <td>�س�</td>
    <td>CPC,CPV,CPAҵ��</td>
    <td>CPSҵ��</td>
  </tr>
  <%
While Not Rs.Eof
%>
  <tr class="tr_2"> 
    <td><%=Rs("UserName")%></td>
<td>
<%=Rs("ServiceUserNick")%>
</td>
    <td><%=GetTurnCent(Rs("income_cent"))%>Ԫ</td>
    <td><%=GetTurnCent(Rs("income_cent_cps"))%>Ԫ</td>
  </tr>
  <%
Rs.MoveNext
Wend
%>
</table>


<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>";
 searchurl += '&StartDate=' + $('#StartDate').val();
 searchurl += '&EndDate=' + $('#EndDate').val();

 location.href=searchurl;
});

});
</script>

<table class="tb_3"><tr> 
      <td>��ʼ���ڣ�</td>
      <td><input name="StartDate" type="text" id="StartDate" value="<%=StartDate%>" size="10"onclick="fPopCalendar(event,this,this)" onfocus="this.select()"  /></td>
      <td>�������ڣ�</td>
      <td><input name="EndDate" type="text" id="EndDate" value="<%=EndDate%>" size="10"onclick="fPopCalendar(event,this,this)" onfocus="this.select()" /></td>
      <td><input type="submit" name="submit" value="��ѯ" class="btn btn-sm btn-primary" id="search"></td>
	  </tr>
</table>
