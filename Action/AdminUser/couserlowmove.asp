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
CoUserName=Chkstr(Request("CoUserName"),1)

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_User where UserName='"&CoUserName&"' and UserType=4"
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
if($('#cousername_new').val()==""){
 alert('请选择新商务', '', function () {$("#cousername_new").focus();});
 return false;
}

return confirm('确定要转移吗?');

});

});

</script> 

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form name="form3" method="post" action="../../AdminUser.aspx?Action=cousermovesave&CoUserName=<%=CoUserName%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_3" style="margin-top:50px;"><tr class="tr_1"> 
<td colspan="2">转移商务名下所有广告主给新商务</td>
</tr>  
<tr>
<tr>
<td class="td_r">旧商务</td>
<td>
商务名:<%=CoUserName%>,
呢称:<%=UserNick%>,
真实姓名:<%=Pay_RealName%>
</td>
</tr>
<tr> 
<td class="td_r">新商务:</td>

<td>
<%
Sql="Select * From CFWztg_User where UserType=4 And UserState=1"
Set Rs=Conn.Execute(Sql)
If Not Rs.Eof Then
Response.write "<select name='cousername_new' id='cousername_new'>"
Response.write "<option selected value=''>请选择新商务名</option>"
While Not Rs.Eof
Response.write "<option value='"&Rs("UserName")&"'>商务名:"&Rs("UserName")&",呢称:"&Rs("UserNick")&",真实姓名:"&Rs("Pay_RealName")&"</option>"
Rs.MoveNext
Wend
Response.write "</select>"
Rs.Close
Else
Response.write "没有有效商务"
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