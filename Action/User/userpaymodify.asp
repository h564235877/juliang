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
Sql="Select * From CFWztg_User where UserName='"&UserName&"'"
Rs.open Sql,Conn,1,1
%>

<script>
$(function(){
	
function pay_type_(){
$("#t_pay_realname,#t_pay_account,#t_pay_bankaddress").hide();
}

function pay_type_alipay(){
$("#t_pay_realname,#t_pay_account").show();
$("#t_pay_bankaddress").hide();
}
function pay_type_tenpay(){pay_type_alipay();}

function pay_type_boc(){$("#t_pay_realname,#t_pay_account,#t_pay_bankaddress").show();}
function pay_type_abc(){pay_type_boc();}
function pay_type_icbc(){pay_type_boc();}
function pay_type_ccb(){pay_type_boc();}
function pay_type_cmb(){pay_type_boc();}
function pay_type_otherbank(){pay_type_boc();}

pay_type_<%=Rs("pay_type")%>();

$('#pay_type').change(function(){ 
 if($(this).children('option:selected').val()==""){
  pay_type_()
 }else if($(this).children('option:selected').val()=="alipay"||$(this).children('option:selected').val()=="tenpay"){
  pay_type_alipay();
 }else{
  pay_type_boc();
 }
})


$("#submit").click(function(){
 if($("#pay_type option:selected").val()==""){
  alert('��ѡ��һ���տʽ', '', function () {$("#pay_type").focus();});
  return false;
 }

 if($("#pay_type option:selected").val()!=""&&$("#pay_type option:selected").val()!="select"){
  if($("#pay_realname").val()==""){
   alert('����д�տ�����', '', function () {$("#pay_realname").focus();});
   return false;
  }
  if($("#pay_account").val()==""){
   alert('����д�տ��ʺ�', '', function () {$("#pay_realname").focus();});
   return false;
  }
 }

 if($("#pay_type option:selected").val()=="otherbank"&&$("#pay_bankaddress").val()==""){
  alert('ѡ����������ʱ��������д�����������������ƿ�ͷ', '', function () {$("#pay_bankaddress").focus();});
  return false;
 }

 
 if($("#pwdanswer").val()==""){
  alert('����д����ش��', '', function () {$("#pwdanswer").focus();});
  return false;
 }
});


});
</script> 

<form name="form2" method="post" action="../../User.aspx?Action=userpaymodifysave">
<table class="tb_1">
<tr class="tr_1">
<td colspan="2">�޸��տʽ
</td>
</tr>
    <tr> 
      <td width="150" class="td_r">ѡ���տʽ��</td>
<td>
<select name="pay_type" id="pay_type" style="width:230px;">
<option value="cmb"<%If Rs("pay_type")="cmb" Then Response.write " selected"%>>����Ǯ��</option>
<%If Rs("pay_type")="" Then Response.write "<option value='' selected>�ݲ���д</option>"%>
</select>
<font color="#ff0000">*</font>
</td>
    </tr>

<tr id="t_pay_realname"> 
<td class="td_r">�տ�������</td>
<td>
<%
If Rs("Pay_RealName")<>"" Then
 Response.write "<input name='pay_realname' type='text' id='pay_realname' value='"&Rs("pay_realname")&"' readonly style='background:#e8e8e8;width:220px;'>(ע:��ʵ�����޷��޸�)"
Else
 Response.write "<input name='pay_realname' type='text' id='pay_realname' value='"&Rs("pay_realname")&"' style='width:220px;'><font color='#ff0000'>*</font>(ע:��ʵ������д���޷��޸�)"
End If
%>
</td>
</tr>

<tr id="t_pay_account"> 
<td class="td_r">�տ��ʺţ�</td>
<td><input name="pay_account" type="text" id="pay_account" value="<%=Rs("pay_account")%>" style="width:220px;">
<font color="#ff0000">*</font></td>
</tr>

<tr id="t_pay_bankaddress"> 
<td class="td_r">�ֻ��ź���λ��</td>
<td><input name="pay_bankaddress" type="text" id="pay_bankaddress" value="<%=Rs("pay_bankaddress")%>" style="width:220px;">
<font color="#ff0000">*</font>(�տ��Ա���ֻ��ź�4λ)
</td>
</tr>

<tr class="tr_1">
<td colspan="2">��������֤ȷ�������޸�
</td>
</tr>
<tr> 
<td class="td_r">������ʾ���⣺</td>
<td><%=Rs("pwdask")%></td>
</tr>
<tr>
<td class="td_r">����ش�𰸣�</td>
<td><input name="pwdanswer" id="pwdanswer" type="text" style="width:220px;"></td>
</tr>
<tr> 
<td>&nbsp;</td>
<td><input type="submit" name="submit" id="submit" value="�޸�" class="btn btn-primary"></td>
</tr>
</table>
</form>