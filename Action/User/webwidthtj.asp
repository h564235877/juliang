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
AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then AddDate=Date()
Ad_ID=ChkStr(Request("Ad_ID"),2)
%>

<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>";
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
<option value="">��ѡ������</option>
<%
Sql="Select AddDate From CFWztg_WebWidth_Day Where UserName='"&UserName&"' Group By AddDate Order By AddDate Desc"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
Response.Write "<option value='"&Rs("AddDate")&"'"
If CDate(AddDate)=Rs("AddDate") Then Response.Write " selected"
Response.Write ">"&Rs("AddDate")&"</option>"
Rs.MoveNext
Wend
%>
</select>
        
<select id='Ad_ID' name="Ad_ID">
<option value="">��ѡ����</option>
<%
Sql="Select min(b.AdName) as AdName,a.Ad_ID From CFWztg_WebWidth_Day a inner join cfwztg_ad b on a.ad_id=b.id Where a.UserName='"&UserName&"' Group By a.Ad_ID Order By a.Ad_ID Desc"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
Response.Write "<option value='"&Rs("Ad_ID")&"'"
If Request("Ad_ID")=Cstr(Rs("Ad_ID")) Then Response.Write " selected"
Response.Write ">"&Rs("AdName")&"["&Rs("Ad_ID")&"]</option>"
Ad_ID_2=Rs("Ad_ID")
Rs.MoveNext
Wend
%>
</select>
<input type="submit" name="search"  id="search" value="��ѯ" class="btn btn-sm btn-primary">
</td>
</tr>
</table>

<%
If Ad_ID="" Then Ad_ID=CLng(Ad_ID_2)

PageUrl = "?Action="&Action&"&AddDate="&AddDate&"&Ad_ID="&Ad_ID

Sql="Select Sum(IpCounter) From CFWztg_WebWidth_Day where UserName='"&UserName&"' And Ad_ID="&Ad_ID&" And Datediff(d,AddDate,'"&AddDate&"')=0"
Set Rs=Conn.Execute(Sql)
IpTotal=Rs(0)

Sql="Select * From CFWztg_WebWidth_Day where UserName='"&UserName&"' And Ad_ID="&Ad_ID&"  And Datediff(d,AddDate,'"&AddDate&"')=0  Order By IpCounter Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.pagesize=20
 TotalRs=Rs.RecordCount
 TotalPage=Rs.PageCount
 MyPageSize=Rs.PageSize
 FixedSize=Rs.PageSize
 Rs.AbsolutePage=Page
End If
%>

<table class="tb_2">
<tr>
<td>
<td><span class="title">
��Դ��ҳ���ͳ�� ����:<%=AddDate%>�����ID:<%=Ad_ID%>
</span>
</td>
</tr>

</table>


<table class="tb_1">
  <tr class="tr_1"> 
    <td>���</td>
    <td>��С</td>
    <td>����</td>
	<td>ռ��</td>
  </tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2"> 
    <td style="font-weight:bold;"><%=Rs.RecordCount-Rs.Pagesize*(Page)+MyPageSize%></td>
    <td><%=Rs("WebWidth")%></td>
    <td><%=Rs("IpCounter")%></td>
    <td><%=MyRate(Rs("IpCounter"),IpTotal)%>%</td>
  </tr>
  <%
MyPageSize=MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
