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
StartDate=ChkStr(Request("StartDate"),3):If StartDate="" Then StartDate=Date()-7
EndDate=ChkStr(Request("EndDate"),3):If EndDate="" Then EndDate=Date()

if IsDate(StartDate) = False Or IsDate(EndDate) = False Or Cdate(StartDate)>Cdate(EndDate) Then Call AlertBack("ʱ���ʽ�д�����һ����������ڱȵڶ������������Ҫ��!",1)

PageUrl = "?Action="&Action&"&UserName="&UserName&"&StartDate="&StartDate&"&EndDate="&EndDate
%>

<script language=javascript src="../../js/calendar.js"></script>

<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>";
 searchurl += '&UserName=' + $('#UserName').val();
 searchurl += '&StartDate=' + $('#StartDate').val();
 searchurl += '&EndDate=' + $('#EndDate').val();

 location.href=searchurl;
});

});
</script>

     
<table>
<tr>
<td>������վ����<input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="10" /></td>
<td>��ʼ���ڣ�</td>
<td><input name="StartDate" type="text" id="StartDate" value="<%=StartDate%>" size="10" onclick="fPopCalendar(event,this,this)" onfocus="this.select()"  /></td>
<td>�������ڣ�</td>
<td><input name="EndDate" type="text" id="EndDate" value="<%=EndDate%>" size="10" onclick="fPopCalendar(event,this,this)" onfocus="this.select()" /></td>
<td><input type="submit" name="submit" value="��ѯ" class="btn btn-sm btn-primary" id="search" /></td>
<td>
<%
v1=weekday(date)

Response.write "&nbsp;&nbsp;&nbsp;&nbsp;<a href='?Action="&action&"&StartDate="&date()-1&"&EndDate="&date()-1&"'>����</a>"

Response.write "&nbsp;&nbsp;&nbsp;&nbsp;<a href='?Action="&action&"&StartDate="&date()&"&EndDate="&date()&"'>����</a>"

Response.write "&nbsp;&nbsp;&nbsp;&nbsp;<a href='?Action="&action&"&StartDate="&dateadd("d",1-v1-7,date)&"&EndDate="&dateadd("d",1-v1-1,date)&"'>����</a>"

Response.write "&nbsp;&nbsp;&nbsp;&nbsp;<a href='?Action="&action&"&StartDate="&dateadd("m",-1,year(date)&"-"&month(date)&"-1")&"&EndDate="&dateadd("d",-1,year(date)&"-"&month(date)&"-1")&"'>����</a>"

Response.write "&nbsp;&nbsp;&nbsp;&nbsp;<a href='?Action="&action&"&StartDate="&dateadd("d",1-v1,date)&"&EndDate="&date&"'>����</a>"

Response.write "&nbsp;&nbsp;&nbsp;&nbsp;<a href='?Action="&action&"&StartDate="&year(date)&"-"&month(date)&"-1&EndDate="&date&"'>����</a>"
%>
</td>
</tr>
</table>

<table class="tb_2">
<tr>
<td><span class="title">�ͷ�ҵ��ͳ�� ��<%=StartDate%>��<%=EndDate%></span></td>
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
<td>����</td>
<td>��վ��</td>
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
<td></td>
</tr>  
<%

Sql="select"&chr(10)
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
Sql=Sql&"from CFWztg_AD_Counter_Day a inner join CFWztg_User b on a.username=b.username and b.upusername='"&SeUserName&"'"&chr(10)

If UserName<>"" Then Sql=Sql&" and a.username='"&UserName&"'"&chr(10)

Sql=Sql&"where a.adddate >='"&StartDate&"' and a.adddate <='"&EndDate&"'"&chr(10)


