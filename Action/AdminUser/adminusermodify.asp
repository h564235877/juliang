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
AdminUserName=ChkStr(request("AdminUserName"),1)

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_AdminUser where AdminUserName='"&AdminUserName&"'"
Rs.open Sql,Conn,1,1
AdminUserDesc=Rs("AdminUserDesc")
PowerLevel=Rs("PowerLevel")
PowerHold=Rs("PowerHold")
Rs.Close

%>

<SCRIPT>
$(function(){

$("#PowerLevel1").click(function(){
$("#a_1").hide();
});

$("#PowerLevel2").click(function(){
$("#a_1").show();
});

<%
If PowerLevel=1 Then
 Response.write "$('#a_1').hide();"
ElseIf PowerLevel=2 Then
 Response.write "$('#a_1').show();"
End If
%>

});
</SCRIPT>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn" style="margin-top:10px;"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<form name="form2" method="post" action="../../AdminUser.aspx?Action=adminusermodifysave&AdminUserName=<%=AdminUserName%>&PowerLevel_Old=<%=PowerLevel%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1"><tr class="tr_1"> 
<td colspan="2">����Ա�޸�</td>
</tr>
<tr>
<td width="120" class="td_r">����Ա�û�����</td>
<td><%=AdminUserName%></td>
</tr>
<tr> 
<td class="td_r">����Ա���룺</td>
<td><input name="Pwd" type="password" id="Pwd" size="30">(���������벻�ᱻ�޸�)</td>
</tr>
<tr> 
<tr> 
<td class="td_r">����Ա������</td>
<td><input name="AdminUserDesc" type="text" id="AdminUserDesc" value="<%=AdminUserDesc%>" size="30"></td>
</tr>
<tr> 
<td class="td_r">����Ա����</td>
<td><input type="radio" name="PowerLevel" value="1"<%If PowerLevel=1 Then Response.Write " checked"%> id="PowerLevel1">
��������Ա 
<input type="radio" name="PowerLevel" value="2"<%If PowerLevel=2 Then Response.Write " checked"%> id="PowerLevel2">
��ͨ����Ա</td>
</tr>

<tr> 
<td colspan="2" id="a_1">
<style type="text/css">
.adminpower ul .li1{ width:100%;font-size:15px;font-weight:bold;}
.adminpower ul{clear:both;}
.adminpower ul li{line-height:30px;width:200px;float:left;}
.adminpower .span2{font-weight:normal;font-size:14px;}
}
</style>

<script>
//�����ų�PowerLevel
function selectadminpowerbox(form) {
    for (var i = 0; i < form.elements.length; i++) {
        var e = form.elements[i];
        if (e.name != 'chkall' && e.name != 'PowerLevel' && e.disabled != true) e.checked = form.chkall.checked;
    }
}
</script>

<div class="adminpower">

<ul>
<li class="li1">��ͨ����Ա��ѡ������Ȩ��</li>
<li><input name="chkall" type="checkbox" id="chkall" onclick="selectadminpowerbox(this.form)" value="check">ȫѡ��ȡ��ȫѡ</li>
<ul>

<%
Sql="Select * From CFWztg_SetSClass where SetBClassFlag='AdminPower' Order By SetTaxis"
Set Rs = Conn.Execute(Sql)
While Not Rs.Eof
%>
<ul>
<li class="li1"><%=Rs("SetSclassDesc")%>��</li>
<li style="clear:both"></li>
<%
Sql="Select * From CFWztg_SetContent where SetBClassFlag='AdminPower' And SetSClassFlag='" & Rs("SetSClassFlag") & "' Order By SetTaxis"
Set Rs2 = Conn.Execute(Sql)

While Not Rs2.Eof
%>	
<li><input type="checkbox" name="powerhold" value="<%=Rs2("SetFlag_2")%>"<%If InStr(","&PowerHold&",",","&Rs2("SetFlag_2")&",")>0 Then Response.write " checked"%>><%=Rs2("SetDesc")%></li>
<%
Rs2.MoveNext
Wend
%>
</ul>
<%
Rs.MoveNext
Wend
%>
</div>

</td>
</tr>
<tr> 
<td></td>
<td>
<input type="submit" name="submit" value="�޸�" class="btn btn-primary">
</td>
</tr>
</table>
</form>