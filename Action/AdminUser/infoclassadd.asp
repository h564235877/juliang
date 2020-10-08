<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<form name="form4" method="post" action="../../AdminUser.aspx?Action=infoclassaddsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">增加类别名</td>
</tr>
<tr> 
<td width="80" class="td_r">类别名：</td>
<td><input name="InfoClassName" type="text" id="InfoClassName"></td>
</tr>
<tr> 
<td></td>
<td><input type="submit" name="submit" value="新增" class="btn btn-primary"></td>
</tr>
</table>
</form>