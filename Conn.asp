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
DbAddress="localhost" 	'--请输入Sqlserver服务器的IP地址，数据库和程序在同一台服务器上只要填写localhost就可以
DbUser="juliang"           	'--请输入连接Sqlserver服务器的用户名
DbPassword="123456"     '--请输入连接Sqlserver服务器的密码
DbName="juliang"     		'--请输入Sqlserver服务器的数据库名称 


On Error Resume Next
ConnStr="Provider = Sqloledb;Data Source ="&DbAddress&";User ID ="&DbUser&";Password ="&DbPassword&";Initial Catalog ="&DbName&";"
Set Conn = Server.CreateObject ("Adodb.Connection")
Conn.Open ConnStr
If Err Then
 err.Clear
 Set Conn = Nothing
 Response.Write "数据库连接出错，请检查连接字串！"
 Response.End
End If

'--是否允许超级管理员后台数据库管理里在线执行Sql，0为否，1为是，默认为否
AdminOnlineExecSql=0

Action=ChkStr(Request("Action"),1)

Set RsSet=Server.CreateObject("Adodb.RecordSet")
Sql="Select Top 1 * From CFWztg_Admin Order By ID"
RsSet.Open Sql,Conn,1,1

If RsSet.Eof Then
 Response.Write "数据库已经连接上，但系统的数据不存在！"
 Response.end
End If

'--系统安全码
SysCode=RsSet("SysCode")

'--系统名称
SysTitle=RsSet("SysTitle")

'--系统Seo名称
SysSeoTitle=RsSet("SysSeoTitle")

'--前台是否使用伪静态
SiteHtml=RsSet("SiteHtml")

'--默认下线广告ID
LowReg_Ad_ID=RsSet("LowReg_Ad_ID")


'--电脑使用的模板名称
TemplateName=RsSet("TemplateName")

'--电脑用户后台使用的目录名称
UserManagePath=RsSet("UserManagePath")

'--电脑广告主后台使用的目录名称
AdUserManagePath=RsSet("AdUserManagePath")

'--电脑客服后台使用的目录名称
SeUserManagePath=RsSet("SeUserManagePath")

'--电脑商务后台使用的目录名称
CoUserManagePath=RsSet("CoUserManagePath")

'--电脑管理员后台使用的目录名称
AdminUserManagePath=RsSet("AdminUserManagePath")

'--手机使用的模板名称
TemplateName_M=RsSet("TemplateName_M")

'--手机用户后台使用的目录名称
UserManagePath_M=RsSet("UserManagePath_M")

'--手机广告主后台使用的目录名称
AdUserManagePath_M=RsSet("AdUserManagePath_M")

'--手机客服后台使用的目录名称
SeUserManagePath_M=RsSet("SeUserManagePath_M")

'--手机商务后台使用的目录名称
CoUserManagePath_M=RsSet("CoUserManagePath_M")

'--手机管理员后台使用的目录名称
AdminUserManagePath_M=RsSet("AdminUserManagePath_M")




'--Script类广告获取代码域名
AdScriptShowDomain=RsSet("AdScriptShowDomain")
'--Script类广告点击域名
AdScriptClickDomain=RsSet("AdScriptClickDomain")
'--直接类广告点击域名
AdZlDomain=RsSet("AdZlDomain")
'--联盟前台访问域名
AdSysWebDomain=RsSet("AdSysWebDomain")
'--当前域名
CurrDomain="http://"&HttpPath(1)&"/"

'--只有填写了前台的域名时才转向到前台域名
If AdSysWebDomain<>"" Then

'--当前域名和设置一样相同时，前台域名和设置域名不同时才比较
If (AdScriptShowDomain=CurrDomain And InStr(AdScriptShowDomain,AdSysWebDomain)=0) or (AdScriptClickDomain=CurrDomain And InStr(AdScriptClickDomain,AdSysWebDomain)=0)  or (AdZlDomain=CurrDomain And InStr(AdZlDomain,AdSysWebDomain)=0) Then
 '--不带userid时404，带时一般是从广告logo过来的，转到联盟前台访问域名
 If InStr(LCase(Request.servervariables("QUERY_STRING")),"userid")=0 Then
  Response.write "此域名禁止访问前台"
 Else
  Response.Redirect "http://"&AdSysWebDomain&"/?userid="&Request.QueryString("userid")
 End If
 Response.End
End If

End If
%>