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
ID=ChkStr(Request("ID"),2)

Set Rs = Server.CreateObject("Adodb.RecordSet")
Sql="Select * From CFWztg_AD Where ID="&ID
Rs.Open Sql,Conn,1,1
%>
<table class="tb_1">
<tr class="tr_1"> 
<td class="td_r">此广告只允许在以下网站发布：</td>
</tr>
<tr>
<td>
<%
Response.write Rs("PutSite")
%>
</td>
</tr>
</table>