<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
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
  alert('请选择一种收款方式', '', function () {$("#pay_type").focus();});
  return false;
 }

 if($("#pay_type option:selected").val()!=""&&$("#pay_type option:selected").val()!="select"){
  if($("#pay_realname").val()==""){
   alert('请填写收款姓名', '', function () {$("#pay_realname").focus();});
   return false;
  }
  if($("#pay_account").val()==""){
   alert('请填写收款帐号', '', function () {$("#pay_realname").focus();});
   return false;
  }
 }

 if($("#pay_type option:selected").val()=="otherbank"&&$("#pay_bankaddress").val()==""){
  alert('选择其它银行时，必须填写开户行且以银行名称开头', '', function () {$("#pay_bankaddress").focus();});
  return false;
 }

 
 if($("#pwdanswer").val()==""){
  alert('请填写密码回答答案', '', function () {$("#pwdanswer").focus();});
  return false;
 }
});


});
</script> 

<form name="form2" method="post" action="../../User.aspx?Action=userpaymodifysave">
<table class="tb_1">
<tr class="tr_1">
<td colspan="2">修改收款方式
</td>
</tr>
    <tr> 
      <td width="150" class="td_r">选择收款方式：</td>
<td>
<select name="pay_type" id="pay_type" style="width:230px;">
<option value="cmb"<%If Rs("pay_type")="cmb" Then Response.write " selected"%>>东方钱包</option>
<%If Rs("pay_type")="" Then Response.write "<option value='' selected>暂不填写</option>"%>
</select>
<font color="#ff0000">*</font>
</td>
    </tr>

<tr id="t_pay_realname"> 
<td class="td_r">收款姓名：</td>
<td>
<%
If Rs("Pay_RealName")<>"" Then
 Response.write "<input name='pay_realname' type='text' id='pay_realname' value='"&Rs("pay_realname")&"' readonly style='background:#e8e8e8;width:220px;'>(注:真实姓名无法修改)"
Else
 Response.write "<input name='pay_realname' type='text' id='pay_realname' value='"&Rs("pay_realname")&"' style='width:220px;'><font color='#ff0000'>*</font>(注:真实姓名填写后无法修改)"
End If
%>
</td>
</tr>

<tr id="t_pay_account"> 
<td class="td_r">收款帐号：</td>
<td><input name="pay_account" type="text" id="pay_account" value="<%=Rs("pay_account")%>" style="width:220px;">
<font color="#ff0000">*</font></td>
</tr>

<tr id="t_pay_bankaddress"> 
<td class="td_r">手机号后四位：</td>
<td><input name="pay_bankaddress" type="text" id="pay_bankaddress" value="<%=Rs("pay_bankaddress")%>" style="width:220px;">
<font color="#ff0000">*</font>(收款会员绑定手机号后4位)
</td>
</tr>

<tr class="tr_1">
<td colspan="2">请输入验证确认以上修改
</td>
</tr>
<tr> 
<td class="td_r">密码提示问题：</td>
<td><%=Rs("pwdask")%></td>
</tr>
<tr>
<td class="td_r">密码回答答案：</td>
<td><input name="pwdanswer" id="pwdanswer" type="text" style="width:220px;"></td>
</tr>
<tr> 
<td>&nbsp;</td>
<td><input type="submit" name="submit" id="submit" value="修改" class="btn btn-primary"></td>
</tr>
</table>
</form>