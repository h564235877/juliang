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
If Request("UpUnionUserName")<>"" Then UpUnionUserName=ChkStr(Request("UpUnionUserName"),1) Else UpUnionUserName=""
AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then AddDate=CStr(Date)
%>

<script>
$(function(){

$("#search").click(function(){
 var searchurl = "?Action=<%=Action%>";
 searchurl += '&UpUnionUserName=' + $('#UpUnionUserName').val();
 searchurl += '&AddDate=' + $('#AddDate').val();

 location.href=searchurl;
});

});
</script>
<table style="margin-bottom:10px;">
<tr> 
<td>
<select id='UpUnionUserName' name='UpUnionUserName'>
<option value="">��ѡ���������</option>
<%
Sql="Select UpUnionUserName From CFWztg_UpUnion_Counter_Day Where UserName='"&UserName&"' Group By UpUnionUserName Order By UpUnionUserName"

Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("UpUnionUserName")&"'"
 If UpUnionUserName=Rs("UpUnionUserName") Then Response.Write " selected"
 Response.Write ">"&Rs("UpUnionUserName")&"</option>"
Rs.MoveNext
Wend
%>
</select>
<select id='AddDate' name='AddDate'>
<option value="">��ѡ���ѯ����</option>
<%
Sql="Select AddDate From CFWztg_UpUnion_Counter_Day Where UserName='"&UserName&"' Group By AddDate Order By AddDate"
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
<td><input type="submit" name="search"  id="search" value="��ѯ" class="btn btn-sm btn-primary"></td>
 </tr>
</table>

<table class="tb_1">
  <tr class="tr_h"> 
    <td colspan="9">ÿ�ձ���</td>
  </tr>
  <tr class="tr_1"> 
    <td>���ID</td>
    <td colspan="2">��ʾ��</td>
    <td colspan="2">�����</td>
    <td colspan="2">ע����</td>
    <td>�����</td>
  </tr>
<%

PageUrl = "?Action="&Action&"&UpUnionUserName="&UpUnionUserName&"&AddDate="&AddDate

Sql="Select Sum(Display_Counter),Sum(Click_Counter),Sum(Reg_Counter) From CFWztg_UpUnion_Counter_Day where UpUnionUserName='"&UpUnionUserName&"' And UserName='"&UserName&"' And DateDiff(d,AddDate,'"&AddDate&"')=0"

Set Rs=Conn.Execute(Sql)
DisplayTotal = Rs(0)
ClickTotal = Rs(1)
RegTotal = Rs(2)


Sql="Select * From CFWztg_UpUnion_Counter_Day Where  UpUnionUserName='"&UpUnionUserName&"' And UserName='"&UserName&"' And DateDiff(d,AddDate,'"&AddDate&"')=0"

Sql=Sql & " Order By Click_Counter Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not rs.eof then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 rs.pagesize=20
 totalrs=rs.RecordCount
 totalpage=rs.pageCount
 mypagesize=rs.pagesize
 rs.absolutepage=page
End If
%>

<%
While Not Rs.Eof And MyPageSize>0
Ad_ID=Rs("Ad_ID")
DisplayNum=Rs("Display_Counter")
ClickNum=Rs("Click_Counter")
RegNum=Rs("Reg_Counter")
%>
  <tr> 
    <td><%=Rs("Ad_ID")%></td>
    <td><%=DisplayNum%></td>
    <td><img src=images/bar_blue.gif width=<%=MyRateWidth(DisplayNum,DisplayTotal,100)%> height=10><%=MyRate(DisplayNum,DisplayTotal)%>%</td>
    <td><%=ClickNum%></td>
    <td><img src=images/bar_green.gif width=<%=MyRateWidth(ClickNum,ClickTotal,100)%> height=10><%=MyRate(ClickNum,ClickTotal)%>%</td>
    <td><%=RegNum%></td>
    <td><img src=images/bar_red.gif width=<%=MyRateWidth(RegNum,RegTotal,100)%> height=10><%=MyRate(RegNum,RegTotal)%>%</td>
    <td><%=FormatNumber(MyRate2(ClickNum,DisplayNum),1,-1,0,0)%>��</td>

  </tr>
<%
Mypagesize=Mypagesize-1
Rs.MoveNext
Wend
%>
  <tr> 
    <td colspan="9">ͳ�ƣ������ʾ�ܼ�<%=DisplayTotal%>�� ���������<%=ClickTotal%>�� �Ƽ�ע���û�����<%=RegTotal%>��</td>
  </tr>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
