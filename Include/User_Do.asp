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
If Action="userlogout" Then
 Session("CFWztgUser")=""
 Response.Cookies("CFWztgUserCooKie")=""
 Response.Cookies("CFWztgUserCooKie").Expires=Dateadd("n",-60,Now())
 Response.Redirect("../../")
End If
%>