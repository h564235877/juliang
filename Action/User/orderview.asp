<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<table class="tb_1">
<tr class="tr_1"> 
<td>�����</td>
<td>������</td>
<td>������</td>
<td>���</td>
<td>��ɱ���</td>
<td>��ɽ��</td>
<td>��ɶ���</td>
<td>����״̬</td>
<td>�Ƽ���</td>
<td>�ѽ���ID</td>
<td>�����������û�</td>
</tr>
<%
OrderCode=ChkStr(Trim(Request("OrderCode")),1)
OrderUser=ChkStr(Trim(Request("OrderUser")),1)
LowUnionUserName=ChkStr(Trim(Request("LowUnionUserName")),1)
OrderState=ChkStr(Request("OrderState"),2)
AddTime=ChkStr(Trim(Request("AddTime")),3)

PageUrl = "?Action="&Action&"&OrderCode="&OrderCode&"&OrderUser="&OrderUser&"&LowUnionUserName="&LowUnionUserName&"&OrderState="&OrderState&"&AddTime="&AddTime


MaxListRs = 2000

Sql="Select Top "&MaxListRs&" * From CFWztg_AdUser_Order where  UserName='"&UserName&"' And OrderState<=4"

 If OrderCode<>"" Then Sql=Sql&" And OrderCode='"&OrderCode&"'"
 If OrderUser<>"" Then Sql=Sql&" And OrderUser='"&OrderUser&"'"
 If LowUnionUserName<>"" Then Sql=Sql&" And LowUnionUserName='"&LowUnionUserName&"'"
 If OrderState<>"" Then Sql=Sql&" And OrderState="&OrderState
 If AddTime<>"" Then Sql=Sql&" And DateDiff(d,'"&AddTime&"',AddTime)=0"

Sql=Sql&" Order By AddTime Desc"


Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open Sql,Conn,1,1



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

If TotalRs = MaxListRs Then Response.write "��¼̫�ֻ࣬������"&MaxListRs&"��"

While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2"> 
	<td><%=Rs("AdUserName")%></td>
    <td><%=server.HTMLEncode(Rs("OrderCode"))%></td>
    <td><%=server.HTMLEncode(Rs("OrderUser"))%></td>
    <td><%=GetTurnCent(Rs("OrderCent"))%>Ԫ</td>
	<td><%=Rs("OrderTcRate")%>%</td>
	<td><%=GetTurnCent(CDbl(Rs("OrderCent"))*Rs("OrderTcRate")/100)%>Ԫ</td>
    <td><%
	If Rs("tcobject")=1 Then
	 Response.write "�Ƽ���"
	Else
	 Response.write "������"
	End If
	%></td>
    <td> 
<%
If Rs("OrderState")=1 Then
 Response.write "��ʱ���"
ElseIf Rs("OrderState")=2 Then
 Response.write "�ȴ�ȷ��"
ElseIf Rs("OrderState")=3 Then
 Response.write "ȷ�ϳɹ�"
ElseIf Rs("OrderState")=4 Then
 Response.write "ȷ��ʧ��"
End If
%>
</td>
<td>  
<%
If Rs("UserName")<>"" Then
Response.write Rs("UserName")
Else
Response.write "ȱ"
End If
%>
</td>
<td> 
<%
If Rs("SpendID")<>0 Then
Response.write Rs("SpendID")
Else
Response.write "ȱ"
End If
%>
</td>
<td><%=Rs("LowUnionUserName")%></td>
</tr>  
<tr>
<td colspan="12" style="border-color: #826666">
��Ʒ����:<%=Rs("GoodsName")%>
|��Ʒ����:<%If Rs("GoodsTotal") > 0 Then Response.write Rs("GoodsTotal")%>
|����:<%=Rs("GoodsTime")%>
|����:<%=Rs("AddTime")%>
|ȷ��:<%=Rs("AffirmTime")%>

<br />

�������:<%=Rs("ExName")%> 
|��ݵ���:<%=Rs("ExCode")%>
|���״̬:<%=Rs("ExState")%>
|��ݽ���:<%=Rs("ExContent")%>

<br />
����:<%=Rs("OrderDesc")%> 
</td>
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


<form name="form2" method="post" action="?Action=<%=Action%>">
<table class="tb_3"><tr class="tr_1"> 
<td colspan="2">��ѯ</td>
</tr>
<tr>
<td class="td_r">�����ţ�</td>
<td><input name="OrderCode" type="text" id="OrderCode" value="<%=OrderCode%>" size="10"></td>
</tr>
<tr>
<td class="td_r">�����ˣ�</td>
<td><input name="OrderUser" type="text" id="OrderUser" value="<%=OrderUser%>" size="10"></td>
</tr>
<tr>
<td class="td_r">�¼��������û���</td>
<td><input name="LowUnionUserName" type="text" id="LowUnionUserName" value="<%=LowUnionUserName%>" size="20"></td></tr>
<tr>
<tr>
<td class="td_r">ѡ��״̬��</td>
<td><select name="OrderState" id="OrderState">
<option value=""<% If CStr(OrderState)="" Then Response.write " selected"%>>ȫ������</option>
<option value="1"<% If CStr(OrderState)="1" Then Response.write " selected"%>>��ʱȷ�ϵĶ���</option>
<option value="2"<% If CStr(OrderState)="2" Then Response.write " selected"%>>�ȴ�ȷ�ϵĶ���</option>
<option value="3"<% If CStr(OrderState)="3" Then Response.write " selected"%>>ȷ�ϳɹ��Ķ���</option>
<option value="4"<% If CStr(OrderState)="4" Then Response.write " selected"%>>ȷ��ʧ�ܵĶ���</option>
</select></td>
</tr>
<tr>
<td class="td_r">����ʱ�䣺</td>
<td><input name="AddTime" type="text" id="AddTime" value="<%=AddTime%>" size="10" />
(��ʽ�磺1970-1-1)</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" name="submit" value="��ѯ" class="btn btn-sm btn-primary"></td>
</tr>
</table></form>

