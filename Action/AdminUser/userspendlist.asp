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
UserName=ChkStr(Request("UserName"),1)
SpendState=ChkStr(Request("SpendState"),2)
If Request("SpendType")="" Then SpendType = 0 Else SpendType = CInt(ChkStr(Request("SpendType"),2))

StartDate=ChkStr(Request("StartDate"),3):If StartDate="" Then StartDate="2000-1-1"
EndDate=ChkStr(Request("EndDate"),3):If EndDate="" Then EndDate=Date()


PageUrl = "?Action="&Action&"&UserName="&UserName&"&SpendState="&SpendState&"&SpendType="&SpendType&"&StartDate="&StartDate&"&EndDate="&EndDate

%>

<div class="tabs_header">
<ul class="tabs">
<li <%If SpendType=-1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&SpendType=-1"><span>���н����¼</span></a></li>
<li <%If SpendType=0 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&SpendType=0"><span>ʣ��������¼</span></a></li>
<li <%If SpendType=1 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&SpendType=1"><span>����Ƽ��û������¼</span></a></li>
<li <%If SpendType=2 Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&SpendType=2"><span>������Ʒ�����¼</span></a></li>
</ul>
</div>

<div class="explain">
<%
If SpendType=0 Then
 Response.write "ʣ�������Ͷ�Ź�����룬�Ƽ��û���ɺ�������Ʒ���<br>"
ElseIf SpendType=1 Then
 Response.write "����Ƽ��û�������ϵͳ�Զ����㲢�����û���ʣ������<br>"
ElseIf SpendType=2 Then
 Response.write "������Ʒ������ϵͳ�Զ����㲢�������û�ʣ������<br>"
End If

If RsSet("UserSpendType")=0 Then'�ֹ�����ʱ
  Response.write "��ǰΪ�û��ֹ�������㷽ʽ������Ϊ�û��Զ�������㣬����ϵͳ��������������"
Else
 Response.write "<a href=""javascript:;"" class=""btn btn-primary"" onclick=""$(function () { confirm('ȷ��ҪΪ�����û��ύ����������?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=userautospendsave')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});""><span>Ϊ�����û��ύ��������</span></a>��ǰΪ�Զ����㷽ʽ������"&RsSet("UserSpendType")&"��"
End If

Response.write "����ǰ���õ�ÿ����ͽ����׼" & GetTurnCent(RsSet("LowSpendCent")) & "Ԫ"
%>
</div>




<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>";
 searchurl += '&UserName=' + $('#UserName').val();
 searchurl += '&SpendState=' + $('#SpendState').val();
 searchurl += '&SpendType=' + $('#SpendType').val();
 searchurl += '&StartDate=' + $('#StartDate').val();
 searchurl += '&EndDate=' + $('#EndDate').val();

 location.href=searchurl;
});

});
</script>


<table class="tb_2">
<%
SqlW="DateDiff(d,'"&StartDate&"',SpendTime) >=0 and DateDiff(d,SpendTime,'"&EndDate&"')>=0"
If UserName<>"" Then SqlW=SqlW&" And UserName='"&UserName&"'"
If SpendState<>"" Then SqlW=SqlW&" And SpendState="&SpendState
If SpendType>=0 Then SqlW=SqlW&" And SpendType="&SpendType


Sql="Select sum(Spend_Cent) From CFWztg_Spend Where " & SqlW
Set Rs=Conn.Execute(Sql)
Spend_Cent_Total=Rs(0)
Rs.Close

Sql="Select * From CFWztg_Spend Where "&SqlW&" Order By ID Desc"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
%>

<tr>
<td class="td_r">��վ����</td>
<td><input name="UserName" type="text" id="UserName" value="<%=UserName%>" style="width:60px;"></td>
<td>״̬��</td>
<td><select name="SpendState" id="SpendState">
<option value=""<%If CStr(SpendState)="" Then Response.write " selected"%>>ȫ��</option>
<option value="1"<%If CStr(SpendState)="1" Then Response.write " selected"%>>���������</option>
<option value="2"<%If CStr(SpendState)="2" Then Response.write " selected"%>>����ɹ�</option>
<option value="3"<%If CStr(SpendState)="3" Then Response.write " selected"%>>����ʧ��</option>
</select></td>
<td>���ͣ�</td>
<td><select name="SpendType" id="SpendType">
<option value="-1"<%If SpendType=-1 Then Response.write " selected"%>>ȫ��</option>
<option value="0"<%If SpendType=0 Then Response.write " selected"%>>ʣ�������</option>
<option value="1"<%If SpendType=1 Then Response.write " selected"%>>����Ƽ��û�����</option>
<option value="2"<%If SpendType=2 Then Response.write " selected"%>>������Ʒ���۽���</option>
</select></td>

