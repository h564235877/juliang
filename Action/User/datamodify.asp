<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>


<%Set Rs= Server.CreateObject("Adodb.RecordSet")
Sql="Select * From CFWztg_User Where UserName='"&UserName&"'"
Rs.Open Sql,Conn,1,1%>

<script>
$(function(){
	
$("#submit").click(function(){

if($('#email').val()==""){
 alert('����дemail��ַ', '', function () {$("#email").focus();});
 return false;
}

if(!isValidEmail($('#email').val())){
 alert('email��ַ��ʽ��д����ȷ', '', function () {$("#email").focus();});
 return false;
}

if($("#pwdanswer").val()==""){
 alert('����д����ش��', '', function () {$("#pwdanswer").focus();});
 return false;
}

});


});
</script>

<form name="form2" method="post" action="../../User.aspx?Action=datamodifysave">
<table class="tb_1">
    <tr class="tr_1"> 
      <td  colspan="2">�޸�ע������(��*Ϊ�����</td>
    </tr>
    <tr> 
      <td width="120" class="td_r">�û�����</td>
      <td><%=Rs("UserName")%></td>
    </tr>
	
    <tr> 
      <td class="td_r">�ڱ�ϵͳ����ID��</td>
      <td><%=Rs("ID")%></td>
    </tr>

    <tr> 
      <td class="td_r">������Ȩ�ޣ�</td>
      <td><%If Rs("AgentPower")=2 Then
 Response.write "��"
Else
 Response.write "��"
End If%></td>
    </tr>

	<tr> 
      <td class="td_r">Email��</td>
      <td> <input name="email" id="email" type="text"  value="<%=Rs("email")%>"> 
        <font color="#ff0000">*</font></td>
    </tr>
    <tr> 
      <td class="td_r">QQ���룺</td>
      <td> <input name="qq" id="qq"type="text" value="<%=Rs("QQ")%>"> 
      </td>
    </tr>
    <tr> 
      <td class="td_r">��ϵ�绰��</td>
      <td><input name="phone" id="phone"type="text"  value="<%=Rs("phone")%>"></td>
    </tr>

    <tr class="tr_1"> 
      <td  colspan="2">ѡ�����Ŀͷ�רԱ</td>
    </tr>
<tr> 
      <td class="td_r">���Ŀͷ�רԱ��</td>
      <td>
<%
Sql="Select UserNick,QQ From CFWztg_User where UserType=3 And UserState=1 And UserName='"&Rs("UpUserName")&"'"
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
If Not Rs2.Eof Then
 Response.write Rs2("UserNick")
 Response.write "��QQ:"&Rs2("QQ")&"&nbsp;<a target='_blank' href='http://wpa.qq.com/msgrd?v=3&uin="&Rs2("QQ")&"&site=qq&menu=yes'><img border='0'  src='../../images/qqonline2.gif' alt='���������ҷ���Ϣ' title='���������ҷ���Ϣ'></a>"
Else
'--ѡ��Ŀͷ�רԱʧЧʱ��Ϊ��ʱ
Response.write "<select name='UpUserName' id='UpUserName'>"
Response.write "<option value=''"
If Rs("UpUserName")="" Then Response.write " selected"
Response.write ">��ʱ��ѡ��ͷ�רԱ</option>"


Sql="Select UserName,UserNick,QQ From CFWztg_User where UserType=3 And UserState=1"
Set Rs3 = Server.CreateObject("ADODB.Recordset")
Rs3.open Sql,Conn,1,1
While Not Rs3.Eof

Response.write "<option value='"&Rs3("UserName")&"'"


Response.write ">"&Rs3("UserNick")&"|QQ:"&Rs3("QQ")&"</option>"

Rs3.MoveNext
Wend
Response.write "</select>"
Rs3.Close

End If

Rs2.Close
%>
</td>
</tr>


    <tr class="tr_1"> 
      <td colspan="2">��������֤ȷ�������޸�</td>
    </tr>
    <tr> 
      <td class="td_r">������ʾ���⣺</td>
      <td><%=Rs("PwdAsk")%></td>
    </tr>
    <tr> 
      <td class="td_r">����ش�𰸣�</td>
      <td align="left"><input name="pwdanswer" id="pwdanswer" type="text"> 
        <font color="#ff0000">*</font></td>
    </tr>

    <tr> 
      <td>&nbsp;</td>
      <td align="left"><input type="submit" name="submit" id="submit" value="�޸�" class="btn btn-primary"></td>
    </tr>
</table>
</form>