Set Rs=Conn.Execute(Sql)
%>
<tr class="tr_3"> 
<td>����</td>
<td></td>
<td><%=Rs("Pv_Counter")%></td>
<td><%=Rs("Uv_Counter")%></td>
<td><%=Rs("Display_Counter")%></td>
<td><%=Rs("ClickPv_Counter")%></td>
<td><%=Rs("ClickUv_Counter")%></td>
<td><%=Rs("Click_Counter")%></td>
<td><%=Rs("Reg_Counter")%></td>
<td><%=Rs("Order_Counter")%></td>
    
<td>��<%=FormatNumber(Rs("SeUser_Income_Cent"),2,-1,0,0)%>(��<%=FormatNumber(Rs("User_Income_Cent"),2,-1,0,0)%>)</td>
<td>��<%=FormatNumber(Rs("SeUser_Income_CPC"),2,-1,0,0)%>(��<%=FormatNumber(Rs("User_Income_CPC"),2,-1,0,0)%>)</td>
<td>��<%=FormatNumber(Rs("SeUser_Income_CPM"),2,-1,0,0)%>(��<%=FormatNumber(Rs("User_Income_CPM"),2,-1,0,0)%>)</td>
<td>��<%=FormatNumber(Rs("SeUser_Income_CPA"),2,-1,0,0)%>(��<%=FormatNumber(Rs("User_Income_CPA"),2,-1,0,0)%>)</td>
<td>��<%=FormatNumber(Rs("SeUser_Income_CPS"),2,-1,0,0)%>(��<%=FormatNumber(Rs("User_Income_CPS"),2,-1,0,0)%>)</td>
<td></td>

</tr>
  
  
<%
Rs.Close

Sql="select"&chr(10)
Sql=Sql&"c.adddate adddate,"&chr(10)
Sql=Sql&"c.username username,"&chr(10)
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
Sql=Sql&"from CFWztg_AD_Counter_Day a inner join CFWztg_User b on a.username=b.username and b.upusername='"&SeUserName&"'"&chr(10)

If UserName<>"" Then Sql=Sql&" and a.username='"&UserName&"'"&chr(10)

Sql=Sql&"where a.adddate >='"&StartDate&"' and a.adddate <='"&EndDate&"'"&chr(10)
Sql=Sql&"group by a.adddate,a.username) c group by c.adddate,c.username order by c.adddate desc,User_Income_Cent desc"&chr(10)



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
<tr> 
<td><%=Rs("AddDate")%></td>
<td><%=Rs("UserName")%></td>
<td><%=Rs("Pv_Counter")%></td>
<td><%=Rs("Uv_Counter")%></td>
<td><%=Rs("Display_Counter")%></td>
<td><%=Rs("ClickPv_Counter")%></td>
<td><%=Rs("ClickUv_Counter")%></td>
<td><%=Rs("Click_Counter")%></td>
<td><%=Rs("Reg_Counter")%></td>
<td><%=Rs("Order_Counter")%></td>
    
<td><%=FormatNumber(Rs("SeUser_Income_Cent"),2,-1,0,0)%>(<%=FormatNumber(Rs("User_Income_Cent"),2,-1,0,0)%>)</td>
<td><%=FormatNumber(Rs("SeUser_Income_CPC"),2,-1,0,0)%>(<%=FormatNumber(Rs("User_Income_CPC"),2,-1,0,0)%>)</td>
<td><%=FormatNumber(Rs("SeUser_Income_CPM"),2,-1,0,0)%>(<%=FormatNumber(Rs("User_Income_CPM"),2,-1,0,0)%>)</td>
<td><%=FormatNumber(Rs("SeUser_Income_CPA"),2,-1,0,0)%>(<%=FormatNumber(Rs("User_Income_CPA"),2,-1,0,0)%>)</td>
<td><%=FormatNumber(Rs("SeUser_Income_CPS"),2,-1,0,0)%>(<%=FormatNumber(Rs("User_Income_CPS"),2,-1,0,0)%>)</td>
<td><a href="?Action=daytjdetail&UserName=<%=Rs("UserName")%>&AddDate=<%=Rs("AddDate")%>" class="btn_add"><i class="mdi mdi-eye"></i> ��ϸ</a></td>

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