<td>
��
<input name="StartDate" type="text" id="StartDate" value="<%=StartDate%>" size="8" onclick="fPopCalendar(event,this,this)" onfocus="this.select()"  />
��
<input name="EndDate" type="text" id="EndDate" value="<%=EndDate%>" size="8" onclick="fPopCalendar(event,this,this)" onfocus="this.select()" />
</td>

<td><input type="submit" name="submit" value="��ѯ" class="btn btn-sm btn-primary" id="search"></td>


<td>
<%
v1=weekday(date)

Response.write "&nbsp;&nbsp;<a href='?Action="&action&"&SpendType="&SpendType&"&StartDate="&date()-1&"&EndDate="&date()-1&"'>����</a>"

Response.write "&nbsp;&nbsp;<a href='?Action="&action&"&SpendType="&SpendType&"&StartDate="&date()&"&EndDate="&date()&"'>����</a>"

Response.write "&nbsp;&nbsp;<a href='?Action="&action&"&SpendType="&SpendType&"&StartDate="&dateadd("d",1-v1-7,date)&"&EndDate="&dateadd("d",1-v1-1,date)&"'>����</a>"

Response.write "&nbsp;&nbsp;<a href='?Action="&action&"&SpendType="&SpendType&"&StartDate="&dateadd("m",-1,year(date)&"-"&month(date)&"-1")&"&EndDate="&dateadd("d",-1,year(date)&"-"&month(date)&"-1")&"'>����</a>"

Response.write "&nbsp;&nbsp;<a href='?Action="&action&"&SpendType="&SpendType&"&StartDate="&dateadd("d",1-v1,date)&"&EndDate="&date&"'>����</a>"

Response.write "&nbsp;&nbsp;<a href='?Action="&action&"&SpendType="&SpendType&"&StartDate="&year(date)&"-"&month(date)&"-1&EndDate="&date&"'>����</a>"
%>
</td>

<td>
(�ܼƽ���<%=FormatNumber(Spend_Cent_Total,2,-1,0,0)%>Ԫ)
</td>
</tr>

</table>


<form name="form_spendlist" id="form_spendlist" method="post" action="../../AdminUser.aspx?Action=userspendseldel">
<table class="tb_1">
<tr class="tr_1">
<td><input name="chkall" type="checkbox" id="chkall" onclick="selectcheckbox(this.form)" value="check"></td>
<td>����ID</td>
<td>�û�</td>
<td>������</td>    
<td>����ʱ��</td>
<td>����״̬</td>
<td>��������</td>
<td>���״̬</td>
<td>����Ա˵��</td>
<td>����</td>
</tr>
<%


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
%>
<tr class="tr_2">
<td> 
<%
If Rs("AdminCheck")=1 And (Rs("SpendState")=2 Or Rs("SpendState")=3) Then
 Response.write "<input name='ID_Sel' type='checkbox' id='ID_Sel' value='"&rs("ID")&"'>"
End If
%>
</td>
<td><%=rs("ID")%></td>
<td><%=rs("UserName")%></td>
<td><%=GetTurnCent(rs("Spend_Cent"))%>Ԫ</td>
<td><%=rs("SpendTime")%></td>
<td> 
<%
If Rs("SpendState")=1 Then
Response.Write "���������"
ElseIf Rs("SpendState")=2 Then
Response.Write "����ɹ�"
ElseIf Rs("SpendState")=3 Then
Response.Write "����ʧ��,"&Rs("SpendAbortFeedBack")
End If%>
</td>
<td> 
<%
If Rs("SpendType")=0 Then
 Response.Write "�ֹ�����"
ElseIf Rs("SpendType")=1 Then
 Response.Write "�ƹ����"
ElseIf Rs("SpendType")=2 Then
 Response.Write "��Ʒ�������"
End If%>
</td>
<td>
<%If Rs("AdminCheck")=1 Then
Response.Write "�����"
Else
Response.Write "δ���"
End If%>
</td>

<td> 
<%=Rs("AdminDesc")%>
</td>

<td>
<%If Rs("AdminCheck")=0 Then%>
<a href="?Action=userspendmodify&ID=<%=Rs("ID")%>" class="btn_add"><i class="mdi mdi-pencil"></i>���</a> 
<%End If%>
<%If Rs("AdminCheck")=1 Then%>
<a href="?Action=userspendmodify&ID=<%=Rs("ID")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>�޸�</a> 
<%End If%>
<%If Rs("AdminCheck")=1 And (Rs("SpendState")=2 Or Rs("SpendState")=3) Then%>
<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=userspenddel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> ɾ��</a>

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
</form>

<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ��ѡ��ļ�¼��?', '', function (isConfirm) {if (isConfirm) {$('#form_spendlist').submit();}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-window-close"></i>ɾ��ѡ��</a>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>


