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
AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then AddDate=CStr(Date)
Ad_ID=ChkStr(Request("Ad_ID"),2)
%>

<script>
$(function(){

$("#search").click(function(){
 var searchurl = "?Action=<%=Action%>";
 searchurl += '&AddDate=' + $('#AddDate').val();
 searchurl += '&Ad_ID=' + $('#Ad_ID').val(); 

 location.href=searchurl;
});

});
</script>
<table style="margin-bottom:10px;">
<tr>
<td>
<select id='AddDate' name='AddDate'>
<option value="">��ѡ���ѯ����</option>
<%
Sql="Select a.AddDate From CFWztg_AD_Counter_Hour a inner join cfwztg_ad b on a.ad_id=b.id Where b.AdUserName='"&AdUserName&"' Group By a.AddDate Order By a.AddDate Desc"
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

<select id='Ad_ID' name="Ad_ID">

<option value="">���й��</option>

<%
Sql="Select ID,PlanName From CFWztg_Plan Where PlanState=2"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='-" & Rs("ID")&"'"
 If Ad_ID=Cstr("-" & Rs("ID")) Then Response.Write " selected"
 Response.Write ">���ƻ���"&Rs("PlanName")&"["&Rs("ID")&"]</option>"
Rs.MoveNext
Wend
Rs.Close

Sql="Select min(b.AdName) as AdName,a.Ad_ID From CFWztg_AD_Counter_Hour a inner join cfwztg_ad b on a.ad_id=b.id Where b.AdUserName='"&AdUserName&"' Group By a.Ad_ID Order By a.Ad_ID"
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("Ad_ID")&"'"
 If Ad_ID=Cstr(Rs("Ad_ID")) Then Response.Write " selected"
 Response.Write ">"&Rs("AdName")&"["&Rs("Ad_ID")&"]</option>"
Rs.MoveNext
Wend
%>
</select>

<input type="submit" name="search"  id="search" value="��ѯ" class="btn btn-sm btn-primary">

</td>
</tr>
</table>
<%

Sql="Select max(a.AddDate) as AddDate,a.AddHour,Sum(a.Pv_Counter) As Pv_Counter,Sum(a.Uv_Counter) As Uv_Counter,Sum(a.Display_Counter) As Display_Counter,Sum(a.ClickPv_Counter) As ClickPv_Counter,Sum(a.ClickUv_Counter) As ClickUv_Counter,Sum(a.Click_Counter) As Click_Counter,Sum(a.Reg_Counter) As Reg_Counter From CFWztg_AD_Counter_Hour a WITH(NOLOCK) inner join cfwztg_ad b WITH(NOLOCK) on a.ad_id=b.id where a.AddDate='"&AddDate&"' And b.AdUserName='"&AdUserName&"'"


If Ad_ID="" Then
ElseIf CInt(Ad_ID)<0 Then
 Sql=Sql&"And b.Plan_ID="&Abs(Ad_ID)
Else
 Sql=Sql&"And a.Ad_ID="&Ad_ID
End If

Sql=Sql&" Group By a.AddHour Order By a.AddHour Desc"


Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
%>



<table class="tb_1">
  <tr class="tr_1"> 
    <td>Сʱ</td>
    <td>��ʾPV</td>
    <td>��ʾUV</td>
    <td>��ʾIP</td>
    <td>���PV</td>
    <td>���UV</td>
    <td>���IP</td>
    <td>ע����</td>
    <td>�����</td>
    <td>��ϸ�ƹ��¼</td>
  </tr>
  <%
While Not Rs.Eof
I=I+1

PvNum=Rs("Pv_Counter")
DisplayNum=Rs("Display_Counter")
ClickNum=Rs("Click_Counter")
RegNum=Rs("Reg_Counter")
%>
  <tr> 
    <td style="font-weight:bold;"><%=Rs("AddHour")%>-<%=Rs("AddHour")+1%></td>
    <td><%=Rs("Pv_Counter")%></td>
    <td><%=Rs("Uv_Counter")%></td>
    <td><%=Rs("Display_Counter")%></td>
    <td><%=Rs("ClickPv_Counter")%></td>
    <td><%=Rs("ClickUv_Counter")%></td>
    <td><%=Rs("Click_Counter")%></td>
    <td><%=Rs("Reg_Counter")%></td>
    <td><%=FormatNumber(MyRate2(Rs("Click_Counter"),Rs("Display_Counter")),1,-1,0,0)%>��</td>
    <td><a href="?Action=lylist&AddDate=<%=Rs("AddDate")%>" class="btn_add"><i class="mdi mdi-eye"></i> �鿴</a></td>
  </tr>
  <%
Rs.MoveNext
Wend
%>

</table>
