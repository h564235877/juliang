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
if($('#AdUserName').val()==""){
 alert('��ѡ������', '', function () {$("#AdUserName").focus();});
 return false;
}

PayMoney=$('#PayMoney').val();
if(PayMoney==""){
 alert('����д������', '', function () {$("#PayMoney").focus();});
 return false;
}

if(isNaN(PayMoney)){
 alert('����������������', '', function () {$("#PayMoney").focus();});
 return false
}

if(PayMoney>=0){
 return confirm("ȷ��ҪΪ�����"+$('#AdUserName').val()+"��ֵ"+PayMoney+"Ԫ��?");
}else{
 return confirm("ȷ��Ҫ�۳������"+$('#AdUserName').val()+"�Ľ��"+Math.abs(PayMoney)+"Ԫ��?");
}

});

});

</script> 

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<form name="form4" method="post" action="../../AdminUser.aspx?Action=aduserenoughaddsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">Ϊ�������ֵ</td>
</tr>

<tr> 
<td width="100" class="td_r">������û�����</td>
<td>
<select name='AdUserName' id='AdUserName'>
<option value=''>��ѡ������</option>
<%
Sql="Select UserName From CFWztg_User Where UserType=2 And UserState=1 Order By UserName"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
Response.Write "<option value='"&Rs("UserName")&"'>"&Rs("UserName")&"</option>"
Rs.MoveNext
Wend
Rs.Close
%>
</select>
</td>
</tr>
<TR> 
<TD class="td_r">�����ţ�</TD>
<TD><%OrderCode=Left(DateDiff("s","1970-1-1",Now())&GetRanStr_2(16),16)%><input name="OrderCode" type="text" id="OrderCode" value="<%=OrderCode%>">(������տ��ά���յģ�������д֧������΢�ŵĶ����ŷ���˶�)</TD>
</TR>

<tr> 
<td class="td_r">�����</td>
<td><input name="PayMoney" id="PayMoney" type="text">
Ԫ</td>
</tr>

<tr> 
<td></td>
<td><input type="submit" name="submit" value="��ֵ" class="btn btn-primary" id="submit"></td>
</tr>
</table>
</form>