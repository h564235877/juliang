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

<form name="form2" method="post" action="../../AdminUser.aspx?Action=gbookaddsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1"><tr class="tr_1"> 
<td colspan="2">����վ����������</td>
</tr>
  <tr>
    <td class="td_r">���ĸ���վ������:</td>
    <td><input name="UserName" type="text" id="UserName" value="">(��д�û���)</td>
  </tr>
  <tr>
<td width="140" class="td_r">�����������ݣ�</td>
<td><textarea name="Reply" cols="60" rows="7" id="Reply"></textarea></td>
</tr>
<tr>
<td></td>
<td>
<input type="submit" name="submit" id="submit" value="��������" class="btn btn-primary">(���������ݻ�ֱ����ʾ����վ����¼)
</td>
</tr>
</table>
</form>