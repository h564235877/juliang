<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<script>
$(function(){
	
$("#userreg").click(function(){

if($('#username').val()==""){
 alert('����д�û���', '', function () {$("#username").focus();});
 return false;
}

if(!chkname($('#username').val())){
 alert('�û���������', '', function () {$("#username").focus();});
 return false;
}

if($('#pwd').val()==""){
 alert('����д����', '', function () {$("#pwd").focus();});
 return false;
}


});


});

</script>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<form name="form2" method="post" action="../../AdminUser.aspx?Action=useraddsave&ID=<%=ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">��վ������</td>
</tr>
<tr>
<td width="120" class="td_r">��վ���û�����</td>
<td><input name="username" type="text" id="username">*(����ΪСд��ĸ�����ֻ��»���)</td>
</tr>
<tr>
<td class="td_r">��վ�����룺</td>
<td><input name="pwd" type="password" id="pwd" STYLE="ime-mode:inactive;">*</td>
</tr>
<td></td>
<td>
<input type="submit" name="userreg" id="userreg" value="����" class="btn btn-primary">
</td>
</tr>
</table>
</form>