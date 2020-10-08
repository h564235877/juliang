<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>


<form name="form2" method="post" action="../../AdminUser.aspx?Action=emailsendsave">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">邮件发送</td>
</tr>
<tr> 
<td width="100" class="td_r">收信人：</td>
<td><input name="Email" type="text" id="Email" value="<%=ChkStr(Request("Email"),1)%>" size="62">(如果多个邮件请用英文逗号,分隔）</td>
</tr>
<tr>
<td class="td_r">邮件主题：</td>
<td><input name="EmailSubject" type="text" id="EmailSubject" value="<%=ChkStr(Request("EmailSubject"),1)%>" size="62"></td>
</tr>
<tr> 
<td class="td_r">邮件内容：</td>
<td><textarea name="EmailBody" cols="60" rows="7" id="EmailBody"><%=ChkStr(Request("EmailBody"),1)%></textarea></td>
</tr>
<tr> 
<td></td>
<td>
<input type="submit" name="submit" value="发送" class="btn btn-primary">
</td>
</tr>
</table>
</form>