<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<table class="tb_2">
<tr>
<td><span class="title">������ͣ�<font color="#FF0000"><%=GetAdClassName(Ad_Class)%></span></td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1">
<td>���ͼƬ</td>
<td>�������</td>
<td>˵��</td>
<td>����</td>
<td>��ȡ����</td>
</tr>
<%
PageUrl = "?Action="&Action&"&Ad_Class="&Ad_Class

Sql="Select a.* From CFWztg_Ad a inner join CFWztg_Plan b on a.plan_id=b.id Where a.AdState=2 And a.AdListShowState=1 And a.Ad_Class=" & Ad_Class &" and b.PlanState=2 Order By a.ID Desc"

Set Rs = Server.CreateObject("Adodb.RecordSet")
Rs.Open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.pagesize=20
 TotalRs=Rs.RecordCount
 TotalPage=Rs.PageCount
 MyPageSize=Rs.PageSize
 FixedSize=Rs.PageSize
 Rs.AbsolutePage=Page
End If

While Not Rs.Eof And MyPageSize>0

If MyPageSize Mod 2 =0 Then BgColor="ffffff" Else BgColor="eeeeee"

Response.write Rs("AdDesc")
%>
  <tr class="tr_2"> 
    <td><img src="<%=Rs("Ad")%>" /></td>
    <td><%=Rs("AdName")%></td>
    <td><%=Rs("AdIntro")%></td>
    <td><%=GetTurnCent(Rs("Unit_Cent_First")) & " Ԫ"%></td>
    <td><a href='?Action=adcodeget&Ad_Class=<%=Ad_Class%>&ID=<%=Rs("ID")%>' class="btn btn-primary"><span>Ԥ������ô˹�����</span></a></td>
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
