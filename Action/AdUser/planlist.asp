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
If Request("PlanState")="" Then PlanState=2 Else PlanState=ChkStr(Request("PlanState"),2)

Px=ChkStr(Request("Px"),1):If Px="" Then Px="ID"

PageUrl = "?Action="&Action&"&PlanState="&PlanState

Call PxFilter(Px,"ID,AdUserName,PlanName,TotalClick_Cent,OverClick_Cent,SpareClick_Cent,PlanState")
%>



<%
Sql="SELECT "
Sql=Sql&"(SELECT Count(1) FROM CFWztg_Plan Where AdUserName='"&AdUserName&"') PlanNum_0,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_Plan Where PlanState=1 And AdUserName='"&AdUserName&"') PlanNum_1,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_Plan Where PlanState=2 And AdUserName='"&AdUserName&"') PlanNum_2,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_Plan Where PlanState=3 And AdUserName='"&AdUserName&"') PlanNum_3,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_Plan Where PlanState=4 And AdUserName='"&AdUserName&"') PlanNum_4,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_Plan Where PlanState=5 And AdUserName='"&AdUserName&"') PlanNum_5"
Set Rs=Conn.Execute(Sql)


%>

<table class="tb_2">

<tr> 
<td>
<div class="tabs_header">
<ul class="tabs">
<li <%If PlanState=0 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&PlanState=0"><span>���мƻ�[<%=Rs("PlanNum_0")%>]</span></a></li>
<li <%If PlanState=1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&PlanState=1"><span>����еļƻ�[<%=Rs("PlanNum_1")%>]</span></a></li>
<li <%If PlanState=2 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&PlanState=2"><span>�����еļƻ�[<%=Rs("PlanNum_2")%>]</span></a></li>
<li <%If PlanState=3 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&PlanState=3"><span>��ͣ��(����Ա����)�ļƻ�[<%=Rs("PlanNum_3")%>]</span></a></li>
<li <%If PlanState=4 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&PlanState=4"><span>Ͷ����ɵļƻ�[<%=Rs("PlanNum_4")%>]</span></a></li>
<li <%If PlanState=5 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&PlanState=5"><span>��ͣ��(���������)�ļƻ�[<%=Rs("PlanNum_5")%>]</span></a></li>
</ul>
</div>
</td>
</tr>

</table>


<div class="explain">
[]�ڵ�����Ϊ����,������������</div>

<%Rs.Close%>


<a href="?Action=planadd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>�ƻ�����</span></a>

<table class="tb_1">
<tr class="tr_1"> 
<td><a href="<%=PageUrl%>&Px=ID">�ƻ�ID</a></td>
<td><a href="<%=PageUrl%>&Px=PlanName">�ƻ�����</a></td>
<td><a href="<%=PageUrl%>&Px=TotalClick_Cent">Ͷ���ܶ�</a></td>
<td><a href="<%=PageUrl%>&Px=OverClick_Cent">�����ѽ��</a></td>
<td><a href="<%=PageUrl%>&Px=SpareClick_Cent">ʣ����</a></td>
<td><a href="<%=PageUrl%>&Px=PlanState">״̬</a></td>
<td>�����еĹ����</td>
<td>����</td>
</tr>
  <%

Sql="Select * From CFWztg_Plan Where AdUserName='"&AdUserName&"'"
If PlanState>0 Then Sql=Sql&" And PlanState="&PlanState
Sql=Sql&" Order By "&Px&" Desc"

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

While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2"> 
    <td><%=Rs("ID")%></td>
    <td><%=Rs("PlanName")%></td>
    <td><%=GetTurnCent(Rs("TotalClick_Cent"))%>Ԫ</td>
    <td><%=GetTurnCent(Rs("OverClick_Cent"))%>Ԫ</td>
    <td><%=GetTurnCent(Rs("SpareClick_Cent"))%>Ԫ</td>
    <td><%
	If Rs("PlanState")=1 Then
	 Response.Write "�����"
	ElseIf Rs("PlanState")=2 Then
	 Response.Write "������"
	ElseIf Rs("PlanState")=3 Then
	 Response.Write "��ͣ��(����Ա����)"
	ElseIf Rs("PlanState")=4 Then
	 Response.Write "Ͷ�����"
	ElseIf Rs("PlanState")=5 Then
	 Response.Write "��ͣ��(���������)"
	End if%></td>
    
<td>
<%
Sql="Select Count(1) From CFWztg_AD where AdState=2 And Plan_ID="&Rs("ID")
Set Rs2 = Conn.Execute(Sql)
Response.write Rs2(0)
Rs2.Close
%>
</td>

<td>
<a href="?Action=planview&Plan_ID=<%=Rs("ID")%>" class="btn_add"><i class="mdi mdi-eye"></i>�鿴</a>

<a href="?Action=planmodify&Plan_ID=<%=Rs("ID")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>�޸�</a>
<%
If Rs("PlanState")=2 Or Rs("PlanState")=4 Then Response.write "<a href='?Action=planchase&Plan_ID="&Rs("ID")&"' class=""btn_add""><i class=""fa fa-plus""></i> ׷�ӻ����Ͷ��</a>"
%>

<%If Rs("PlanState")=2 Then %>
<a href="javascript:;" onclick="$(function () { confirm('��ͣ�ƻ��󣬴˼ƻ����й�涼����ͣͶ�ţ�ȷ��Ҫ��ͣ��?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdUser.aspx?Action=planstop&Plan_ID=<%=Rs("ID")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-stop"></i>��ͣ</a>
<%ElseIf Rs("PlanState")=5 Then %>
<a href="javascript:;" onclick="$(function () { confirm('Ͷ�żƻ��󣬴˼ƻ����й�涼�ῪʼͶ�ţ�ȷ��ҪͶ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdUser.aspx?Action=planstart&Plan_ID=<%=Rs("ID")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_add"><i class="mdi mdi-play"></i>Ͷ��</a>
<%End If%>

<a href="javascript:;" onclick="$(function () { confirm('����ƻ��´����������еĹ���ƻ������״̬��ʱ�����޷�ɾ���ɹ�������ɾ���ƻ��µ����й������ɾ���ƻ�����ƻ�ɾ���ɹ����ƻ��ڵ������˻��˻��ڣ�ȷ��Ҫɾ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdUser.aspx?Action=plandel&Plan_ID=<%=Rs("ID")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>ɾ��</a>

</td>

</tr><%
MyPageSize = MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
