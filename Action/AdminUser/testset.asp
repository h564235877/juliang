<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<table class="tb_2">
<tr>
<td>
<div class="explain">
有时你想对本系统进行测试，由于防作弊机制造你无法实现，所以本功能可以清除在系统中清除你的IP和Cookie。<br />
注：此操作只对你本机一台有效，并不影响别的电脑的防作弊功能！</div>
</td>
</tr>
</table>

<form name="form3" method="post" action="../../AdminUser.aspx?Action=testsetsave">
<table class="tb_1">
<tr> 
<td class="td_r">删除指定的IP记录</td>
<%
If Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" Then
 MyIp = ChkStr(Request.ServerVariables("REMOTE_ADDR"),1)
Else
 MyIp = ChkStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"),1)
 If InStr(MyIp, ",") > 0 Then MyIp = ChkStr(Left(MyIp, InStr(MyIp, ",") - 1),1)
End If
%>
<td><input name="IP" type="text" value="<%=MyIp%>">(默认是你自己的IP)</td>
</tr>
<tr> 
<td></td>
<td>
<input type="submit" name="submit" value="删除" class="btn btn-primary">
</td>
</tr>
</table>
</form>