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
CheckState=CInt(ChkStr(Request("CheckState"),2))

PageUrl = "?Action="&Action&"&CheckState="&CheckState

Sql="Select a.* From CFWztg_AD_Check a inner join CFWztg_AD b on a.ad_id=b.id Where 1=1"
If CheckState<>0 Then Sql=Sql&" And a.CheckState="&CheckState
Sql=Sql&" Order By a.CheckState,a.LastTime Desc"

Set Rs = Server.CreateObject("Adodb.RecordSet")
Rs.Open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.pagesize=20
 TotalRs=Rs.RecordCount
 TotalPage=Rs.PageCount
 MyPageSize=Rs.PageSize
 FixedSize=rs.pagesize
 Rs.AbsolutePage=Page
End If
%>


<table class="tb_2">
<tr> 
<td>
<select id='checkstate' onChange="window.location=document.getElementById('checkstate').options[document.getElementById('checkstate').selectedIndex].value">
<option value="?Action=adcheck&CheckState=0"<%If CheckState=0 Then Response.Write " selected"%>>ȫ�����״̬</option>
<option value="?Action=adcheck&CheckState=1"<%If CheckState=1 Then Response.Write " selected"%>>�ȴ����</option>
<option value="?Action=adcheck&CheckState=2"<%If CheckState=2 Then Response.Write " selected"%>>��˳ɹ�</option>
<option value="?Action=adcheck&CheckState=3"<%If CheckState=3 Then Response.Write " selected"%>>���ʧ��</option>
</select>
</td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td>���ID</td>
<td>���״̬</td>
<td>�ύʱ��</td>
<td>����</td>
</tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td><%=Rs("AD_ID")%></td>
<td>
<%
If Rs("CheckState")=1 Then
 Response.write "�����"
ElseIf Rs("CheckState")=2 Then
 Response.write "��˳ɹ�"
ElseIf Rs("CheckState")=3 Then
 Response.write "���ʧ��"
End If
%>
</td>
<td><%=Rs("LastTime")%></td>
<td>
<a href='?Action=adcheckmodify&Ad_ID=<%=Rs("Ad_ID")%>' class="btn_edit"><i class="mdi mdi-pencil"></i> ���</a>
<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=adcheckdel&Ad_ID=<%=Rs("Ad_ID")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> ɾ��</a>
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
</td>
</tr>
</table>