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
AddDate=ChkStr(Request("AddDate"),3)
Px=ChkStr(Request("Px"),1)

If Request("RefUrl")="" Then RefUrl=ChkStr(Request.ServerVariables("Http_Referer"),1) Else RefUrl=ChkStr(Request("RefUrl"),1)

If AddDate="" Then
Response.write "���ڲ���Ϊ��"
Response.end
End If

If Px="" Then  Px="User_Income_Cent"

PageUrl = "?Action="&Action&"&AddDate="&AddDate&"&RefUrl="&Server.URLEncode(RefUrl)


Call PxFilter(Px,"Ad_ID,Pv_Counter,Uv_Counter,Display_Counter,PvIpRate,ClickPv_Counter,ClickUv_Counter,Click_Counter,Reg_Counter,Order_Counter,ClickRate,User_Income_Cent,User_Income_CPC,User_Income_CPM,User_Income_CPA,User_Income_CPS")


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
<td colspan="11">
<span class="title">
<%=AdTitle%> �� <%=AddDate%> ����</span>
&nbsp;&nbsp;&nbsp;&nbsp;(������������)

<a href="<%=RefUrl%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>
</td>
</tr>
</table>



<table class="tb_1">
  <tr class="tr_1">   
    <td><a href="<%=PageUrl%>&Px=Ad_ID">���</a></td>
    <td><a href="<%=PageUrl%>&Px=Pv_Counter">��ʾPV</a></td>
    <td><a href="<%=PageUrl%>&Px=Uv_Counter">��ʾUV</a></td>
    <td><a href="<%=PageUrl%>&Px=Display_Counter">��ʾIP</a></td>
    <td><a href="<%=PageUrl%>&Px=PvIpRate">����</a></td>
    <td><a href="<%=PageUrl%>&Px=ClickPv_Counter">���PV</a></td>
    <td><a href="<%=PageUrl%>&Px=ClickUv_Counter">���UV</a></td>
    <td><a href="<%=PageUrl%>&Px=Click_Counter">���IP</a></td>
    <td><a href="<%=PageUrl%>&Px=Reg_Counter">ע����</a></td>
    <td><a href="<%=PageUrl%>&Px=Order_Counter">������</a></td>
    <td><a href="<%=PageUrl%>&Px=ClickRate">�����</a></td>
	<td><a href="<%=PageUrl%>&Px=User_Income_Cent">������</a></td>
    <td><a href="<%=PageUrl%>&Px=User_Income_CPC">CPC����</a></td>
    <td><a href="<%=PageUrl%>&Px=User_Income_CPM">CPV����</a></td>
    <td><a href="<%=PageUrl%>&Px=User_Income_CPA">CPA����</a></td>
    <td><a href="<%=PageUrl%>&Px=User_Income_CPS">CPS����</a></td>
  </tr>
<%

Sql="Select b.AdName,a.Ad_ID,a.Pv_Counter,a.Uv_Counter,a.Display_Counter,(a.Pv_Counter/case a.Display_Counter when 0 then 1 else a.Display_Counter end) PvIpRate,a.ClickPv_Counter,a.ClickUv_Counter,a.Click_Counter,a.Reg_Counter,a.Order_Counter,(a.Click_Counter*1000 / case a.Display_Counter when 0 then 1 else a.Display_Counter end ) ClickRate,a.User_Income_Cent,a.User_Income_CPC,a.User_Income_CPM,a.User_Income_CPA,a.User_Income_CPS From CFWztg_AD_Counter_Day a inner join cfwztg_ad b on a.ad_id=b.id Where 1=1 And a.UserName='"&UserName&"' And a.AddDate='"&AddDate&"'" &chr(10)

If Ad_ID="" Then
ElseIf CInt(Ad_ID)<0 Then
 Sql=Sql&" And b.Ad_Class="&Abs(Ad_ID) &chr(10)
Else
 Sql=Sql&" And a.Ad_ID="&Ad_ID &chr(10)
End If

If Lcase(Px)="clickrate" Or Lcase(Px)="pviprate" Then
 Sql=Sql & " Order By "&Px&" Desc"
Else
 Sql=Sql & " Order By a."&Px&" Desc"
End If

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not rs.eof then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 rs.pagesize=60
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
    <td><%=Rs("Pv_Counter")%></td>
    <td><%=Rs("Uv_Counter")%></td>
    <td><%=Rs("Display_Counter")%></td>
    <td><%=Rs("PvIpRate")%></td>
    <td><%=Rs("ClickPv_Counter")%></td>
    <td><%=Rs("ClickUv_Counter")%></td>
    <td><%=Rs("Click_Counter")%></td>
    <td><%=Rs("Reg_Counter")%></td>
    <td><%=Rs("Order_Counter")%></td>
    <td><%=FormatNumber(Rs("ClickRate"),1,-1,0,0)%>��</td>
	<td><%=FormatNumber(Rs("User_Income_Cent"),2,-1,0,0)%></td>	
    <td><%=FormatNumber(Rs("User_Income_CPC"),2,-1,0,0)%></td>
    <td><%=FormatNumber(Rs("User_Income_CPM"),2,-1,0,0)%></td>
    <td><%=FormatNumber(Rs("User_Income_CPA"),2,-1,0,0)%></td>
    <td><%=FormatNumber(Rs("User_Income_CPS"),2,-1,0,0)%></td>
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
