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
UserTeam=ChkStr(Request("UserTeam"),2)
UserState=ChkStr(Request("UserState"),2)
AgentPower=ChkStr(Request("AgentPower"),2)
QQ=ChkStr(Request("QQ"),1)



PageUrl = "?Action="&Action&"&UserID="&UserID&"&UserName="&UserName&"&ComVisit="&ComVisit&"&UserState="&UserState&"&SpareState="&SpareState&"&UserTeam="&UserTeam&"&AgentPower="&AgentPower&"&QQ="&QQ

Call PxFilter(Px,"ID,UserName,Total_Cent,Spend_Cent,Spare_Cent,AdShowNum,ComVisit,ComReg,UserState,CpcDeDuct_Rate,CpmDeDuct_Rate,UserTeam,AddTime,LastTime,QQ")
%>

<a href="?Action=useradd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>��վ������</span></a>

<script>
$(function(){

$("#search2").click(function(){
 
 var searchurl = "?Action=<%=Action%>";
 searchurl += '&UserName=' + $('#UserName2').val(); 
 searchurl += '&UserID=' + $('#UserID2').val(); 

 location.href=searchurl;
});

});
</script>
<table class="tb_2">
<tr>
<td>
�û���<input name="UserName" type="text" id="UserName2" value="<%=UserName%>" style="width:80px;">
�û�ID<input name="UserID" type="text" id="UserID2" value="<%=UserID%>" style="width:50px;">
<input type="submit" name="search"  id="search2" value="��ѯ" class="btn btn-sm btn-primary"></td>
</tr>
</table>

<%


Sql="Select Count(1) From CFWztg_User"
Set Rs= Conn.Execute(Sql)
UserTotal=Rs(0)


Sql="Select Top 2000 * From CFWztg_User where UserType=1"

 IF UserID<>"" Then Sql=Sql&" And ID="&UserID
 IF UserName<>"" Then Sql=Sql&" And UserName = '"&UserName&"'"
 IF ComVisit<>"" Then Sql=Sql&" And ComVisit>="&ComVisit
 IF UserTeam<>"" Then Sql=Sql&" And UserTeam="&UserTeam
 IF UserState<>"" Then Sql=Sql&" And UserState="&UserState
 IF SpareState="0" Then Sql=Sql&" And Spare_Cent=0"
 IF SpareState="1" Then Sql=Sql&" And Spare_Cent>0"
 IF AgentPower<>"" Then Sql=Sql&" And AgentPower="&AgentPower
 IF QQ<>"" Then Sql=Sql&" And QQ = '"&QQ&"'"

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


<form name="form_userlist" id="form_userlist" method="post" action="../../AdminUser.aspx?Action=userseldel">
<table class="tb_1">
<tr class="tr_1"> 
<td><input name="chkall" type="checkbox" id="chkall" onclick="selectcheckbox(this.form)" value="check"></td>
<td><a href="<%=PageUrl%>&Px=ID">�û�ID</a></td>
<td><a href="<%=PageUrl%>&Px=UserName">��վ��</a></td>
<td><a href="<%=PageUrl%>&Px=Total_Cent">������</a></td>
<td><a href="<%=PageUrl%>&Px=Spare_Cent">δ����</a></td>
<td><a href="<%=PageUrl%>&Px=AdShowNum">��ʾ</a></td>
<td><a href="<%=PageUrl%>&Px=ComVisit">���</a></td>
<td><a href="<%=PageUrl%>&Px=ComReg">ע��</a></td>
<td><a href="<%=PageUrl%>&Px=UserState">״̬</a></td>
<td><a href="<%=PageUrl%>&Px=CpcDeDuct_Rate">cpc�۵�</a></td>
<td><a href="<%=PageUrl%>&Px=CpmDeDuct_Rate">cpv�۵�</a></td>
<td><a href="<%=PageUrl%>&Px=UserTeam">����</a></td>
<td><a href="<%=PageUrl%>&Px=QQ">QQ����</a></td>
<td><a href="<%=PageUrl%>&Px=AddTime">ע��ʱ��</a></td>
<td><a href="<%=PageUrl%>&Px=LastTime">������</a></td>
<td><a href="javascript:;">����</a></td>
<tr class="tr_2">

