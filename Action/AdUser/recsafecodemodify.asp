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
Sql="Select * From CFWztg_User where UserName='"&AdUserName&"'"
Rs.Open Sql,Conn,1,1
%>

<script>
$(function(){
	
$("#submit").click(function(){

if($('#RecSafeCode').val()==""){
 alert('请填写接口密钥', '', function () {$("#RecSafeCode").focus();});
 return false;
}

if($('#RecSafeCode').val()<8) { 
 alert('接口密钥长度需至少8位', '', function () {$("#RecSafeCode").focus();});
 return false;
}

return confirm('确定要修改吗?');
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
<td colspan=2>接口密钥设置</td>
</tr>  
<tr> 
<td width="80" class="td_r">接口密钥： </td>
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
<input type="button" name="RecSafeCodeDo" id="RecSafeCodeDo" value="显示/隐藏接口密钥" />

<input type="button" name="RecSafeCodeShow" id="RecSafeCodeShow" value="安全字符取随机值" onclick="$(function () { confirm('确认要使用随机值吗，生成随机值后需再提交表单才生效?', '', function (isConfirm) {if (isConfirm) {document.getElementById('RecSafeCode').value=generateMixed(16);document.getElementById('RecSafeCode').type='text';document.getElementById('RecSafeCode').readOnly=false;}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" />
</td>
</tr>

<tr>
<td></td>
<td>
<input type="submit" name="submit" id="submit" value="修改" class="btn btn-primary">
</td>
</tr>
</table>
</form>