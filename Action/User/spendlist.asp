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
Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="select * from CFWztg_User Where UserName='"&UserName&"'"
Rs.Open Sql,Conn,1,1
%>

<table class="tb_2">
<tr>
<td><span class="title">�û�<font color="#FF0000"><%=UserName%></font>���ƹ�ɼ�</span></td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td>ʣ����</td>
<td>�ѽ�����</td>
<td>���ý��</td>
<td>����ʾ����</td>
<td>�ܵ������</td>
<td>�ܹ�ע������</td>
</tr>
<tr class="tr_2">           
<td><%=Int(Cdbl(rs("Spare_Cent"))*100)/100%>Ԫ</td>
<td><%=FormatNumber(rs("Spend_Cent"),2,-1,0,0)%>Ԫ</td>
<td><%=FormatNumber(rs("Total_Cent"),2,-1,0,0)%>Ԫ</td>
<td><%=rs("AdShowNum")%></td>
<td><%=rs("ComVisit")%></td>
<td><%=rs("ComReg")%></td>
</tr>
<tr> 
<td colspan="6" class="td_3">
<%
If RsSet("UserSpendType")=0 Then'�ֹ�����ʱ
 if Cdbl(rs("Spare_Cent"))>=RsSet("LowSpendCent") then
  If RsSet("SpendSecAdd")=1 Then
   Response.write "<a href=""?Action=spendadd"" class=""btn btn-primary""><span>��������</span></a>"
  Else
   Sql="Select Count(1) From CFWztg_Spend Where UserName='"&UserName&"' And SpendType=0 And SpendState=1"
   Set Rs2=Conn.execute(Sql)
   If Rs2(0)>0 Then
    Response.write "�ϱʽ��㻹û����ɣ��ȴ���ɺ���ٴ��ύ����&nbsp;&nbsp;&nbsp;&nbsp;"
   Else
    Response.write "<a href=""?Action=spendadd"" class=""btn btn-primary""><span>��������</span></a>"
   End If
  End If
 Else
  Response.write "<a href=""#"" class=""btn btn-primary"" onClick=""$(function () { alert('ʣ����ﵽ��ͽ����׼" & RsSet("LowSpendCent") &"Ԫ���ܽ���!');});""><span>��������</span></a>"
 End If
Else
 Response.write "ϵͳ�Զ���������Ϊ"&RsSet("UserSpendType")&"��"
End If


Response.write "(ÿ����������" & GetTurnCent(RsSet("LowSpendCent")) & "Ԫ"
If RsSet("SpendCentBS")>0 Then Response.write "���ҽ��������Ϊ"&RsSet("SpendCentBS")&"Ԫ�ı���"
Response.write ")"

if rs("AdUserName")<>"" then Response.write "��<a href=""?Action=spareout""><span>�ʽ�Ҳ��ת�������������</span></a>"

%>               
</td>
</tr>
</table>

<br>
<%
If Request("SpendType")="" Then SpendType = -1 Else SpendType = CInt(ChkStr(Request("SpendType"),2))

PageUrl = "?Action="&Action&"&SpendType="&SpendType

MaxListRs = 2000

Sql = "Select Top "&MaxListRs&" * From CFWztg_Spend Where UserName='"&UserName&"'"

If SpendType>=0 Then Sql=Sql&" And SpendType="&SpendType

Sql=Sql&" Order By ID Desc"

Set Rs = Server.CreateObject("Adodb.RecordSet")
Rs.Open Sql,Conn,1,1

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
%>

<div class="tabs_header">
<ul class="tabs">
<li <%If SpendType=-1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&SpendType=-1"><span>���н����¼</span></a></li>
<li <%If SpendType=0 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&SpendType=0"><span>ʣ��������¼</span></a></li>
<li <%If SpendType=1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&SpendType=1"><span>����Ƽ��û������¼</span></a></li>
<li <%If SpendType=2 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&SpendType=2"><span>������Ʒ�����¼</span></a></li>
</ul>
</div>
<%
If SpendType=0 Then
 Response.write "<div class='explain'>ע��ʣ�������Ͷ�Ź�����룬�Ƽ��û���ɺ�������Ʒ���</div>"
ElseIf SpendType=1 Then
 Response.write "<div class='explain'>ע���Ƽ��û�����ÿ�ʽ�����˳ɹ��������������ϵͳ��������ʣ������ɽ���</div>"
ElseIf SpendType=2 Then
 Response.write "<div class='explain'>ע��������Ʒ������ϵͳ�Զ����㲢��������ʣ������</div>"
End If
%>
<table class="tb_1">
  <tr class="tr_1"> 
    <td>����ID</a></td>
    <td>������</td>
    <td>����˵��</td>
    <td>����ʱ��</td>
    <td>����״̬</td>
    <td>��������</td>
    <td>����Ա˵��</td>
    <td>����ʱ��</td>
  </tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2"> 
    <td><%=Rs("ID")%></td>
    <td><%=GetTurnCent(Rs("Spend_Cent"))%>Ԫ</td>
    <td><%=Rs("SpendDesc")%></td>
    <td><%=Rs("SpendTime")%></td>
    <td><%
If Rs("SpendState")=1 Then
 Response.Write "���������"
ElseIf Rs("SpendState")=2 Then
 Response.Write "����ɹ�"
ElseIf Rs("SpendState")=3 Then
 Response.Write "����ʧ��,"&Rs("SpendAbortFeedBack")
End If%></td>
<td> 
<%
If Rs("SpendType")=0 Then
 Response.Write "�������"
ElseIf Rs("SpendType")=1 Then
 Response.Write "����Ƽ��û�����"
ElseIf Rs("SpendType")=2 Then
 Response.Write "������Ʒ����"
End If%></td>
<td><%=rs("AdminDesc")%></td>
<td><%=rs("AdminSpendTime")%></td>
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
