<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<script language=JavaScript>

$(function(){

$("#submit").click(function(){

siteurl = $('#siteurl').val().toLowerCase();


if(siteurl == ""){
 alert('����д����', '', function () {$("#siteurl").focus();});
 return false;
}

if(isDomain(siteurl)==false){
 alert('������ʽ����ȷ����д��a.com������������', '', function () {$("#siteurl").focus();});
 return false;
}
 
if(siteurl.substring(0,4)=="www."){
 alert('������Ҫ��www.��ͷ', '', function () {$("#siteurl").focus();});
 return false;
}
 
if($('#siteclassid').val()==""){
 alert('��ѡ�����', '', function () {$("#siteclassid").focus();});
 return false;
}
 
});

});
</script>


<%
ID=ChkStr(Request("ID"),2)
Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_UserSite Where ID="&ID
Rs.open Sql,Conn,1,1

Set Rs2= Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_User where UserName='"&Rs("UserName")&"'"
Rs2.open Sql,Conn,1,1
Email=Rs2("Email")
Rs2.close()
%>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<form name="form_usersite" method="post" onsubmit="return usersiteaddcheck()" action="../../AdminUser.aspx?Action=usersitemodifysave&ID=<%=ID%>&UserName=<%=Rs("UserName")%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">�޸������ַ</td>
</tr>
<tr>
<td width="100" class="td_r">�����û���</td>
<td><%=Rs("UserName")%></td>
</tr>
<tr> 
<td class="td_r">��վ������</td>
<td>
<input name="siteurl" id="siteurl" type="text" value="<%=Rs("SiteUrl")%>">
<br>
(˵����������д�������Ϳ��ԣ���qqcf.com���������������ж�����������Ч!)
</td>
</tr>

<tr> 
<td class="td_r">��վ���ࣺ</td>
<td>
<select name="siteclassid" id="siteclassid">
<option selected value="">��ѡ�����</option>
<%
Sql="Select * From CFWztg_SiteClass Order By SiteClassName"
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
While Not Rs2.Eof
%>
<option value="<%=Rs2("ID")%>"<%If Rs("SiteClassID")=Rs2("ID") Then Response.write " selected"%> ><%=Rs2("SiteClassName")%></option>
<%
Rs2.MoveNext
Wend
%>
</select>
</td>
</tr>
<tr> 
<td class="td_r">Alexa������</td>
<td><input name="AlexaRank" id="AlexaRank" type="text" value="<%=Rs("AlexaRank")%>">
<a href="http://www.alexa.com/siteinfo/<%=Rs("SiteUrl")%>" target="_blank">��ѯ��վ��Alexa����</a></td>
</tr>

<tr> 
<td class="td_r">״̬��</td>
<td>
<select name="sitestate" id="sitestate">
<option value="1"<%If Rs("sitestate")=1 Then Response.Write " selected"%>>�ȴ����</option>
<option value="2"<%If Rs("sitestate")=2 Then Response.Write " selected"%>>��˳ɹ�</option>
<option value="3"<%If Rs("sitestate")=3 Then Response.Write " selected"%>>���ʧ��</option>
</select></td>
</tr>

<tr> 
<td></td>
<td>
<input type="submit" name="submit"  id="submit" value="�޸�" class="btn btn-primary">
</td>
</tr>
</table>
</form>