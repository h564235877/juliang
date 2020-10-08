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
SeUserName=Chkstr(Request("SeUserName"),1)

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_User where UserName='"&SeUserName&"' and UserType=3"
Rs.open Sql,Conn,1,1

If Rs.Eof Then
 Response.write "记录不存在"
 Response.End
End If

UserNick=Rs("UserNick")
Pay_RealName=Rs("Pay_RealName")
Rs.Close
%>
<script>
$(function(){

$("#submit").click(function(){
if($('#seusername_new').val()==""){
 alert('请选择新客服', '', function () {$("#seusername_new").focus();});
 return false;
}

return confirm('确定要转移吗?');

});

});

</script> 


<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form name="form3" method="post" action="../../AdminUser.aspx?Action=seusermovesave&SeUserName=<%=SeUserName%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_3" style="margin-top:50px;"><tr class="tr_1"> 
<td colspan="2">转移客服名下所有网站主给新客服</td>
</tr>  
<tr>
<tr>
<td class="td_r">旧客服</td>
<td>
客服名:<%=SeUserName%>,
呢称:<%=UserNick%>,
真实姓名:<%=Pay_RealName%>
</td>
</tr>
<tr> 
<td class="td_r">新客服:</td>
<td>
<%
Sql="Select * From CFWztg_User where UserType=3 And UserState=1"
Set Rs=Conn.Execute(Sql)
If Not Rs.Eof Then
Response.write "<select name='seusername_new' id='seusername_new'>"
Response.write "<option selected value=''>请选择新客服名</option>"
While Not Rs.Eof
Response.write "<option value='"&Rs("UserName")&"'>客服名:"&Rs("UserName")&",呢称:"&Rs("UserNick")&",真实姓名:"&Rs("Pay_RealName")&"</option>"
Rs.MoveNext
Wend
Response.write "</select>"
Rs.Close
Else
Response.write "没有有效客服"
End If
%>
</td>
</tr>

<tr> 
<td></td>
<td>
<input type="submit" name="submit" id="submit" value="转移" class="btn btn-primary">
</td>
</tr>
</table>
</form>