<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>
<!--#Include File="Conn.asp"-->
<!--#Include File="Include/MyFunction.asp"-->
<!--#Include File="Include/Template.asp"-->
<!--#Include File="Include/Md5.asp"-->
<!--#Include File="Include/GetCookie.asp"-->
<!--#Include File="Include/CF_Do.asp"-->
<%
'--�ж��Ƿ�֧��Fso������ж�ģ��Ŀ¼�Ƿ����
Err = 0
Set fso = Server.CreateObject("Scripting.FileSystemObject")
If 0 <> Err Then Response.Write "�ռ䲻֧��Fso���":Response.End

'--�����ֹ�ָ���豸,��������豸����ָ����ģ��
Site=ChkStr(Request.Cookies("CFWztgSiteCookie"),1)
If (Site="mobile") Or (Site="" And InStr("΢��,��׿,iPhone,iPad",GetOsType())>0) Then
TemplateName=TemplateName_M
UserManagePath=UserManagePath_M
AdUserManagePath=AdUserManagePath_M
AdminUserManagePath=AdminUserManagePath_M
End If

If fso.FolderExists(Server.MapPath(TemplateName&"/"))=False Then
 Response.Write("ģ��Ŀ¼"&TempletName&"�����ڣ��Զ�����Ĭ��ģ��")
 TempletName = "default"
End If
Set fso=Nothing

TemplateFile = Request("f")
If TemplateFile="" Then TemplateFile="index"
TemplateFilePath = TemplateName&"/"&TemplateFile&".html"

'--���ѡ���ģ������ļ�������ʱ
Set fso = Server.CreateObject("Scripting.FileSystemObject")
If fso.FileExists(Server.MapPath(TemplateFilePath))=False Then
 Response.Write("ģ��Ŀ¼"&TemplateName&"�ﲻ��������Ҫ���õ�html�ļ�������")
 Response.End
End If
Set fso = Nothing


'--����ҳ���¼ҳʱ����Զ���¼�����������û��ĵ�¼cookieʱ
If (TemplateFile="index" Or TemplateFile="login") And RsSet("AutoLogin")=1 And Request.Cookies("CFWztgUserCookie")<>"" Then
 Response.Redirect UserManagePath
End If

'--������û�logo֮��������ƹ����ӣ������¼��ƹ���ʱ��ת
If Request.QueryString("userid")<>"" Then
 If LowReg_Ad_ID<>0 Then Response.Redirect "cf.aspx?"&ChkStr(Request.QueryString("userid"),2)
End If

'--д��ͷ�רԱ��id,��Ҫ����ģ���������
If Request.QueryString("s")<>"" Then
  Response.Cookies("CFWztgSeCookie")=ChkStr(Request.QueryString("s"),2)
  Response.Cookies("CFWztgSeCookie").expires=Dateadd("d",30,Now())
  
  '--ȡ������ͷ�����������ID,�������ͬʱд��
  Sql="Select ID From CFWztg_User Where UserType=4 And UserName=(Select BindUserName From CFWztg_User Where UserType=3 And ID="&ChkStr(Request.QueryString("c"),2)&")"
  Set Rs=Conn.ExeCute(Sql)
  If Not Rs.Eof Then
   Response.Cookies("CFWztgCoCookie")=Rs("ID")
   Response.Cookies("CFWztgCoCookie").expires=Dateadd("d",30,Now())
  End If
  Rs.Close
End If



'--д������רԱ��id,��Ҫ����ģ���������
If Request.QueryString("c")<>"" Then
  Response.Cookies("CFWztgCoCookie")=ChkStr(Request.QueryString("c"),2)
  Response.Cookies("CFWztgCoCookie").expires=Dateadd("d",30,Now())

  '--ȡ�������������Ŀͷ�ID,�������ͬʱд��
  Sql="Select ID From CFWztg_User Where UserType=3 And BindUserName=(Select UserName From CFWztg_User Where UserType=4 And ID="&ChkStr(Request.QueryString("c"),2)&")"
  Set Rs=Conn.ExeCute(Sql)
  If Not Rs.Eof Then
   Response.Cookies("CFWztgSeCookie")=Rs("ID")
   Response.Cookies("CFWztgSeCookie").expires=Dateadd("d",30,Now())
  End If
  Rs.Close
End If

'--��ȡģ�����
TemplateCode_Top = TemplateConvert(FSOFileRead(TemplateName&"/top.html"),"","")

TemplateCode_Bottom = TemplateConvert(FSOFileRead(TemplateName&"/bottom.html"),"","")

TemplateCode_Main = TemplateConvert(FSOFileRead(TemplateFilePath),TemplateCode_Top,TemplateCode_Bottom)

Response.Write TemplateCode_Main

%>