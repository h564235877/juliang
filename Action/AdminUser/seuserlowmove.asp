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
SeUserName=Chkstr(Request("SeUserName"),1)

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_User where UserName='"&SeUserName&"' and UserType=3"
Rs.open Sql,Conn,1,1

If Rs.Eof Then
 Response.write "��¼������"
 Response.End
End If

UserNick=Rs("UserNick")
Pay_RealName=Rs("Pay_RealName")
Rs.Close
%>
<script>
$(function(){

$("#submit").click(function(){
if($('#seusername_new').val()==""){
 alert('��ѡ���¿ͷ�', '', function () {$("#seusername_new").focus();});
 return false;
}

return confirm('ȷ��Ҫת����?');

});

});

</script> 


<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<form name="form3" method="post" action="../../AdminUser.aspx?Action=seusermovesave&SeUserName=<%=SeUserName%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_3" style="margin-top:50px;"><tr class="tr_1"> 
<td colspan="2">ת�ƿͷ�����������վ�����¿ͷ�</td>
</tr>  
<tr>
<tr>
<td class="td_r">�ɿͷ�</td>
<td>
�ͷ���:<%=SeUserName%>,
�س�:<%=UserNick%>,
��ʵ����:<%=Pay_RealName%>
</td>
</tr>
<tr> 
<td class="td_r">�¿ͷ�:</td>
<td>
<%
Sql="Select * From CFWztg_User where UserType=3 And UserState=1"
Set Rs=Conn.Execute(Sql)
If Not Rs.Eof Then
Response.write "<select name='seusername_new' id='seusername_new'>"
Response.write "<option selected value=''>��ѡ���¿ͷ���</option>"
While Not Rs.Eof
Response.write "<option value='"&Rs("UserName")&"'>�ͷ���:"&Rs("UserName")&",�س�:"&Rs("UserNick")&",��ʵ����:"&Rs("Pay_RealName")&"</option>"
Rs.MoveNext
Wend
Response.write "</select>"
Rs.Close
Else
Response.write "û����Ч�ͷ�"
End If
%>
</td>
</tr>

<tr> 
<td></td>
<td>
<input type="submit" name="submit" id="submit" value="ת��" class="btn btn-primary">
</td>
</tr>
</table>
</form>