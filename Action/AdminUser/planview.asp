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
Plan_ID=CInt(ChkStr(Request("Plan_ID"),2))
Px = ChkStr(Request("Px"),1):If Px="" Then Px="addtime"
PageUrl = "?Action="&Action&"&Plan_ID="&Plan_ID

Call PxFilter(Px,"ID,AdUserName,Plan_ID,Ad_Class,Unit_Cent_First,OverClick_Cent,AdDeDuct_Rate,AdListShowState,Weight,CycState,ClickState,AddTime")

Sql = "Select a.*,b.planname From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Plan_ID=" & Plan_ID
If Ad_Class = 0 Then
  Sql = Sql & " Order By a."&Px&" Desc"
Else
 If Ad_Class>0 Then
  Sql = Sql & " And a.Ad_Class="&Ad_Class&" Order By a."&Px&" Desc"
 Else
  Sql = Sql & " And a.Ad_Class="&Abs(Ad_Class)&" And a.CycState>0 Order By a."&Px&" Desc"
 End If 
End If


Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.pagesize = 20
 TotalRs=Rs.RecordCount
 TotalPage=Rs.PageCount
 MyPageSize=Rs.PageSize
 FixedSize=Rs.PageSize
 Rs.AbsolutePage=Page
End If

%>

<a href="?Action=planlist" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<table class="tb_2">
<tr>
<td><span class="title">���ƻ� <%=Rs("planname")%>[<%=Plan_ID%>] �µ��������еĹ��<a name="adnav" id="adnav"></a></span></td>
</tr>
</table>


<form name="form_adlist" id="form_adlist" method="post" action="">
<table class="tb_1">
<tr class="tr_1">
<td><input name="chkall" type="checkbox" id="chkall" onclick="selectcheckbox(this.form)" value="check"></td>
<td><a href="<%=PageUrl%>&Px=ID">���</a></td>
<td><a href="<%=PageUrl%>&Px=Ad_Class">�������</a></td>
<td><a href="<%=PageUrl%>&Px=Unit_Cent_First">����</a></td>
<td><a href="<%=PageUrl%>&Px=OverClick_Cent">���</a></td>
<td><a href="<%=PageUrl%>&Px=AdDeDuct_Rate">�۵���</a></td>
<td><a href="<%=PageUrl%>&Px=AdListShowState">�б�</a></td>
<td><a href="<%=PageUrl%>&Px=Weight">Ȩ��</a></td>
<td><a href="<%=PageUrl%>&Px=CycState">��ѭ</a></td>
<td><a href="<%=PageUrl%>&Px=ClickState">�Ʒ�ģʽ</a></td>
<td>����</td>
</tr>
 
<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2">
<td> 
<%
Response.write "<input name='ID_Sel' type='checkbox' id='ID_Sel' value='"&rs("ID")&"'>"
%>
</td>
<td><%=Rs("AdName")&"["&Rs("ID")&"]"%></td>
<td>
<%
Response.write GetAdClassName(Rs("Ad_Class"))
GGXG = ""
If Rs("Ad_Class")=7 Then
 Sql="Select * From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_AdCode' And SetFlag='"&Rs("AdShowType")&"'"
 Set Rs2=Conn.Execute(Sql)
 If Rs2.Eof Then
  Response.write "<br>���Ч��δѡ��"
 Else
  GGXG = Rs2("SetDesc")
  Response.write "<br>"&GGXG  
 End If
ElseIf Rs("Ad_Class")=11 Then
 Sql="Select * From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_MixCode' And SetFlag='"&Rs("AdShowType")&"'"
 Set Rs2=Conn.Execute(Sql)
 If Rs2.Eof Then
  Response.write "<br>���Ч��δѡ��"
 Else
  GGXG = Rs2("SetDesc")
  Response.write "<br>"&GGXG  
 End If
End If
%>
</td>
<td><%=GetTurnCent(Rs("Unit_Cent_First"))%>Ԫ</td>
<td><%=GetTurnCent(Rs("OverClick_Cent"))%>Ԫ</td>
<td><%=Rs("AdDeDuct_Rate")%>%</td>
<td>
<%
If Rs("AdListShowState")=1 Then
 Response.Write Rs("ListID")
Else
 Response.Write "����ʾ"
End if
%>
</td>
<td>
<%=Rs("Weight")%>
</td>

<td>
<%
If Rs("CycState")=0 Then
 Response.Write "��"
Else
 Response.Write "��"
End if
%>
</td>
<td>
<%
If Rs("ClickState")=1 Then
 If Rs("Ad_Class")=8 Or Rs("Ad_Class")=9 Then
  Response.Write "��������"
 ElseIf Rs("Ad_Class")=7 Then
  If Instr(GGXG,"����")>0 Then
   Response.Write "��������"
  Else
   Response.Write "�������(CPC)"
  End If
 ElseIf Rs("Ad_Class")=1 Then
   Response.Write "����򵯳�����"
 Else
  Response.Write "�������(CPC)"
 End If
ElseIf Rs("ClickState")=2 Then
 Response.Write "��ʾ����(CPV)"
ElseIf Rs("ClickState")=3 Then
 Response.Write "ע�����(CPA)"
ElseIf Rs("ClickState")=4 Then
 Response.Write "��Ʒ����(CPS)"
End If

If Rs("ClickSeState")=1 Then
  Response.Write "<br>[��Ҫ�Ʒ�:CPC]"
ElseIf Rs("ClickSeState")=2 Then
 Response.Write "<br>[��Ҫ�Ʒ�:CPV]"
End If
%>
</td>
<td>
<a href="?Action=admodify&ID=<%=Rs("ID")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>�޸�</a>

<a href="javascript:;" onclick="$(function () { confirm('ȷ��Ҫ����Ա��ͣ��������?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=adstop&ID=<%=Rs("ID")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-stop"></i>��ͣ</a>

<a href="javascript:;" onclick="$(function () { confirm('ȷ��Ҫɾ����������?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=addel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>ɾ��</a>

<a href="../../cf.aspx?Action=adview&ID=<%=Rs("ID")%>" target="_blank" class="btn_add"><i class="mdi mdi-eye"></i>Ԥ��</a>
</td>
</tr>
<%
MyPageSize=MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>

</table>
</form>

<a href="javascript:;" onclick="$(function () { confirm('ȷ��Ҫ��ͣѡ�����Щ�����?', '', function (isConfirm) {if (isConfirm) {$('#form_adlist').attr('action','../../AdminUser.aspx?Action=adselstop');$('#form_adlist').submit();}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-stop"></i>��ͣѡ��</a>

<a href="javascript:;" onclick="$(function () { confirm('ȷ��Ҫɾ��ѡ�����Щ�����?', '', function (isConfirm) {if (isConfirm) {$('#form_adlist').attr('action','../../AdminUser.aspx?Action=adseldel');$('#form_adlist').submit();}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-window-close"></i>ɾ��ѡ��</a>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>