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
Plan_ID=ChkStr(Request("Plan_ID"),2)

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select PlanName From CFWztg_Plan where ID="&Plan_ID&" And AdUserName='"&AdUserName&"'"
Rs.open Sql,Conn,1,1
PlanName=Rs("PlanName")
Rs.Close
%>

<SCRIPT>
$(function(){

$("#planmodifysave").click(function(){

if($('#PlanName').val()==""){
 alert('请输入广告计划名称', '', function () {$("#PlanName").focus();});
 return false;
}


});

});
</script>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn" style="margin-top:10px;"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form method="post" action="../../AdUser.aspx?Action=planmodifysave&Plan_ID=<%=Plan_ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>" name=form_planmodify id=form_planmodify>
<table class="tb_1" id='tbu'>
<tr class="tr_1">
<td colspan="2">计划修改</td>
</tr>

<tr>
<td class="td_r">计划名称：</td>
<td>
<input name="PlanName" type="text" id="PlanName" style="width:300px" value="<%=PlanName%>" size="40"></td>
</tr>


<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="submit" id="planmodifysave" value="修改计划" class="btn btn-primary">
</td>
</tr>

</table>
</form>
