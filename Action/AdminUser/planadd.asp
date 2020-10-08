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
AdUserName=ChkStr(Request("AdUserName"),1)

If AdUserName="" Then RefUrl=Server.URLEncode(Request.ServerVariables("Http_Referer")) Else RefUrl=Server.URLEncode(Request("RefUrl"))
%>

<SCRIPT>
$(function(){

$("#planaddsave").click(function(){

 if($("#AdUserName option:selected").val()==""){
  alert('请选择一个广告主', '', function () {$("#AdUserName").focus();});
  return false;
 }
 
if($('#PlanName').val()==""){
 alert('请输入管理员名称', '', function () {$("#PlanName").focus();});
 return false;
}

if($('#TotalClick_Cent').val()==""){
 alert('请输入投放总额', '', function () {$("#TotalClick_Cent").focus();});
 return false;
}
<%
If AdUserName<>"" Then
Sql = "Select Spare_Cent From CFWztg_User Where UserName='" & AdUserName & "'"
Set Rs = Conn.Execute(Sql)
Spare_Cent = CDbl(Rs("Spare_Cent"))
Rs.Close
%>
if($('#TotalClick_Cent').val() > <%=Spare_Cent%>){
 alert('剩余金额不足支付发布的计划费用', '', function () {$("#TotalClick_Cent").focus();});
 return false;
}
<%End If%>

});

});


</script>

<a href="<%=URLDecode(RefUrl)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form method="post" action="../../AdminUser.aspx?Action=planaddsave" name=form_planadd id=form_planadd>
<table class="tb_1" id='tbu'>
<tr class="tr_1">
<td colspan="2">广告计划发布</td>
</tr>
<tr> 
<td width="120" class="td_r">广告主用户名：</td>
<td>
<select name='AdUserName' id='AdUserName' onChange="window.location='?Action=planadd&AdUserName='+document.getElementById('AdUserName').options[document.getElementById('AdUserName').selectedIndex].value+'&RefUrl=<%=RefUrl%>'">
<option value=''>请选择广告主</option>
<%
Sql="Select UserName From CFWztg_User Where UserType=2 And UserState=1 Order By UserName"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("UserName")&"'"
 If AdUserName=Rs("UserName") Then Response.write " selected"
 Response.Write ">"&Rs("UserName")&"</option>"
Rs.MoveNext
Wend
Rs.Close
%>
</select>*
</td>
</tr>

<tr>
<td class="td_r">广告计划名称：</td>
<td>
<input name="PlanName" id="PlanName" type="text" size="40" style="width:300px">*<a href="javascript:" onclick="document.getElementById('PlanName').value='创建于'+getNowFormatDate();">点击这里取当前时间命名广告计划</a></td>
</tr>

<TR>
<TD class="td_r">投放总额：</TD>
<TD><input name="TotalClick_Cent" id="TotalClick_Cent" type="text" size="40" style="width:100px">元*<%
If AdUserName<>"" Then Response.write " (广告主"&AdUserName&"账户余额:"&Int(Spare_Cent*100/100)&"元)"
%>
</TD>
</TR>

<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="submit" id="planaddsave" value="发布新计划" class="btn btn-primary">
</td>
</tr>

</table>
</form>
