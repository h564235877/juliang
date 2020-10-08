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
If Action="upuniondatain" Then
unionurl=Request("unionurl")
username=Request("username")
pwd=Request("pwd")
tcrate=Request("tcrate")
startdate=Request("startdate")
enddate=Request("enddate")


If unionurl="" Then
 Response.write "上级联盟网址为空"
 Response.End
End If

If username="" Then
 Response.write "用户名不能为空"
 Response.End
End If

If pwd="" Then
 Response.write "登录密码不能为空"
 Response.End
End If

If tcrate="" Then
 Response.write "获利的百分比不能为空"
 Response.End
End If

If startdate="" Then
 Response.write "开始日期不能为空"
 Response.End
End If

If enddate="" Then
 Response.write "结束日期不能为空"
 Response.End
End If

Response.Redirect "aduser.aspx?Action=upuniondatain&unionurl="&unionurl&"&username="&username&"&pwd="&pwd&"&adusername="&Request("adusername")&"&tcrate="&tcrate&"&startdate="&startdate&"&enddate="&enddate
End If


If Action="upunioncpsin" Then
unionurl=Request("unionurl")
username=Request("username")
pwd=Request("pwd")
tcrate=Request("tcrate")
startdate=Request("startdate")
enddate=Request("enddate")

If unionurl="" Then
 Response.write "上级联盟网址为空"
 Response.End
End If

If username="" Then
 Response.write "用户名不能为空"
 Response.End
End If

If pwd="" Then
 Response.write "登录密码不能为空"
 Response.End
End If

If tcrate="" Then
 Response.write "CPS获利的百分比不能为空"
 Response.End
End If

If startdate="" Then
 Response.write "开始日期不能为空"
 Response.End
End If

If enddate="" Then
 Response.write "结束日期不能为空"
 Response.End
End If

Response.Redirect "aduser.aspx?Action=upunioncpsin&unionurl="&unionurl&"&username="&username&"&pwd="&pwd&"&tcrate="&tcrate&"&startdate="&startdate&"&enddate="&enddate
End If


If Action="upuniondayin" Then
unionurl=Request("unionurl")
username=Request("username")
pwd=Request("pwd")
startdate=Request("startdate")
enddate=Request("enddate")

If unionurl="" Then
 Response.write "上级联盟网址为空"
 Response.End
End If

If username="" Then
 Response.write "用户名不能为空"
 Response.End
End If

If pwd="" Then
 Response.write "登录密码不能为空"
 Response.End
End If

If startdate="" Then
 Response.write "开始日期不能为空"
 Response.End
End If

If enddate="" Then
 Response.write "结束日期不能为空"
 Response.End
End If

Response.Redirect "aduser.aspx?Action=upuniondayin&unionurl="&unionurl&"&username="&username&"&pwd="&pwd&"&startdate="&startdate&"&enddate="&enddate
End If

If Action="aduserlogout" Then
 Session("CFWztgAdUser")=""
 Response.Cookies("CFWztgAdUserCooKie")=""
 Response.Cookies("CFWztgAdUserCooKie").Expires=Dateadd("n",-60,Now())
 Response.Redirect "../../"
End If
%>