<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td> 
<%
If rs("UserName")<>"mytest" Then
Response.write "<input name='UserName_Sel' type='checkbox' id='UserName_Sel' value='"&rs("UserName")&"'>"
End If
%>
</td>
<td><%=Rs("ID")%></td>
<td><%=Rs("UserName")%></td>
<td><%=GetTurnCent(Rs("Total_Cent"))%>Ԫ</td>
<td><%=GetTurnCent(Rs("Spare_Cent"))%>Ԫ</td>
<td><%=Rs("AdShowNum")%></td>
<td><%=Rs("ComVisit")%></td>
<td><%=Rs("ComReg")%></td>
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
<td><%=Rs("CpcDeDuct_Rate")%>%</td>
<td><%=Rs("CpmDeDuct_Rate")%>%</td>
<td><%=Rs("UserTeam")%></td>
<td><a href="http://wpa.qq.com/msgrd?v=3&uin=<%=Rs("QQ")%>&site=qq&menu=yes" target="_blank"><%=Rs("QQ")%></a></td>
<td title="<%=Rs("AddTime")%>"><%=Year(Rs("AddTime"))&"-"&Month(Rs("AddTime"))&"-"&Day(Rs("AddTime"))%></td>
<td title="<%=Rs("LastTime")%>"><%=Year(Rs("LastTime"))&"-"&Month(Rs("LastTime"))&"-"&Day(Rs("LastTime"))%></td>
<td>
<a href="?Action=usermodify&UserName=<%=rs("UserName")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>�޸�</a>

<%If rs("UserName")<>"mytest" Then%>
<a href="javascript:;" onclick="$(function () { confirm('ɾ��ǰ��ȷ�����û�û��ʣ���ȷ��Ҫɾ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=userdel&UserName=<%=Rs("UserName")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>ɾ��</a>
<%End If%>

<a href="?Action=usergo&UserName=<%=rs("UserName")%>" target="_blank" class="btn_add"><i class="mdi mdi-eye"></i> �鿴</a>
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

<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ��ѡ��ļ�¼��?', '', function (isConfirm) {if (isConfirm) {$('#form_userlist').submit();}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-window-close"></i>ɾ��ѡ��</a>


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

 if(isNaN($('#ComVisit').val())){
  alert('���ٵ��������������', '', function () {$("#ComVisit").focus();});
  return false
 }

 var searchurl ="?Action=<%=Action%>";
 searchurl += '&UserID=' + $('#UserID').val();
 searchurl += '&UserName=' + $('#UserName').val();
 searchurl += '&ComVisit=' + $('#ComVisit').val();
 searchurl += '&SpareState=' + $('#SpareState').val(); 
 searchurl += '&UserTeam=' + $('#UserTeam').val();
 searchurl += '&UserState=' + $('#UserState').val();
 searchurl += '&AgentPower=' + $('#AgentPower').val();
 searchurl += '&QQ=' + $('#QQ').val();

 location.href=searchurl;
});

});

</script> 

<table class="tb_3"><tr class="tr_1"> 
<td colspan="2">��ѯ</td>
</tr>  
<tr>
<td class="td_r" width="90">�û�ID��</td>
<td><input name="UserID" type="text" id="UserID" value="<%=UserID%>"></td>
</tr>    
<tr>
<td class="td_r">��վ����</td>
<td><input name="UserName" type="text" id="UserName" value="<%=UserName%>"></td>
</tr>
<tr>
<td class="td_r">���ٵ������</td>
<td><input name="ComVisit" type="text" id="ComVisit" value="<%=ComVisit%>"></td>
</tr>    
<tr>
<td class="td_r">ʣ���</td>
<td><select name="SpareState" id="SpareState">
<option value=""<%If CStr(SpareState)="" Then Response.write " selected"%>>ȫ��</option>
<option value="1"<%If CStr(SpareState)="1" Then Response.write " selected"%>>����0</option>
<option value="0"<%If CStr(SpareState)="0" Then Response.write " selected"%>>����0</option>
</select></td>
</tr>  	
<tr>
<td class="td_r">�û����飺</td>
<td><select name="UserTeam" id="UserTeam">
<option value=""<%If CStr(UserTeam)="" Then Response.write " selected"%>>ȫ��</option>
<option value="1"<%If CStr(UserTeam)="1" Then response.write" selected"%>>����1</option>
<option value="2"<%If CStr(UserTeam)="2" Then response.write" selected"%>>����2</option>
<option value="3"<%If CStr(UserTeam)="3" Then response.write" selected"%>>����3</option>
<option value="4"<%If CStr(UserTeam)="4" Then response.write" selected"%>>����4</option>
</select></td>
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
<td class="td_r">����Ȩ�ޣ�</td>
<td><select name="AgentPower" id="AgentPower">
<option value=""<%If CStr(AgentPower)="" Then Response.write " selected"%>>ȫ��</option>
<option value="1"<%If CStr(AgentPower)="1" Then Response.write " selected"%>>�ȴ����</option>
<option value="2"<%If CStr(AgentPower)="2" Then Response.write " selected"%>>��˳ɹ�</option>
<option value="3"<%If CStr(AgentPower)="3" Then Response.write " selected"%>>���ʧ��</option>
</select></td>
</tr>
<tr>
<td class="td_r">QQ�ţ�</td>
<td><input name="QQ" type="text" id="QQ" value="<%=QQ%>"></td>
</tr>

<tr>
<td></td>
<td><input type="submit" name="submit" value="��ѯ" class="btn btn-sm btn-primary" id="search"></td>
</tr>
</table>
