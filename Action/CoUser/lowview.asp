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

PageUrl = "?Action="&Action&"&UserName="&UserName

Sql="Select ID,UserName,QQ,Phone,EMail,AddTime From CFWztg_User where UpUserName='"&CoUserName&"' And UserType=2"

If UserName<>"" Then Sql=Sql&" And UserName='"&UserName&"'"

Sql=Sql&" Order By AddTime Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.PageSize = 20
 TotalRs = Rs.RecordCount
 TotalPage = Rs.PageCount
 MyPageSize = Rs.PageSize
 FixedSize=Rs.PageSize
 Rs.AbsolutePage = Page
End If
%>

<table class="tb_1">
<tr class="tr_1"> 
    <td>�����ID</td>
    <td>���������</td>
    <td>QQ</td>
    <td>�ֻ�</td>
    <td>Email</td>
	<td>ע��ʱ��</td>
  </tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2"> 
    <td><%=Rs("ID")%></td>
    <td><%=Rs("UserName")%></td>
    <td><%=Rs("QQ")%></td>
    <td><%=Rs("Phone")%></td>
    <td><%=Rs("EMail")%></td>
	<td><%=Rs("AddTime")%></td>
  </tr>
<%
MyPageSize = MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>



<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>";
 searchurl += '&UserName=' + $('#UserName').val();
 location.href=searchurl;
});

});

</script> 

<table class="tb_3">
<tr class="tr_1"> 
<td colspan="2">��ѯ</td>
<tr>
<td class="td_r">��վ����</td>
<td><input name="UserName" type="text" id="UserName" value="<%=UserName%>"></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" name="submit" value="��ѯ" class="btn btn-sm btn-primary" id="search"></td>
</tr>
</table>

