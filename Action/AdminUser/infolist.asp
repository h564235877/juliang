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
Assort=ChkStr(Request("Assort"),2)

PageUrl = "?Action="&Action&"&Assort="&Assort

Sql="Select * From CFWztg_SysInfo Where 1=1"
If Assort<>"" Then Sql=Sql&" And Assort="&Assort
Sql=Sql&" Order By ListID Desc,ID Desc"

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

<a href="?Action=infoadd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>���ӹ���Ͱ���</span></a>

<form name="form_infolist" id="form_infolist" method="post" action="../../AdminUser.aspx?Action=infoseldel">
<table class="tb_1">
<tr class="tr_1"> 
<td><input name="chkall" type="checkbox" id="chkall" onclick="selectcheckbox(this.form)" value="check"></td>
<td>����</td>
<td>����</td>
<td>ʱ ��</td>
<td>�ö�����</td>
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
<td>
<%
If Rs("Assort")=1 Then
 Response.Write "��վ������"
ElseIf Rs("Assort")=2 Then
 Response.Write "���������"
ElseIf Rs("Assort")=3 Then
 Response.Write "��վ����������"
ElseIf Rs("Assort")=4 Then
 Response.Write "�������������"
End If
%>
</td>
<td><%=rs("Title")%></td>
<td><%=rs("AddTime")%></td>
<td><%=rs("ListID")%></td>
<td><a href="?Action=infomodify&id=<%=rs("id")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>�޸�</a>


<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=infodel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>ɾ��</a>
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

<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ��ѡ��ļ�¼��?', '', function (isConfirm) {if (isConfirm) {$('#form_infolist').submit();}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-window-close"></i>ɾ��ѡ��</a>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>


<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>";
 searchurl += '&assort=' + $('#assort').val();

 location.href=searchurl;
});

});
</script>

<table class="tb_3">
<tr class="tr_1"> 
<td colspan="14">��ѯ</td>
</tr>

<tr>
<td class="td_r">ѡ�����</td>
<td>

<select name="assort" id="assort">
<option value="">ȫ������</option>
<%

Sql="Select * From CFWztg_SysInfoClass Order By ID"
Set Rs2= Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
While Not Rs2.Eof
%>
<option value="<%=Rs2("ID")%>"<%If Assort=CStr(Rs2("ID")) Then Response.write " selected"%>><%=Rs2("InfoClassName")%></option>
<%
Rs2.MoveNext
Wend
Rs2.Close
%>
</select>
</td>
</tr>
<tr>
<td></td>
<td><input type="submit" name="submit" value="��ѯ" class="btn btn-primary" id="search"></td>
</tr>
</table>
