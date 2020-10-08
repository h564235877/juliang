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
If Action="usergo" Then '--转到网站主后台,原来cookies存在需清理
 UserName=ChkStr(Request("UserName"),1)
 Session("CFWztgUser")=UserName
 Response.Cookies("CFWztgUserCookie")=""
 Response.Cookies("CFWztgUserCookie").Expires=Dateadd("n",-1440,Now())
 Response.Redirect("../../"&UserManagePath&"/")
End If

If Action="seusergo" Then '--转到客服后台
 SeUserName=ChkStr(Request("SeUserName"),1)
 Session("CFWztgSeUser")=SeUserName
 Response.Cookies("CFWztgSeUserCookie")=""
 Response.Cookies("CFWztgSeUserCookie").Expires=Dateadd("n",-1440,Now())
 Response.Redirect("../../"&SeUserManagePath&"/")
End If

If Action="cousergo" Then '--转到商务后台
 CoUserName=ChkStr(Request("CoUserName"),1)
 Session("CFWztgCoUser")=CoUserName
 Response.Cookies("CFWztgCoUser")=""
 Response.Cookies("CFWztgCoUser").Expires=Dateadd("n",-1440,Now())
 Response.Redirect("../../"&CoUserManagePath&"/")
End If

If Action="adusergo" Then '--转到广告主后台
 AdUserName=ChkStr(Request("AdUserName"),1)
 Session("CFWztgAdUser")=AdUserName
 Response.Cookies("CFWztgAdUserCookie")=""
 Response.Cookies("CFWztgAdUserCookie").Expires=Dateadd("n",-1440,Now())
 Response.Redirect("../../"&AdUserManagePath&"/")
End If


If Action="sqlexesave" Then
 If AdminOnlineExecSql=0 Then Call AlertBack("Conn.asp里设置了系统禁止在线执行Sql语句",1)

 Pwd=GoBack(ChkStr(Trim(Request("Pwd")),1),"请输入确认密码")

 Set Rs= Server.CreateObject("Adodb.RecordSet")
 Sql="Select Pwd,Salt From CFWztg_AdminUser Where AdminUserName='"& GetStr(Session("CFWztgAdmin"),"AdminUserName") &"'"
 Rs.Open Sql,Conn,3,2
 If Md5(Pwd & Rs("Salt"),2)<>Rs("Pwd") Then Call AlertBack("确认密码输入有错误",1)
 
 If GetStr(Session("CFWztgAdmin"),"PowerLevel")="2" And InStr(","&GetStr(Session("CFWztgAdmin"),"PowerHold")&",",",sqlexesave,")=0 Then
   Call AlertBack("没有执行的权限",1)
 End If
 
 Sql = Request.Form("Sql")
 Conn.Execute(Sql)
 
 Call AlertBack("执行成功",1)
End If


If Action="adminuserlogout" Then
 Session("CFWztgAdmin")=""
 Response.Cookies("CFWztgAdminCookie")=""
 Response.Redirect "../"
 Response.End
End If
%>