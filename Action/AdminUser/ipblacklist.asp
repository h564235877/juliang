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
IP=ChkStr(Request("IP"),1)
IpType=ChkStr(Request("IpType"),2)
Px=ChkStr(Request("Px"),1):If Px="" Then  Px="AddTime"

Ip_1=0
Ip_2=0
Ip_3=0

If Instr(IP,":")=0 And Instr(IP,".")>0 Then
 MyArray = Split(IP, ".") 
 If Ubound(MyArray)>=2 Then
  Ip_1 = CInt(MyArray(0))
  Ip_2 = CInt(MyArray(1))
  Ip_3 = CInt(MyArray(2))
 End If
End If
%>

<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>";
 searchurl += '&IP=' + $('#IP').val();
 searchurl += '&IpType=' + $('#IpType').val();

 location.href=searchurl;
});

});
</script>

<table class="tb_1">
<tr> 
<td>
IP

<input name="IP" type="text" id="IP" value="<%=IP%>" size="10">


<select name="IpType" id="IpType">
<option value=""<%If IpType="" Then Response.write " selected"%>>ȫ������</option>
<option value="1"<%If IpType="1" Then Response.write " selected"%>>����IP</option>
<option value="2"<%If IpType="2" Then Response.write " selected"%>>IP��C��</option>
</select>



<input type="submit" name="submit" value="��ѯ" class="btn btn-sm btn-primary" id="search">

<a href="?Action=ipblacklistadd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>�ֹ�����IP������</span></a>
<a href="?Action=ipblacklistmoreadd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>��������IP������</span></a>
</td>

</tr>
</table>





<table class="tb_2">
<tr>
<td><div class="explain">
�����������򣬿������ں��������ip�����Ч��
IP���������ñ���������<%if rs("IpBlackListOpen")=1 then Response.write "��" else Response.write "��"%>��
��ЧIP�����ˢIP�ĵ������ͼ���IP��ʱ������������<%if rs("IpBlackFlagOpen")=1 then Response.write "��" else Response.write "��"%>��
��ЧIP�����ˢIP��C�����ͼ���IP��ʱ������������<%if rs("IpSegmentBlackFlagOpen")=1 then Response.write "��" else Response.write "��"%>
</div>
</td>
</tr>
</table>

<%
PageUrl = "?Action="&Action&"&IP="&IP&"&IpType="&IpType

Call PxFilter(Px,"AddTime,IP_1,IP_2,IP_3,IP,IpType,AddTime")



Sql="Select * From CFWztg_IpBlackList Where 1=1"

If IpType="" Then
 If IP<>"" Then Sql=Sql&" And IP='"&IP&"' Or (Ip_1="&Ip_1&" And Ip_2="&Ip_2&" And Ip_3="&Ip_3&")"

ElseIf IpType="1" Then
 If IP<>"" Then Sql=Sql&" And IpType=1 And IP='"&IP&"'" Else Sql=Sql&" And IpType=1"
 
ElseIf IpType="2" Then
 If IP<>"" Then Sql=Sql&" And IpType=2 And (Ip_1="&Ip_1&" And Ip_2="&Ip_2&" And Ip_3="&Ip_3&")" Else Sql=Sql&" And IpType=2"
 
End If


Sql=Sql&" Order By "&Px&" Desc"


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

<form name="form_ipblacklist" id="form_ipblacklist" method="post" action="../../AdminUser.aspx?Action=ipblacklistseldel">
<table class="tb_1">
<tr class="tr_1"> 
<td><input name="chkall" type="checkbox" id="chkall" onclick="selectcheckbox(this.form)" value="check"></td>
<td><a href="<%=PageUrl%>&Px=AddTime">���</a></td>
<td><a href="<%=PageUrl%>&Px=IP_1">IP��A��</a></td>
<td><a href="<%=PageUrl%>&Px=IP_2">IP��B��</a></td>
<td><a href="<%=PageUrl%>&Px=IP_3">IP��C��</a></td>
<td><a href="<%=PageUrl%>&Px=IP">IP��ַ</a></td>
<td><a href="<%=PageUrl%>&Px=IpType">����������</a></td>
<td><a href="<%=PageUrl%>&Px=AddTime">����ʱ��</a></td>
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
<td style="font-weight:bold;"><%=Rs.RecordCount-Rs.Pagesize*(Page)+MyPageSize%></td>
<td><%=rs("Ip_1")%></td>
<td><%=rs("Ip_2")%></td>
<td><%=rs("Ip_3")%></td>
<td><%=rs("Ip")%></td>
<td><%
If Rs("IpType")=1 Then
 Response.Write "�ⵥ��IP"
ElseIf Rs("IpType")=2 Then
 Response.Write "��IP��C��"
End If
%></td>
<td><%=rs("AddTime")%></td>
<td><a href="?Action=ipblacklistmodify&id=<%=rs("id")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>�޸�</a>
  <a href="javascript:;" onclick="$(function () { confirm('ȷ��Ҫɾ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=ipblacklistdel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>ɾ��</a>
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

<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ��ѡ��ļ�¼��?', '', function (isConfirm) {if (isConfirm) {$('#form_ipblacklist').submit();}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-window-close"></i>ɾ��ѡ��</a>

<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫ������м�¼��?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=ipblacklistalldel')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btnyellow"><i class="mdi mdi-window-close"></i> ������м�¼</a>

<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ�����е���IP��¼��?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=ipblacklistallipdel')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btnyellow"><i class="mdi mdi-window-close"></i> ɾ�����е���IP��¼</a>

<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ������IP�μ�¼��?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=ipblacklistallipsegdel')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btnyellow"><i class="mdi mdi-window-close"></i> ɾ������IP�μ�¼</a>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
