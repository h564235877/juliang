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
If Request("ExpendType")="" Then ExpendType = -1 Else ExpendType = CInt(ChkStr(Request("ExpendType"),2))

PageUrl = "?Action="&Action&"&ExpendType="&ExpendType

MaxListRs = 2000

Sql="SELECT "
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AdUser_Expend Where AdUserName='"&AdUserName&"' And AdminCheck=0) ExpendNum,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AdUser_Expend Where AdUserName='"&AdUserName&"' And AdminCheck=0 And ExpendType=0) ExpendNum_0,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AdUser_Expend Where AdUserName='"&AdUserName&"' And AdminCheck=0 And ExpendType=1) ExpendNum_1,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AdUser_Expend Where AdUserName='"&AdUserName&"' And AdminCheck=0 And ExpendType=2) ExpendNum_2"
Set Rs=Conn.Execute(Sql)
%>

<ul class="tab">
<li><a href="?Action=<%=Action%>&ExpendType=-1"<%If ExpendType=-1 Then Response.write " class='selected'"%>><span>����[<%=Rs("ExpendNum")%>]</span></a></li>
<li><a href="?Action=<%=Action%>&ExpendType=0"<%If ExpendType=0 Then Response.write " class='selected'"%>><span>�·���������[<%=Rs("ExpendNum_0")%>]</span></a></li>
<li><a href="?Action=<%=Action%>&ExpendType=1"<%If ExpendType=1 Then Response.write " class='selected'"%>><span>���׷�ӵ������[<%=Rs("ExpendNum_1")%>]</span></a></li>
<li><a href="?Action=<%=Action%>&ExpendType=2"<%If ExpendType=2 Then Response.write " class='selected'"%>><span>��Ʒ�������[<%=Rs("ExpendNum_2")%>]</span></a></li>
</ul>

<div class="explain">
[]�ڵ�����Ϊδ�������
</div>

 
<%
Sql="Select Top "&MaxListRs&" * From CFWztg_AdUser_Expend where AdUserName='"&AdUserName&"'"
If ExpendType>=0 Then Sql=Sql&" And ExpendType="&ExpendType
Sql=Sql&" Order By ID Desc"

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
<table class="tb_1">
  <tr class="tr_1"> 
    <td>���ѱ��</td>
    <td>�����</td>
    <td>���ID</td>
    <td>����</td>
    <td>���ѽ��</td>
    <td>��;</td>
    <td>����ʱ��</td>
    <td>�������</td>
    <td>�������״̬</td>
    <td>����Ա˵��</td>
    <td>���ʱ��</td>
  </tr>
  <%
If TotalRs = MaxListRs Then Response.write "��¼̫�ֻ࣬������"&MaxListRs&"��"

While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2"> 
    <td><%=Rs("ID")%></td>
    <td><%=Rs("AdUserName")%></td>
    <td><%=Rs("Ad_ID")%>[<a href="../../cf.aspx?Action=adview&ID=<%=Rs("Ad_ID")%>" target="_blank">�鿴</a>]</td>
    <td><%=Rs("ChaseClickNum")%></td>
    <td><%=GetTurnCent(Rs("Expend_Cent"))%>Ԫ</td>
    <td width="200"><%=Rs("ExpendDesc")%></td>
    <td><%=Rs("AddTime")%></td>
    <td>
	<%
	IF Rs("ExpendState")=1 Then
	 Response.Write "�����"
	ElseIf Rs("ExpendState")=2 Then
	 Response.Write "��˳ɹ�"
	ElseIf Rs("ExpendState")=3 Then
	 Response.Write "���ʧ��,"&Rs("ExPendAbortFeedBack")
	End If
	%>	</td>
    <td> <div align="center"> 
        <%If Rs("AdminCheck")=1 Then
	  Response.Write "�����"
	 Else
	  Response.Write "δ���"
	 End If%>    </td>
    <td><%=Rs("AdminDesc")%></td>
    <td><%=Rs("AdminSpendTime")%></td>
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
