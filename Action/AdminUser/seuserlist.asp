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
UserID=ChkStr(Request("UserID"),2)
UserName=ChkStr(Request("UserName"),1)
ComVisit=ChkStr(Request("ComVisit"),2)
SpareState=ChkStr(Request("SpareState"),2)
UserLevel=ChkStr(Request("UserLevel"),2)
UserState=ChkStr(Request("UserState"),2)
DeductState=ChkStr(Request("DeductState"),2)
AgentPower=ChkStr(Request("AgentPower"),2)

PageUrl = "?Action="&Action&"&UserID="&UserID&"&UserName="&UserName&"&UserState="&UserState

Call PxFilter(Px,"ID,UserName,Total_Cent,Spare_Cent,UserState,UserTcRate,UserTotal,QQ")

Sql="Select * From CFWztg_User where UserType=3"

 IF UserID<>"" Then Sql=Sql&" And ID="&UserID
 IF UserName<>"" Then Sql=Sql&" And UserName = '"&UserName&"'"
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

<a href="?Action=seuseradd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>�ͷ�����</span></a>


<form name="form_userlist" id="form_userlist" method="post" action="../../AdminUser.aspx?Action=userseldel">
<table class="tb_1">
  <tr class="tr_1"> 

    <td><a href="<%=PageUrl%>&Px=ID">�ͷ�ID</a></td>
    <td><a href="<%=PageUrl%>&Px=UserName">�ͷ���</a></td>
    <td><a href="<%=PageUrl%>&Px=Total_Cent">������</a></td>
    <td><a href="<%=PageUrl%>&Px=Spare_Cent">δ����</a></td>
    <td><a href="<%=PageUrl%>&Px=UserState">״̬</a></td>
    <td><a href="<%=PageUrl%>&Px=UserTcRate">�ؿ���</a></td>
    <td><a href="<%=PageUrl%>&Px=UserTotal">������վ������</a></td>
    <td><a href="<%=PageUrl%>&Px=QQ">QQ����</a></td>
     <td><a href="javascript:;">����</a></td>
     
<%
While Not Rs.Eof And MyPageSize>0
%>

  <tr class="tr_2"> 

      <td><%=Rs("ID")%></td>
      <td><%=Rs("UserName")%></td>
      <td><%=GetTurnCent(Rs("Total_Cent"))%>Ԫ</td>
      <td><%=GetTurnCent(Rs("Spare_Cent"))%>Ԫ</td>
      <td>
        
  <%
If Rs("UserState")=0 Then
 Response.Write "��Ч"
ElseIf Rs("UserState")=1 Then
 Response.Write "��Ч"
ElseIf Rs("UserState")=2 Then
 Response.Write "�ʼ������"
ElseIf Rs("UserState")=3 Then
 Response.Write "����Ա�����"
End If
%>
      </td>
      <td><%=Rs("UserTcRate")%>%</td>
	  <td><%=Rs("UserTotal")%></td>
      <td><a href="http://wpa.qq.com/msgrd?v=3&uin=<%=Rs("QQ")%>&site=qq&menu=yes" target="_blank"><%=Rs("QQ")%></a></td>
      <td>
<a href="?Action=seusermodify&SeUserName=<%=rs("UserName")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>�޸�</a>

<a href="javascript:;" onclick="$(function () { confirm('�����»�����վ��ʱ�ͷ��޷�ɾ��������ת�ơ�ɾ��ǰ��ȷ���˿ͷ�û��ʣ���ȷ��Ҫɾ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=seuserdel&SeUserName=<%=rs("UserName")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>ɾ��</a>

<a href="?Action=seuserlowmove&SeUserName=<%=rs("UserName")%>" class="btn_add"><i class="mdi mdi-cursor-move"></i>ת��</a>
<a href="?Action=seusergo&SeUserName=<%=rs("UserName")%>" target="_blank" class="btn_add"><i class="mdi mdi-eye"></i>�鿴</a>
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



 if(isNaN($('#UserID').val())){
  alert('�û�ID����������', '', function () {$("#UserID").focus();});
  return false
 }


 var searchurl ="?Action=<%=Action%>";
 searchurl += '&UserID=' + $('#UserID').val();
 searchurl += '&UserName=' + $('#UserName').val();
 searchurl += '&UserState=' + $('#UserState').val();
 location.href=searchurl;
});

});

</script> 

<table class="tb_3"><tr class="tr_1"> 
<td colspan="2">��ѯ</td>
</tr>  
<tr>
<td class="td_r" width="80">�ͷ�ID��</td>
<td><input name="UserID" type="text" id="UserID" value="<%=UserID%>"></td>
</tr>    
<tr>
<td class="td_r">�ͷ�����</td>
<td><input name="UserName" type="text" id="UserName" value="<%=UserName%>"></td>
</tr>
<tr>
<td class="td_r">�ʺ�״̬��</td>
<td><select name="UserState" id="UserState">
<option value=""<%If CStr(UserState)="" Then Response.write " selected"%>>ȫ��</option>
<option value="0"<%If CStr(UserState)="0" Then Response.write " selected"%>>��Ч</option>
<option value="1"<%If CStr(UserState)="1" Then Response.write " selected"%>>��Ч</option>
<option value="2"<%If CStr(UserState)="2" Then Response.write " selected"%>>�ʼ������</option>
<option value="3"<%If CStr(UserState)="3" Then Response.write " selected"%>>����Ա�����</option>
</select></td>
</tr>


<tr>
<td></td>
<td><input type="submit" name="submit" value="��ѯ" class="btn btn-sm btn-primary" id="search"></td>
</tr>
</table>
