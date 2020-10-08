<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>
<!--#Include File="Conn.asp"-->
<!--#Include File="Include/MyFunction.asp"-->
<!--#Include File="Include/Template.asp"-->
<!--#Include File="Include/Md5.asp"-->
<!--#Include File="Include/GetCookie.asp"-->
<!--#Include File="Include/CF_Do.asp"-->
<%
'--判断是否支持Fso组件及判断模板目录是否存在
Err = 0
Set fso = Server.CreateObject("Scripting.FileSystemObject")
If 0 <> Err Then Response.Write "空间不支持Fso组件":Response.End

'--优先手工指定设备,否则根据设备调用指定的模板
Site=ChkStr(Request.Cookies("CFWztgSiteCookie"),1)
If (Site="mobile") Or (Site="" And InStr("微信,安卓,iPhone,iPad",GetOsType())>0) Then
TemplateName=TemplateName_M
UserManagePath=UserManagePath_M
AdUserManagePath=AdUserManagePath_M
AdminUserManagePath=AdminUserManagePath_M
End If

If fso.FolderExists(Server.MapPath(TemplateName&"/"))=False Then
 Response.Write("模板目录"&TempletName&"不存在，自动启用默认模板")
 TempletName = "default"
End If
Set fso=Nothing

TemplateFile = Request("f")
If TemplateFile="" Then TemplateFile="index"
TemplateFilePath = TemplateName&"/"&TemplateFile&".html"

'--如果选择的模板里的文件不存在时
Set fso = Server.CreateObject("Scripting.FileSystemObject")
If fso.FileExists(Server.MapPath(TemplateFilePath))=False Then
 Response.Write("模板目录"&TemplateName&"里不存在你需要调用的html文件，请检查")
 Response.End
End If
Set fso = Nothing


'--在首页或登录页时如果自动登录开启并存在用户的登录cookie时
If (TemplateFile="index" Or TemplateFile="login") And RsSet("AutoLogin")=1 And Request.Cookies("CFWztgUserCookie")<>"" Then
 Response.Redirect UserManagePath
End If

'--如果是用户logo之类带来的推广链接，存在下级推广广告时跳转
If Request.QueryString("userid")<>"" Then
 If LowReg_Ad_ID<>0 Then Response.Redirect "cf.aspx?"&ChkStr(Request.QueryString("userid"),2)
End If

'--写入客服专员的id,需要放在模板代码上面
If Request.QueryString("s")<>"" Then
  Response.Cookies("CFWztgSeCookie")=ChkStr(Request.QueryString("s"),2)
  Response.Cookies("CFWztgSeCookie").expires=Dateadd("d",30,Now())
  
  '--取出这个客服关联的商务ID,如果存在同时写入
  Sql="Select ID From CFWztg_User Where UserType=4 And UserName=(Select BindUserName From CFWztg_User Where UserType=3 And ID="&ChkStr(Request.QueryString("c"),2)&")"
  Set Rs=Conn.ExeCute(Sql)
  If Not Rs.Eof Then
   Response.Cookies("CFWztgCoCookie")=Rs("ID")
   Response.Cookies("CFWztgCoCookie").expires=Dateadd("d",30,Now())
  End If
  Rs.Close
End If



'--写入商务专员的id,需要放在模板代码上面
If Request.QueryString("c")<>"" Then
  Response.Cookies("CFWztgCoCookie")=ChkStr(Request.QueryString("c"),2)
  Response.Cookies("CFWztgCoCookie").expires=Dateadd("d",30,Now())

  '--取出这个商务关联的客服ID,如果存在同时写入
  Sql="Select ID From CFWztg_User Where UserType=3 And BindUserName=(Select UserName From CFWztg_User Where UserType=4 And ID="&ChkStr(Request.QueryString("c"),2)&")"
  Set Rs=Conn.ExeCute(Sql)
  If Not Rs.Eof Then
   Response.Cookies("CFWztgSeCookie")=Rs("ID")
   Response.Cookies("CFWztgSeCookie").expires=Dateadd("d",30,Now())
  End If
  Rs.Close
End If

'--读取模板代码
TemplateCode_Top = TemplateConvert(FSOFileRead(TemplateName&"/top.html"),"","")

TemplateCode_Bottom = TemplateConvert(FSOFileRead(TemplateName&"/bottom.html"),"","")

TemplateCode_Main = TemplateConvert(FSOFileRead(TemplateFilePath),TemplateCode_Top,TemplateCode_Bottom)

Response.Write TemplateCode_Main

%>