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
Px=ChkStr(Request("Px"),1):If Px="" Then  Px="ID"
AdUserName=ChkStr(Request("AdUserName"),1)
UserState=ChkStr(Request("UserState"),2)

PageUrl = "?Action="&Action&"&AdUserName="&AdUserName&"&UserState="&UserState

Call PxFilter(Px,"ID,UserName,Total_Cent,Spend_Cent,Spare_Cent,UserState,QQ")

Sql="Select Top 2000 * From CFWztg_User where UserType=2"

IF AdUserName<>"" Then Sql=Sql&" And UserName Like '%"&AdUserName&"%'"
IF UserState<>"" Then Sql=Sql&" And UserState="&UserState


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


<a href="?Action=aduseradd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>���������</span></a>

<form name="form4" method="post" action="?Action=delseluser">
<table class="tb_1">
<tr class="tr_1"> 
<td><a href="<%=PageUrl%>&Px=ID">�����ID</a></td>
<td><a href="<%=PageUrl%>&Px=AdUserName">������û���</a></td>
<td><a href="<%=PageUrl%>&Px=Total_Cent">�ܽ��</a></td>
<td><a href="<%=PageUrl%>&Px=Spend_Cent">�ѻ���</a></td>
<td><a href="<%=PageUrl%>&Px=Spare_Cent">ʣ����</a></td>
<td><a href="<%=PageUrl%>&Px=UserState">�˺�״̬</a></td>
<td><a href="<%=PageUrl%>&Px=QQ">QQ����</a></td>
<td>����</td>
</tr>
  
<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td><%=Rs("ID")%></td>
<td><%=Rs("UserName")%></td>
<td><%=GetTurnCent(Rs("Total_Cent"))%>Ԫ</td>
<td><%=GetTurnCent(Rs("Spend_Cent"))%>Ԫ</td>
<td><%=GetTurnCent(Rs("Spare_Cent"))%>Ԫ</td>
<td><%
If Rs("UserState")=0 Then
 Response.Write "<font color=#ff0000>��Ч</font>"
ElseIf Rs("UserState")=1 Then
 Response.Write "��Ч"
ElseIf Rs("UserState")=2 Then
 Response.Write "�ʼ������"
ElseIf Rs("UserState")=3 Then
 Response.Write "����Ա�����"
End If
%></td>
<td><a href="http://wpa.qq.com/msgrd?v=3&uin=<%=Rs("QQ")%>&site=qq&menu=yes" target="_blank"><%=Rs("QQ")%></a></td>

<td>
<a href="?Action=adusermodify&AdUserName=<%=rs("UserName")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>�޸�</a>
<a href="javascript:;" onclick="$(function () { confirm('ɾ��ǰ��ȷ�����û�û��ʣ���ȷ��Ҫɾ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=aduserdel&AdUserName=<%=rs("UserName")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>ɾ��</a>
<a href="?Action=adusergo&AdUserName=<%=rs("UserName")%>" target="_blank" class="btn_add"><i class="mdi mdi-eye"></i>�鿴</a>
</td>

</tr>
<%
Rs.MoveNext
MyPageSize=MyPageSize-1
Wend
Rs.Close
%>

</table>
</form>
       

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>       
  

<script>
$(function(){

$("#search").click(function(){

 var searchurl ="?Action=<%=Action%>";
 searchurl += '&AdUserName=' + $('#AdUserName').val();
 searchurl += '&UserState=' + $('#UserState').val();

 location.href=searchurl;
});

});

</script> 

<table class="tb_3">
<tr> 
<td>������û���</td>
<td><input name="AdUserName" type="text" id="AdUserName" value="<%=AdUserName%>"size="10"></td>
<td>�ʺ�״̬</td>
<td><select name="UserState" id="UserState">
<option value=""<%If CStr(UserState)="" Then Response.write " selected"%>>ȫ��</option>
<option value="0"<%If CStr(UserState)="0" Then Response.write " selected"%>>��Ч</option>
<option value="1"<%If CStr(UserState)="1" Then Response.write " selected"%>>��Ч</option>
<option value="2"<%If CStr(UserState)="2" Then Response.write " selected"%>>�ʼ������</option>
<option value="3"<%If CStr(UserState)="3" Then Response.write " selected"%>>����Ա�����</option>
</select></td>
<td><input type="submit" name="submit" value="��ѯ" class="btn btn-sm btn-primary" id="search"></td>
</tr>
</table>