<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>



<table class="tb_1">
<tr class="tr_1"> 
<td>程序注册</td>
</tr>

<form name="form5" method="post" action="../../AdminUser.aspx?Action=licencodemodifysave">
<tr> 
<td>
<%
Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select LicenCode From CFWztg_Admin"
Rs.open Sql,Conn,1,1
%>
获取序列号码唯一途径，程序官方网站<a href="http://www.qqcf.com" target="_blank">乘风原创程序http://www.qqcf.com</a>，输入你获得的序列号： 
<br>
<input name="LicenCode" type="text" value="<%=rs("LicenCode")%>" size="150"> 
<br><input type="submit" name="submit" id="submit" value="注册" class="btn btn-primary">
</td>
</tr>
</form>
<%Rs.Close%>

<tr> 
<td>
<script src="../../AdminUser.aspx?Action=licencheck&ranstr=<%=now%>"></script>
</td>
</tr>
</table>