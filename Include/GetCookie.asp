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
'--网站主
CFWztgUserCookie=Chkstr(Request.Cookies("CFWztgUserCookie"),1)

If Session("CFWztgUser")="" Then
 If CFWztgUserCookie<>"" Then
  Sql="Select UserName From CFWztg_User Where UserCode='"&CFWztgUserCookie&"'"
  Set Rs=Conn.Execute(Sql)
  If Not Rs.Eof Then
   Session("CFWztgUser")=Rs("UserName")
  Else
   Response.Cookies("CFWztgUserCookie")=""
   Response.Cookies("CFWztgUserCookie").Expires=Dateadd("n",-1440,Now())
  End If
  Rs.Close
 End If
End If

If Session("CFWztgUser")<>"" And CFWztgUserCookie="" Then'Session存在但cookie不存在时，重新写Cookie
  Sql="Select UserCode From CFWztg_User Where UserName='"&Session("CFWztgUser")&"'"
  Set Rs=Conn.Execute(Sql)
  If Not Rs.Eof Then
   Response.Cookies("CFWztgUserCookie")=Rs("UserCode")
  Else
   Session("CFWztgUser")=""
  End If
  Rs.Close
End If


'--广告主
CFWztgAdUserCookie=Chkstr(Request.Cookies("CFWztgAdUserCookie"),1)

If Session("CFWztgAdUser")="" Then
 If CFWztgAdUserCookie<>"" Then  
  Sql="Select UserName From CFWztg_User Where UserCode='"&CFWztgAdUserCookie&"'"
  Set Rs=Conn.Execute(Sql)
  If Not Rs.Eof Then
   Session("CFWztgAdUser")=Rs("UserName")
  Else
   Response.Cookies("CFWztgAdUserCookie")=""
   Response.Cookies("CFWztgAdUserCookie").Expires=Dateadd("n",-1440,Now())
  End If
  Rs.Close
 End If
End If

If Session("CFWztgAdUser")<>"" And CFWztgAdUserCookie="" Then'Session存在但cookie不存在时，重新写Cookie
  Sql="Select UserCode From CFWztg_User Where UserName='"&Session("CFWztgAdUser")&"'"
  Set Rs=Conn.Execute(Sql)
  If Not Rs.Eof Then
   Response.Cookies("CFWztgAdUserCookie")=Rs("UserCode")
  Else
   Session("CFWztgAdUser")=""
  End If
  Rs.Close
End If


'--客服
CFWztgSeUserCookie=Chkstr(Request.Cookies("CFWztgSeUserCookie"),1)

If Session("CFWztgSeUser")="" Then
 If CFWztgSeUserCookie<>"" Then  
  Sql="Select UserName From CFWztg_User Where UserCode='"&CFWztgSeUserCookie&"'"
  Set Rs=Conn.Execute(Sql)
  If Not Rs.Eof Then
   Session("CFWztgSeUser")=Rs("UserName")
  Else
   Response.Cookies("CFWztgSeUserCookie")=""
   Response.Cookies("CFWztgSeUserCookie").Expires=Dateadd("n",-1440,Now())
  End If
  Rs.Close
 End If
End If

If Session("CFWztgSeUser")<>"" And CFWztgSeUserCookie="" Then'Session存在但cookie不存在时，重新写Cookie
  Sql="Select UserCode From CFWztg_User Where UserName='"&Session("CFWztgSeUser")&"'"
  Set Rs=Conn.Execute(Sql)
  If Not Rs.Eof Then
   Response.Cookies("CFWztgSeUserCookie")=Rs("UserCode")
  Else
   Session("CFWztgSeUser")=""
  End If
  Rs.Close
End If


'--商务
CFWztgCoUserCookie=Chkstr(Request.Cookies("CFWztgCoUserCookie"),1)

If Session("CFWztgCoUser")="" Then
 If CFWztgCoUserCookie<>"" Then
  Sql="Select UserName From CFWztg_User Where UserCode='"&CFWztgCoUserCookie&"'"
  Set Rs=Conn.Execute(Sql)
  If Not Rs.Eof Then
   Session("CFWztgCoUser")=Rs("UserName")
  Else
   Response.Cookies("CFWztgCoUserCookie")=""
   Response.Cookies("CFWztgCoUserCookie").Expires=Dateadd("n",-1440,Now())
  End If
  Rs.Close
 End If
End If

If Session("CFWztgCoUser")<>"" And CFWztgCoUserCookie="" Then'Session存在但cookie不存在时，重新写Cookie
  Sql="Select UserCode From CFWztg_User Where UserName='"&Session("CFWztgCoUser")&"'"
  Set Rs=Conn.Execute(Sql)
  If Not Rs.Eof Then
   Response.Cookies("CFWztgCoUserCookie")=Rs("UserCode")
  Else
   Session("CFWztgCoUser")=""
  End If
  Rs.Close
End If


'--管理员
CFWztgAdminCookie=Chkstr(Request.Cookies("CFWztgAdminCookie"),1)

If Session("CFWztgAdmin")="" And CFWztgAdminCookie<>"" Then  
 Sql="Select AdminUserName,AdminCode,PowerLevel,PowerHold From CFWztg_AdminUser where AdminCode='"&CFWztgAdminCookie&"'"
 Set Rs=Conn.Execute(Sql)
 If Not Rs.Eof Then Session("CFWztgAdmin") = "AdminUserName=" & Rs("AdminUserName") & "|-|AdminCode=" & Rs("AdminCode") & "|-|PowerLevel=" & Rs("PowerLevel") & "|-|PowerHold=" & Rs("PowerHold")
 Rs.Close
End If

If Session("CFWztgAdmin")<>"" And CFWztgAdminCookie="" Then'Session存在但cookie不存在时，重新写Cookie
   Response.Cookies("CFWztgAdminCookie")=GetStr(Session("CFWztgAdmin"),"AdminCode")
End If
%>