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

if($("#pwdanswer").val()==""){
 alert('����д����ش��', '', function () {$("#pwdanswer").focus();});
 return false;
}

});

});
</script>

<form name="form2" method="post" action="../../User.aspx?Action=aduserbindmodifysave">
<table class="tb_1">
<tr class="tr_1"> 
      <td colspan="2">�󶨹����</td>
    </tr>
    <tr> 
      <td class="td_r">������û�����</td>
      <td><input name="adusername" id="adusername" type="text"  value="<%=Rs("BindUserName")%>">
������ѹ�������û������գ��󶨺���԰��ʽ��ת�������û����·����Լ��Ĺ��</td>
    </tr>
    <tr>
      <td class="td_r">��������룺</td>
      <td><input name="aduser_password" id="aduser_password" type="password"></td>
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