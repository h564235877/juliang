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
If Request("ExpendType")="" Then ExpendType = 0 Else ExpendType = CInt(ChkStr(Request("ExpendType"),2))

PageUrl = "?Action="&Action&"&ExpendType="&ExpendType

MaxListRs = 2000

Sql="SELECT "
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AdUser_Expend Where AdminCheck=0) ExpendNum_0,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AdUser_Expend Where AdminCheck=0 And ExpendType=1) ExpendNum_1,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AdUser_Expend Where AdminCheck=0 And ExpendType=2) ExpendNum_2,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AdUser_Expend Where AdminCheck=0 And ExpendType=3) ExpendNum_3"
Set Rs=Conn.Execute(Sql)

%>
<div class="tabs_header">
<ul class="tabs">
<div class="tabs_header">
<ul class="tabs">
<li <%If ExpendType=0 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ExpendType=0"><span>����[<%=Rs("ExpendNum_0")%>]</span></a></li>
<li <%If ExpendType=1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ExpendType=1"><span>�·����ƻ�[<%=Rs("ExpendNum_1")%>]</span></a></li>
<li <%If ExpendType=2 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ExpendType=2"><span>�ƻ�׷�ӻ���[<%=Rs("ExpendNum_2")%>]</span></a></li>
<li <%If ExpendType=3 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ExpendType=3"><span>�¹�淢�����[<%=Rs("ExpendNum_3")%>]</span></a></li>
</ul>
</div>
</ul>
</div>

<div class="explain">
[]�ڵ�����Ϊδ�������</div>

<table class="tb_1">
<tr class="tr_1"> 
<td>���ѱ��</td>
<td>�����</td>
<td>�ƻ�ID</td>
<td>���ID</td>
<td>�û�</td>
<td>����</td>
<td>���ѽ��</td>
<td>��;</td>
<td>����ʱ��</td>
<td>�������</td>
<td>���״̬</td>
<td>˵��</td>
<td>���ʱ��</td>
<td>����</td>
</tr>
<%

Sql="Select Top "&MaxListRs&" * From CFWztg_AdUser_Expend Where 1=1"

If ExpendType>0 Then Sql=Sql&" And ExpendType="&ExpendType

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

If TotalRs = MaxListRs Then Response.write "��¼̫�ֻ࣬������"&MaxListRs&"��"

While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td><%=Rs("ID")%></td>
<td><%=Rs("AdUserName")%></td>
<td>
<%
Response.write Rs("Plan_ID")
If Rs("Plan_ID")>0 Then
 Sql="Select PlanName From CFWztg_Plan Where ID=" & Rs("Plan_ID")
 Set Rs2=Conn.Execute(Sql)
 Response.write "<br>[" & Rs2("PlanName")&"]"
 Rs2.Close
End If
%>
</td>
<td>
<%
Response.write Rs("Ad_ID")
If Rs("Ad_ID")>0 Then
 Sql="Select AdName,Ad_Class From CFWztg_AD Where ID=" & Rs("Ad_ID")
 Set Rs2=Conn.Execute(Sql)
 Response.write "<br>[" & Rs2("AdName")&"]"
 Response.write "<br>[" & GetAdClassName(Rs2("Ad_Class"))&"]"
 Response.write "<br />[<a href='?Action=admodify&ID="&Rs("Ad_ID")&"'>�޸�</a>]"
 Response.write "<br />[<a href='../../cf.aspx?Action=adview&ID="&Rs("Ad_ID")&"' target='_blank'>�鿴</a>]"
End If
%>
</td>
<td><%=Rs("AdUserName")%></td>
<td><%=Rs("ChaseClickNum")%></td>
<td><%=GetTurnCent(Rs("Expend_Cent"))%>Ԫ</td>
<td width="100" style="word-wrap: break-word;word-break:break-all;"><%=Rs("ExpendDesc")%></td>
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
%>
</td>
<td>
<%If Rs("AdminCheck")=1 Then
Response.Write "�����"
Else
Response.Write "<font color='FF0000'>δ���</font>"
End If%>
</td>
<td><%=Rs("AdminDesc")%></td>
<td><%=Rs("AdminSpendTime")%></td>
<td>
<%If Rs("AdminCheck")=0 Then%>
<a href="?Action=aduserexpendmodify&ID=<%=Rs("ID")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>���</a> 
<%End If%>
<%If Rs("AdminCheck")=1 Then%>
<a href="?Action=aduserexpendmodify&ID=<%=Rs("ID")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>�޸�</a> 
<%End If%>
<%If Rs("AdminCheck")=1 And Rs("ExpendState")=3 Then%>
<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=aduserexpenddel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> ɾ��</a>
<%End If%>
</td>
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