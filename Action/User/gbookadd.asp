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
	
$("#submit").click(function(){

if($('#Content').val()==""){
 alert('����д��������', '', function () {$("#Content").focus();});
 return false;
}

});

});
</script>

<a href="?Action=gbooklist" class="actionBtn" style="margin-top:10px;"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<form name="form2" method="post" action="../../User.aspx?Action=gbookaddsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1"><tr class="tr_1"> 
<td colspan="2">����</td>
</tr>
<tr>
<td width="80" class="td_r">�������ݣ�</td>
<td><textarea name="Content" cols="60" rows="7" id="Content"></textarea></td>
</tr>
<tr>
<td></td>
<td>
<input type="submit" name="submit" id="submit" value="����" class="btn btn-primary">
</td>
</tr>
</table>
</form>