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

PageUrl = "?Action="&Action&"&UserName="&UserName

Sql="Select * From CFWztg_UserDeduct where 1=1"
IF UserName<>"" Then Sql=Sql&" And UserName Like '%"&UserName&"%'"
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

<table class="tb_2">
<tr>
<td>
<div class="explain">
1.�ۿ����������ͨ�û��б�ѡ���û������,����ֻ�г�����Ա���û�����ļ�¼��<br>
2.���۵Ŀ�����˻ظ����������������Ա����!���壺�������淢������=�û��Ľ������+����Ա�ֹ��۳��û��Ŀ���+���õĿ۵��ʿ۵Ŀ���
</div>
</td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td>��վ��</td>
<td>�۳�����</td>
<td>�ۿ�ʱ��</td>
<td>����</td>
</tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td><%=rs("UserName")%></td>
<td><%=GetTurnCent(Rs("Deduct_Cent"))&"Ԫ"%></td>
<td><%=rs("AddTime")%></td>
<td>
<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=userdeductdel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> ɾ��</a>
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

<form name="form2" method="post" action="?Action=<%=Action%>">
<table class="tb_3">
<tr>
<td>��վ����</td>
<td><input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="10"></td>
<td><input type="submit" name="submit" value="��ѯ" class="btn btn-sm btn-primary"></td>
</TR>
</table>
</form>