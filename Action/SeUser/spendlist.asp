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
Sql="select * from CFWztg_User Where UserName='"&SeUserName&"'"
Rs.Open Sql,Conn,1,1
%>

<table class="tb_2">
<tr>
<td><span class="title">�ͷ�<font color="#FF0000"><%=SeUserName%></font>���ƹ�ɼ�</span></td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td>ʣ����</td>
<td>�ѽ�����</td>
<td>���ý��</td>
</tr>

<tr class="tr_2"> 
<td><%=Int(Cdbl(rs("Spare_Cent"))*100)/100%>Ԫ</td>
<td><%=FormatNumber(rs("Spend_Cent"),2,-1,0,0)%>Ԫ</td>
<td><%=FormatNumber(rs("Total_Cent"),2,-1,0,0)%>Ԫ</td>
</tr>

<tr> 
<td colspan="6" class="td_3">
<%
If RsSet("UserSpendType")=0 Then'�ֹ�����ʱ
 if Cdbl(rs("Spare_Cent"))>=RsSet("LowSpendCent") then
  If RsSet("SpendSecAdd")=1 Then
   Response.write "<a href=""?Action=spendadd"" class=""btn btn-primary""><span>��������</span></a>"
  Else
   Sql="Select Count(1) From CFWztg_Spend Where UserName='"&SeUserName&"' And SpendType=0 And SpendState=1"
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
 Response.write "&nbsp;&nbsp;&nbsp;&nbsp;ϵͳ�Զ���������Ϊ"&RsSet("UserSpendType")&"��"
End If


Response.write "(ÿ����������" & GetTurnCent(RsSet("LowSpendCent")) & "Ԫ"
If RsSet("SpendCentBS")>0 Then Response.write ",�ҽ��������Ϊ"&RsSet("SpendCentBS")&"Ԫ�ı���"
Response.write ")"


%>               
</td>
</tr>
</table>

<br>
<%
If Request("SpendType")="" Then SpendType = -1 Else SpendType = CInt(ChkStr(Request("SpendType"),2))

PageUrl = "?Action="&Action&"&SpendType="&SpendType

MaxListRs = 2000

Sql = "Select Top "&MaxListRs&" * From CFWztg_Spend Where UserName='"&SeUserName&"'"
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
    <td> 
        <%
If Rs("SpendState")=1 Then
 Response.Write "���������"
ElseIf Rs("SpendState")=2 Then
 Response.Write "����ɹ�"
ElseIf Rs("SpendState")=3 Then
 Response.Write "����ʧ��,"&Rs("SpendAbortFeedBack")
End If%>    </td>
    <td> 
        <%
If Rs("SpendType")=0 Then
 Response.Write "�������"
ElseIf Rs("SpendType")=1 Then
 Response.Write "����Ƽ��û�����"
ElseIf Rs("SpendType")=2 Then
 Response.Write "������Ʒ����"
End If%>    </td>
    <td width="140" style="word-wrap: break-word;word-break:break-all;"><%=rs("AdminDesc")%></td>
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
