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
Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_User where UserName='"&AdUserName&"'"
Rs.Open Sql,Conn,1,1
%>

<script>
$(function(){
	
$("#submit").click(function(){

if($('#RecSafeCode').val()==""){
 alert('����д�ӿ���Կ', '', function () {$("#RecSafeCode").focus();});
 return false;
}

if($('#RecSafeCode').val()<8) { 
 alert('�ӿ���Կ����������8λ', '', function () {$("#RecSafeCode").focus();});
 return false;
}

return confirm('ȷ��Ҫ�޸���?');
});

});


var chars = ['0','1','2','3','4','5','6','7','8','9','a','b','d','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','D','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];

function generateMixed(n) {
     var res = "";
     for(var i = 0; i < n ; i ++) {
         var id = Math.ceil(Math.random()*61);
         res += chars[id];
     }
     return res;
}
</script>

<form name="form3" method="post" action="../../AdUser.aspx?Action=recsafecodemodifysave">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan=2>�ӿ���Կ����</td>
</tr>  
<tr> 
<td width="80" class="td_r">�ӿ���Կ�� </td>
<td>
<input name="RecSafeCode" id="RecSafeCode" type="password" value="<%=Rs("RecSafeCode")%>"  readonly style="background-color:white">


<script>
 window.onload=function(){
  var RecSafeCodeBtn=document.getElementById("RecSafeCodeDo");
  var RecSafeCodeInput=document.getElementById("RecSafeCode")
  RecSafeCodeBtn.onmousedown=function(){
    	if(RecSafeCodeInput.type=="password"){RecSafeCodeInput.type="text";RecSafeCodeInput.removeAttribute('readonly')}else{RecSafeCodeInput.type="password";RecSafeCodeInput.setAttribute('readOnly','true')}
  };
 }
</script>
<input type="button" name="RecSafeCodeDo" id="RecSafeCodeDo" value="��ʾ/���ؽӿ���Կ" />

<input type="button" name="RecSafeCodeShow" id="RecSafeCodeShow" value="��ȫ�ַ�ȡ���ֵ" onclick="$(function () { confirm('ȷ��Ҫʹ�����ֵ���������ֵ�������ύ������Ч?', '', function (isConfirm) {if (isConfirm) {document.getElementById('RecSafeCode').value=generateMixed(16);document.getElementById('RecSafeCode').type='text';document.getElementById('RecSafeCode').readOnly=false;}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" />
</td>
</tr>

<tr>
<td></td>
<td>
<input type="submit" name="submit" id="submit" value="�޸�" class="btn btn-primary">
</td>
</tr>
</table>
</form>