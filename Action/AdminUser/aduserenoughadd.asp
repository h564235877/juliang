<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<script>
$(function(){

$("#submit").click(function(){
if($('#AdUserName').val()==""){
 alert('请选择广告主', '', function () {$("#AdUserName").focus();});
 return false;
}

PayMoney=$('#PayMoney').val();
if(PayMoney==""){
 alert('请填写充入金额', '', function () {$("#PayMoney").focus();});
 return false;
}

if(isNaN(PayMoney)){
 alert('充入金额请输入数字', '', function () {$("#PayMoney").focus();});
 return false
}

if(PayMoney>=0){
 return confirm("确认要为广告主"+$('#AdUserName').val()+"充值"+PayMoney+"元吗?");
}else{
 return confirm("确认要扣除广告主"+$('#AdUserName').val()+"的金额"+Math.abs(PayMoney)+"元吗?");
}

});

});

</script> 

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form name="form4" method="post" action="../../AdminUser.aspx?Action=aduserenoughaddsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">为广告主充值</td>
</tr>

<tr> 
<td width="100" class="td_r">广告主用户名：</td>
<td>
<select name='AdUserName' id='AdUserName'>
<option value=''>请选择广告主</option>
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
<TD class="td_r">定单号：</TD>
<TD><%OrderCode=Left(DateDiff("s","1970-1-1",Now())&GetRanStr_2(16),16)%><input name="OrderCode" type="text" id="OrderCode" value="<%=OrderCode%>">(如果是收款二维码收的，优先填写支付宝或微信的订单号方便核对)</TD>
</TR>

<tr> 
<td class="td_r">充入金额：</td>
<td><input name="PayMoney" id="PayMoney" type="text">
元</td>
</tr>

<tr> 
<td></td>
<td><input type="submit" name="submit" value="充值" class="btn btn-primary" id="submit"></td>
</tr>
</table>
</form>