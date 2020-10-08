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

if($('#ad_id').val()==""){
 alert('广告必须选择', '', function () {$("#ad_id").focus();});
 return false;
}

if($('#cpainfo').val()==""){
 alert('CPA信息必须填写', '', function () {$("#cpainfo").focus();});
 return false;
}


});

});

</script>
<form action="../../AdUser.aspx?Action=upunioncpastep" method="post" name="form2" target="_blank" onsubmit="return upunioncpaincheck()">
<table class="tb_1"><tr class="tr_1"> 
<td colspan="2">导入数据上级联盟CPA数据</td>
</tr>
<tr>
<td class="td_r">选择CPA广告：</td>
<td>
<select id='ad_id' name='ad_id'>
<option value="">选择广告</option>
<%
Sql="Select AdName,ID,Unit_Cent From CFWztg_AD Where ClickState=3 And AdUserName='"&AdUserName&"' Order By ID"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("ID")&"'"
 Response.Write ">"&Rs("AdName")&"[广告ID:"&Rs("ID")&"][广告单价:"&GetTurnCent(Rs("Unit_Cent"))&"元]</option>"
Rs.MoveNext
Wend
%>
</select>
</td>
</tr>
<tr>
<td class="td_r">输入要导入的数据：</td>
<td><textarea name="cpainfo" id="cpainfo" cols="80" rows="20"></textarea></td>
</tr>
<tr>
<td class="td_r">&nbsp;</td>
<td>数据格式：日期|用户ID|数量
<br>
注：一行一条数据，点导入后系统会先验证数据正确性再导入，如有一条数据格式不正确则会提示返回修改正确再导入</td>
</tr>

<tr>
<td height="29">&nbsp;</td>
<td><input type="submit" name="submit" id="submit" value="导入" class="btn btn-primary"></td>
</tr>
</table>
</form>
