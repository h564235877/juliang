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
AD_ID=ChkStr(Request("AD_ID"),2)
AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then Call AlertRef("���ڲ���Ϊ��")


PageUrl = "?Action="&Action&"&Ad_ID="&Ad_ID&"&AddDate="&AddDate

If Ad_ID="" Then
 AdTitle="ȫ�����"

ElseIf Ad_ID="-7" Then
 AdTitle="ȫ����ѭ��ý����"
ElseIf Ad_ID="-1" Then
 AdTitle="ȫ����ѭֱ�����"
ElseIf Ad_ID="-4" Then
 AdTitle="ȫ����ѭ��ͨͼƬ���"
ElseIf Ad_ID="-8" Then
 AdTitle="ȫ����ѭǿ�����"
ElseIf Ad_ID="-9" Then
 AdTitle="ȫ����ѭ�˵����"

 
ElseIf Ad_ID="-11" Then
 AdTitle="ȫ����ϸ�ý����"
ElseIf Ad_ID="-5" Then
 AdTitle="ȫ��������ֹ��"
ElseIf Ad_ID="-6" Then
 AdTitle="ȫ�����ͼƬ���"
ElseIf Ad_ID="-10" Then
 AdTitle="ȫ����ϱ�ǩ�ƹ��"
Else
 AdTitle="���"&AD_ID
End If
%>



<table class="tb_2">
<tr>
<td>
<td><span class="title">
<%=AdTitle%> �� <%=AddDate%> ����
</span>
<a href="?Action=daytj" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>
</td>
</tr>
</table>

<table class="tb_1">
  <tr class="tr_1">     
    <td>���</td>
    <td>��վ��</td>
    <td>��ʾPV</td>
    <td>��ʾUV</td>
    <td>��ʾIP</td>
    <td>���PV</td>
	<td>���UV</td>
	<td>���IP</td>
    <td>ע����</td>
    <td>�����</td>
	<td>����</td>
  </tr>
<%


Sql="Select b.AdName,a.Ad_ID,a.UserName,a.Reg_Counter,a.Pv_2_Counter,a.Uv_2_Counter,a.Display_2_Counter,a.ClickPv_2_Counter,a.ClickUv_2_Counter,a.Click_2_Counter,a.AdUser_Spend_Cent  From CFWztg_AD_Counter_Day a inner join cfwztg_ad b on a.ad_id=b.id Where 1=1 And b.AdUserName='"&AdUserName&"' And a.AddDate='"&AddDate&"'"&chr(10)

If Ad_ID="" Then
ElseIf CInt(Ad_ID)<0 Then
 Sql=Sql&"And b.Ad_Class="&Abs(Ad_ID) &chr(10)
Else
 Sql=Sql&"And a.Ad_ID="&Ad_ID &chr(10)
End If

Sql=Sql & " Order By a.AdUser_Spend_Cent Desc"

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
    <td><%=Rs("AdName")&"["&Rs("Ad_ID")&"]"%></td>
    <td><%=Rs("UserName")%></td>
    <td><%=Rs("Pv_2_Counter")%></td>
    <td><%=Rs("Uv_2_Counter")%></td>
    <td><%=Rs("Display_2_Counter")%></td>
    <td><%=Rs("ClickPv_2_Counter")%></td>
    <td><%=Rs("ClickUv_2_Counter")%></td>
    <td><%=Rs("Click_2_Counter")%></td>
    <td><%=Rs("Reg_Counter")%></td>
    <td><%=FormatNumber(MyRate2(Rs("Click_2_Counter"),Rs("Display_2_Counter")),1,-1,0,0)%>��</td>
	<td><%=GetTurnCent(Rs("AdUser_Spend_Cent"))%>Ԫ</td>
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