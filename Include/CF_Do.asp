<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>
<%
If Action="userloginsave" Then

UserName=GoBack(ChkStr(Trim(Request("UserName")),1),"�������û�����")
Pwd=GoBack(ChkStr(Trim(Request("Pwd")),1),"�������û�����")
Cookies_Time=Chkstr(Request("Cookies_Time"),2)
CheckCode=Chkstr(Trim(Request("CheckCode")),1)
'--��������֤��ʱ����
If RsSet("LoginCheckCode")=1 And Session("ValidCode")<>CheckCode Then Session("ValidCode")="":Call AlertRef("��λ���ֵ���֤���������!")

If Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" Then
 Ip = ChkStr(Request.ServerVariables("REMOTE_ADDR"),1)
Else
 Ip = ChkStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"),1)
End If

If RsSet("RegType")=1 Then
   Set Rs = Server.CreateObject("ADODB.Recordset")
   Sql="Select UserType,Pwd,Salt,Email,UserState,UserCode From CFWztg_User where UserName='"&UserName&"'"
   Rs.Open Sql,Conn,1,1
   If Rs.Eof And Rs.Bof Then Call AlertRef("û�д��û�!")
   If Md5(Pwd&Rs("Salt"),2)<>Rs("Pwd") Then Call AlertRef("�������!")
   UserType = Rs("UserType")
   Email = Rs("Email")
   Pwd_Md5 = Rs("Pwd")
   UserState = Rs("UserState")   
   Rs.Close

ElseIf RsSet("RegType")=2 Then
   Connstr_Rec="DBQ="+server.mappath(RsSet("AccessPath"))+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
   Set conn_Rec= Server.CreateObject ("ADODB.Connection")
   Conn_Rec.Open Connstr_Rec
   If Err Then
    Err.Clear
    Set Conn = Nothing
    Response.Write "���ݿ����ӳ������������ִ���"
    Response.End
   End If
   Sql="Select "&RsSet("SaveRegUserID")&","&RsSet("SaveRegEmail")&" From "&RsSet("SaveRegTable")&" where "&RsSet("SaveRegUserName")&"='"&UserName&"'"
   If RsSet("PassWordType")=1 then
     Sql=Sql&" And "&RsSet("SaveRegPassword")&"='"&Pwd&"'"
   ElseIf  RsSet("PassWordType")=2 then
     Sql=Sql&" And ("&RsSet("SaveRegPassword")&"='"&LCase(Md5(Pwd,1))&"' Or "&RsSet("SaveRegPassword")&"='"&UCase(Md5(Pwd,1))&"')"
   ElseIf  RsSet("PassWordType")=3 then
     Sql=Sql&" And ("&RsSet("SaveRegPassword")&"='"&LCase(Md5(Pwd,2))&"' Or "&RsSet("SaveRegPassword")&"='"&UCase(Md5(Pwd,2))&"')"
   End If
   Set Rs=Conn_Rec.ExeCute(Sql)   
   If Rs.Eof And Rs.Bof Then
    Call AlertRef("�û�����������������")
   Else
	UserID=Chkstr(Rs(0),2)
	Email=Chkstr(Rs(1),1)
   End If

ElseIf RsSet("RegType")=3 Then
   Connstr_rec="DRIVER={SQL Server};SERVER="&RsSet("SqlIP")&";UID="&RsSet("SqlLinkName")&";PWD="&RsSet("SqlLinkPassword")&";DATABASE="&RsSet("SqlDbName")&""
   Set Conn_Rec= Server.CreateObject ("ADODB.Connection")
   Conn_Rec.Open Connstr_rec
   If Err Then
    Err.Clear
    Set Conn = Nothing
    Response.Write "���ݿ����ӳ������������ִ���"
    Response.End
   End If
   Sql="Select "&RsSet("SaveRegUserID")&","&RsSet("SaveRegEmail")&" From "&RsSet("SaveRegTable")&" where "&RsSet("SaveRegUserName")&"='"&UserName&"'"
   If RsSet("PassWordType")=1 then
     Sql=Sql&" And "&RsSet("SaveRegPassword")&"='"&Pwd&"'"
   ElseIf  RsSet("PassWordType")=2 then
     Sql=Sql&" And ("&RsSet("SaveRegPassword")&"='"&LCase(Md5(Pwd,1))&"' Or "&RsSet("SaveRegPassword")&"='"&UCase(Md5(Pwd,1))&"')"
   ElseIf  RsSet("PassWordType")=3 then
     Sql=Sql&" And ("&RsSet("SaveRegPassword")&"='"&LCase(Md5(Pwd,2))&"' Or "&RsSet("SaveRegPassword")&"='"&UCase(Md5(Pwd,2))&"')"
   End If
   Set Rs=Conn_Rec.ExeCute(Sql)   
   If Rs.Eof And Rs.Bof Then
    Call AlertRef("�û�����������������")
   Else
	UserID=Chkstr(Rs(0),2)
	Email=Chkstr(Rs(1),1)
   End If
   
ElseIf RsSet("RegType")=4 Or RsSet("RegType")=5 Then
   UserID=0
End If

  If CLng(UserID)>0 Then'--��ϵͳ�û�������mysql���ݿ�,�Զ���ӿ�������ֵΪ0
    Set Rs= Server.CreateObject("ADODB.Recordset")
    Sql="Select UserType,Pwd,UserState,Email From CFWztg_User Where UserName='"&UserName&"'"
    Rs.Open Sql,Conn,3,2
	IF Rs.Eof Then
	 UserType=1
     UserState=RsSet("UserValid")
	 Pwd_Md5=Md5(GetRanStr(16),1)'--����������,����һ������ַ���16λMD5,ֻ�������á�

	 Sql="SET IDENTITY_Insert CFWztg_User ON"
     Sql=Sql&";Insert Into CFWztg_User (ID,UserName,Pwd,Email,Total_Cent,Spare_Cent,UserState) Values ("&UserID&",'"&UserName&"','"&Pwd_Md5&"','"&Email&"',"&RsSet("UserFirstDot")&","&RsSet("UserFirstDot")&","&UserState&")"
     Sql=Sql&";SET IDENTITY_Insert CFWztg_User Off;"
     Conn.Execute Sql'�����ڴ��û�����������û��ļ�¼
	Else
     UserType = Rs("UserType")
	 Pwd_Md5 = Rs("Pwd")
	 UserState = Rs("UserState")	 

	 Rs("Email")=Email'--��������ȡ����Email��ַ
     Rs.Update	 
	End If
	Rs.Close
  End if


  If RsSet("RegType")=4 Then'ΪMysql�ӿ�ʱ
   Response.write "<!DOCTYPE html>"
   Response.write "<html>"
   Response.write "<head>"
   Response.write "<title>��¼�ӿ�</title>"
   Response.write "<meta content=""text/html; charset=gbk"" http-equiv=Content-Type>"
   Response.write "</head>"
   Response.write "<body onLoad='form1.submit();'>"
   Response.write "<form method='post' name='form1' action='cf_phpuserlogin.php'>"
   Response.write "<input type='hidden' name='username' value='"&UserName&"'>"
   Response.write "<input type='hidden' name='pwd' value='"&Pwd&"'>"
   Response.write "<input type='hidden' name='cookies_time' value='"&Cookies_Time&"'>"
   Response.write "<input type='hidden' name='loginsubmit' value='�û���¼'>"
   Response.write "</form>"
   Response.write "</body>"
   Response.End
  ElseIf RsSet("RegType")=5 Then'Ϊ�Զ���ӿ�ʱ
   Response.write "<!DOCTYPE html>"
   Response.write "<html>"
   Response.write "<head>"
   Response.write "<title>��¼�ӿ�</title>"
   Response.write "<meta content=""text/html; charset=gbk"" http-equiv=Content-Type>"
   Response.write "</head>"
   Response.write "<body onLoad='form1.submit();'>"
   Response.write "<form method='post' name='form1' action='"&RsSet("SelfRecUrl")&"'>"
   Response.write "<input type='hidden' name='username' value='"&UserName&"'>"
   Response.write "<input type='hidden' name='pwd' value='"&Pwd&"'>"
   Response.write "<input type='hidden' name='cookies_time' value='"&Cookies_Time&"'>"
   Response.write "<input type='hidden' name='loginsubmit' value='�û���¼'>"
   Response.write "</form>"
   Response.write "</body>"
   Response.End
  Else

	If UserState=0 Then
	 Call AlertUrl("�˺���ͣ��,�޷���¼!",HttpPath(5))
	ElseIf UserState=2 Then
	 Call AlertUrl("�˺Ż�û��ͨ���ʼ���֤,������֤!","?f=uservalid&username=" & UserName & "&email=" & Email & "&maketime=" & DateDiff("s","1970-1-1",Now) &"&checkcode=" & Md5(UserName & Email & DateDiff("s","1970-1-1",Now) & Pwd_Md5, 2))
	ElseIf UserState=3 Then
	 Call AlertUrl("�˺Ż�û��ͨ������Ա���,�޷���¼!",HttpPath(5))
	End If

	'--�����ֹ�ָ���豸,��������豸����ָ����ģ��
	Site=ChkStr(Request.Cookies("CFWztgSiteCookie"),1)
	If (Site="mobile") Or (Site="" And InStr("΢��,��׿,iPhone,iPad",GetOsType())>0) Then
	TemplateName=TemplateName_M
	UserManagePath=UserManagePath_M
	AdUserManagePath=AdUserManagePath_M
	AdminUserManagePath=AdminUserManagePath_M
	End If

   UserCode=Md5(UserName&Pwd&SysCode,2)

   If UserType=1 Then'--�û�Ϊ��վ��ʱ
    If RsSet("UserLoginOpen")=0 Then Call AlertRef("ϵͳ�Ѿ��ر���վ����¼")
    Session("CFWztgUser")=UserName
    ReUrl=UserManagePath
    Response.Cookies("CFWztgUserCookie")=UserCode
    If Cookies_Time<>"" Then Response.Cookies("CFWztgUserCookie").expires=Dateadd("n",Cookies_Time,Now())

   ElseIf UserType=2 Then'--�û�Ϊ�����ʱ
    If RsSet("AdUserLoginOpen")=0 Then Call AlertRef("ϵͳ�Ѿ��رչ������¼")
    Session("CFWztgAdUser")=UserName
    ReUrl=AdUserManagePath
    Response.Cookies("CFWztgAdUserCookie")=UserCode
    If Cookies_Time<>"" Then Response.Cookies("CFWztgAdUserCookie").expires=Dateadd("n",Cookies_Time,Now())

   ElseIf UserType=3 Then'--�û�Ϊ�ͷ�ʱ
    Session("CFWztgSeUser") =  UserName	
    ReUrl=SeUserManagePath    
    Response.Cookies("CFWztgSeUserCookie")=UserCode
    If Cookies_Time<>"" Then Response.Cookies("CFWztgSeUserCookie").expires=Dateadd("n",Cookies_Time,Now())
	
   ElseIf UserType=4 Then'--�û�Ϊ����ʱ
    Session("CFWztgCoUser") =  UserName	
    ReUrl=CoUserManagePath    
    Response.Cookies("CFWztgCoUserCookie")=UserCode
    If Cookies_Time<>"" Then Response.Cookies("CFWztgCoUserCookie").expires=Dateadd("n",Cookies_Time,Now())

   End If

   Sql="Update CFWztg_User Set PreviousLoginIp=LastLoginIp,PreviousLoginTime=LastLoginTime,LastLoginIp='"&Ip&"',LastLoginTime=getdate(),LoginTotal=LoginTotal+1,UserCode='"&UserCode&"' Where UserName='"&UserName&"'"
   Conn.ExeCute Sql

   Response.Redirect ReUrl
 End If
End If


'--����mysql���ݿ�����û���¼ʱ
If Action="phpuserlogin" Then
 UserID=ChkStr(Trim(Request.Form("UserID")),2)
 UserName=ChkStr(Trim(Request.Form("UserName")),1)
 Pwd=ChkStr(Trim(Request.Form("Pwd")),1)
 Email=ChkStr(Trim(Request.Form("Email")),1)
 Cookies_Time=ChkStr(Trim(Request.Form("Cookies_Time")),2)
 CheckTime=ChkStr(Trim(Request.Form("CheckTime")),2)
 CheckCode=ChkStr(Trim(Request.Form("CheckCode")),1)
 
 If Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" Then
  Ip = ChkStr(Request.ServerVariables("REMOTE_ADDR"),1)
 Else
  Ip = ChkStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"),1)
 End If

 If UserID="" Or UserName="" Or Pwd="" Or CheckCode="" Then Response.write "��������":Response.End

 '--UTCʱ���8Сʱ��0.1Сʱ
 If Abs(DateDiff("s", "1970-1-1", Now) - CheckTime) > 3600 * 8.1 Then Call AlertUrl("��֤ʱ�����",HttpPath(5))

 If CheckCode<>Md5(UserID&UserName&Pwd&Email&CheckTime,2) Then Call AlertUrl("����������",HttpPath(5))

   If CLng(UserID)>0 Then
    Set Rs= Server.CreateObject("ADODB.Recordset")
    Sql="Select UserType,Pwd,UserState,Email From CFWztg_User Where UserName='"&UserName&"'"
    Rs.Open Sql,Conn,3,2
	IF Rs.Eof Then
	 UserType=1
	 UserState=RsSet("UserValid")
	 Pwd_Md5=Md5(GetRanStr(16),1)'--����������,����һ������ַ���16λMD5,ֻ�������á�

     Sql="SET IDENTITY_Insert CFWztg_User ON"
     Sql=Sql&";Insert Into CFWztg_User (ID,UserName,Pwd,Email,Total_Cent,Spare_Cent,UserState) Values ("&UserID&",'"&UserName&"','"&Pwd_Md5&"','"&Email&"',"&RsSet("UserFirstDot")&","&RsSet("UserFirstDot")&","&UserState&")"
     Sql=Sql&";SET IDENTITY_Insert CFWztg_User Off;"
     Conn.Execute Sql'�����ڴ��û�����������û��ļ�¼
	Else
     UserType = Rs("UserType")
     Pwd_Md5 = Rs("Pwd")
	 UserState = Rs("UserState")
	 Rs("Email")=Email
	 Rs.Update
	End If
    Rs.Close
   End if


If UserState=0 Then
 Call AlertUrl("�˺���ͣ��,�޷���¼!",HttpPath(5))
ElseIf UserState=2 Then
 Call AlertUrl("�˺Ż�û��ͨ���ʼ���֤,������֤!","?f=uservalid&username=" & UserName & "&email=" & Email & "&maketime=" & DateDiff("s","1970-1-1",Now) &"&checkcode=" & Md5(UserName & Email & DateDiff("s","1970-1-1",Now) & Pwd_Md5, 2))
ElseIf UserState=3 Then
 Call AlertUrl("�˺Ż�û��ͨ������Ա���,�޷���¼!",HttpPath(5))
End If


'--�����ֹ�ָ���豸,��������豸����ָ����ģ��
Site=ChkStr(Request.Cookies("CFWztgSiteCookie"),1)
If (Site="mobile") Or (Site="" And InStr("΢��,��׿,iPhone,iPad",GetOsType())>0) Then
TemplateName=TemplateName_M
UserManagePath=UserManagePath_M
AdUserManagePath=AdUserManagePath_M
AdminUserManagePath=AdminUserManagePath_M
End If

UserCode=Md5(UserName&Pwd&SysCode,2)

If UserType=1 Then
 If RsSet("UserLoginOpen") = 0 Then Call AlertRef("ϵͳ�Ѿ��ر���վ����¼")
 Session("CFWztgUser")=UserName
 ReUrl=UserManagePath 
 Response.Cookies("CFWztgUserCookie")=UserCode
 If Cookies_Time<>"" Then Response.Cookies("CFWztgUserCookie").expires=Dateadd("n",Cookies_Time,Now())

ElseIf UserType=2 Then
 If RsSet("AdUserLoginOpen") = 0 Then Call AlertRef("ϵͳ�Ѿ��رչ������¼")
 Session("CFWztgAdUser")=UserName	
 ReUrl=AdUserManagePath  
 Response.Cookies("CFWztgAdUserCookie")=UserCode
 If Cookies_Time<>"" Then Response.Cookies("CFWztgAdUserCookie").expires=Dateadd("n",Cookies_Time,Now())

End If

Sql="Update CFWztg_User Set PreviousLoginIp=LastLoginIp,PreviousLoginTime=LastLoginTime,LastLoginIp='"&Ip&"',LastLoginTime=getdate(),LoginTotal=LoginTotal+1,UserCode='"&UserCode&"' Where UserName='"&UserName&"'"
Conn.ExeCute Sql


Response.Redirect ReUrl

End If


'--�Զ����¼�ӿ�
If Action="userreclogin" Then
 UserID=ChkStr(Trim(Request("UserID")),2)
 UserName=ChkStr(Trim(Request("UserName")),1)
 Pwd=ChkStr(Trim(Request("Pwd")),1)
 Email=ChkStr(Trim(Request("Email")),1)
 Cookies_Time=ChkStr(Trim(Request("Cookies_Time")),2)
 CheckCode=ChkStr(Trim(Request("CheckCode")),1)

 If Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" Then
  Ip = ChkStr(Request.ServerVariables("REMOTE_ADDR"),1)
 Else
  Ip = ChkStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"),1)
 End If

 If CheckCode<>Md5(UserID&UserName&Pwd&SysCode,2) Then Call AlertUrl("����������",HttpPath(5))

   If CLng(UserID)>0 Then
    Set Rs= Server.CreateObject("ADODB.Recordset")
    Sql="Select UserType,Pwd,UserState,Email From CFWztg_User Where UserName='"&UserName&"'"
    Rs.Open Sql,Conn,3,2
	IF Rs.Eof Then
	 UserType=1
	 UserState=RsSet("UserValid")
	 Pwd_Md5=Md5(GetRanStr(16),1)'--����������,����һ������ַ���16λMD5,ֻ�������á�

     Sql="SET IDENTITY_Insert CFWztg_User ON"
     Sql=Sql&";Insert Into CFWztg_User (ID,UserName,Pwd,Email,Total_Cent,Spare_Cent,UserState) Values ("&UserID&",'"&UserName&"','"&Pwd_Md5&"','"&Email&"',"&RsSet("UserFirstDot")&","&RsSet("UserFirstDot")&","&UserState&")"
     Sql=Sql&";SET IDENTITY_Insert CFWztg_User Off;"
     Conn.Execute Sql'�����ڴ��û�����������û��ļ�¼
	Else
     UserType = Rs("UserType")
	 Pwd_Md5 = Rs("Pwd")
	 UserState = Rs("UserState")
	 Rs("Email")=Email
	 Rs.Update
	End If
	Rs.Close
   End If
   

If UserState=0 Then
 Call AlertUrl("�˺���ͣ��,�޷���¼!",HttpPath(5))
ElseIf UserState=2 Then
 Call AlertUrl("�˺Ż�û��ͨ���ʼ���֤,������֤!","?f=uservalid&username=" & UserName & "&email=" & Email & "&maketime=" & DateDiff("s","1970-1-1",Now) &"&checkcode=" & Md5(UserName & Email & DateDiff("s","1970-1-1",Now) & Pwd_Md5, 2))
ElseIf UserState=3 Then
 Call AlertUrl("�˺Ż�û��ͨ������Ա���,�޷���¼!",HttpPath(5))
End If


'--�����ֹ�ָ���豸,��������豸����ָ����ģ��
Site=ChkStr(Request.Cookies("CFWztgSiteCookie"),1)
If (Site="mobile") Or (Site="" And InStr("΢��,��׿,iPhone,iPad",GetOsType())>0) Then
TemplateName=TemplateName_M
UserManagePath=UserManagePath_M
AdUserManagePath=AdUserManagePath_M
End If

UserCode=Md5(UserName&Pwd&SysCode,2)

If UserType=1 Then
 If RsSet("UserLoginOpen") = 0 Then Call AlertRef("ϵͳ�Ѿ��ر���վ����¼")
 Session("CFWztgUser")=UserName
 ReUrl=UserManagePath
 
 Response.Cookies("CFWztgUserCookie")=UserCode
 If Cookies_Time<>"" Then Response.Cookies("CFWztgUserCookie").expires=Dateadd("n",Cookies_Time,Now())

ElseIf UserType=2 Then
 If RsSet("AdUserLoginOpen") = 0 Then Call AlertRef("ϵͳ�Ѿ��رչ������¼")
 Session("CFWztgAdUser") =  UserName	
 ReUrl=AdUserManagePath
 
 Response.Cookies("CFWztgAdUserCookie")=UserCode
 If Cookies_Time<>"" Then Response.Cookies("CFWztgAdUserCookie").expires=Dateadd("n",Cookies_Time,Now())

End If

Sql="Update CFWztg_User Set PreviousLoginIp=LastLoginIp,PreviousLoginTime=LastLoginTime,LastLoginIp='"&Ip&"',LastLoginTime=getdate(),LoginTotal=LoginTotal+1,UserCode='"&UserCode&"' Where UserName='"&UserName&"'"
Conn.ExeCute Sql

Response.Redirect ReUrl
End If

'--����Ա��¼
IF Action="adminlogin" Then
 AdminUserName=GoBack(ChkStr(Trim(Request("AdminUserName")),1),"���������Ա����")
 Pwd=GoBack(ChkStr(Trim(Request("Pwd")),1),"���������Ա����")
 Cookies_Time=Chkstr(Request("Cookies_Time"),2)
 CheckCode=GoBack(Chkstr(Trim(Request("CheckCode")),1),"��������֤��")

 If Session("ValidCode")<>CheckCode Then Session("ValidCode")="":Call AlertRef("��λ���ֵ���֤���������!")


 Set Rs = Server.CreateObject("ADODB.Recordset")
 Sql="Select * From CFWztg_AdminUser where AdminUserName='"&AdminUserName&"'"
 rs.open sql,conn,1,1
 IF Rs.eof and Rs.bof Then Call AlertRef("û�д˹���Ա����!")
 IF Rs("Pwd")<>Md5(Pwd&Rs("Salt"),2) Then Call AlertRef("�������!")

 Session("CFWztgAdmin") = "AdminUserName=" & Rs("AdminUserName") & "|-|AdminCode=" & Rs("AdminCode") & "|-|PowerLevel=" & Rs("PowerLevel") & "|-|PowerHold=" & Rs("PowerHold")

 AdminCode=Md5(Admin&Pwd&SysCode,2)
 
 Response.Cookies("CFWztgAdminCookie")=AdminCode
 If Cookies_Time<>"" Then Response.Cookies("CFWztgAdminCookie").expires=Dateadd("n",Cookies_Time,Now())

 If Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" Then
  Ip = ChkStr(Request.ServerVariables("REMOTE_ADDR"),1)
 Else
  Ip = ChkStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"),1)
 End If
 
 Sql="Update CFWztg_AdminUser Set PreviousLoginIp=LastLoginIp,PreviousLoginTime=LastLoginTime,LastLoginIp='"&Ip&"',LastLoginTime=getdate(),LoginTotal=LoginTotal+1,AdminCode='"&AdminCode&"' where AdminUserName='"&AdminUserName&"'"

 Conn.ExeCute Sql


 Response.Redirect "../"&AdminUserManagePath
End If



If Action="regsave" Then
UserType=Chkstr(Request.QueryString("UserType"),2)
UserName=Chkstr(Request.QueryString("UserName"),1)
UserCode=Chkstr(Request.QueryString("UserCode"),1)


'--�����ֹ�ָ���豸,��������豸����ָ����ģ��
Site=ChkStr(Request.Cookies("CFWztgSiteCookie"),1)
If (Site="mobile") Or (Site="" And InStr("΢��,��׿,iPhone,iPad",GetOsType())>0) Then
TemplateName=TemplateName_M
UserManagePath=UserManagePath_M
AdUserManagePath=AdUserManagePath_M
AdminUserManagePath=AdminUserManagePath_M
End If

 Sql = "Select Count(1) From CFWztg_User Where UserName='" & UserName & "' And UserCode='" & UserCode &"'"
 Set Rs=Conn.Execute(Sql)
 If Rs(0)>0 Then
   
  If CInt(UserType)=1 Then
   Session("CFWztgUser")=UserName
   Response.Cookies("CFWztgUserCookie")=UserCode
   Response.Redirect UserManagePath
  ElseIf CInt(UserType)=2 Then
   Session("CFWztgAdUser")=UserName
   Response.Cookies("CFWztgAdUserCookie")=UserCode
   Response.Redirect AdUserManagePath
  End If
  
 End If
 
End If


If Action="pc" Then
 Response.Cookies("CFWztgSiteCookie")="pc"
 Response.Redirect HttpPath(5)
End If

If Action="mobile" Then
 Response.Cookies("CFWztgSiteCookie")="mobile"
 Response.Redirect HttpPath(5)
End If

'--�����ǹ���Ա�˳�����ҳ
If Action="adminuserlogout" Then
 Session("CFWztgAdmin")=""
 Response.Cookies("CFWztgAdminCookie")=""
 Response.Redirect "./"
End If




If Action="inputdatasave" Then
saveid=ChkStr(Request("saveid"),2)

ad_id=ChkStr(Request("ad_id"),2)
adddate=ChkStr(Request("adddate"),3)
username=ChkStr(Request("username"),1)
Pv_Counter=ChkStr(Request("Pv_Counter"),2)
Uv_Counter=ChkStr(Request("Uv_Counter"),2)
Display_Counter=ChkStr(Request("Display_Counter"),2)
ClickPv_Counter=ChkStr(Request("ClickPv_Counter"),2)
ClickUv_Counter=ChkStr(Request("ClickUv_Counter"),2)
Click_Counter=ChkStr(Request("Click_Counter"),2)
Reg_Counter=ChkStr(Request("Reg_Counter"),2)
RndRate=ChkStr(Request("RndRate"),2)

CheckCode=ChkStr(Request("CheckCode"),1)

If ad_id="" Then Call AlertBack("û��ѡ����",1)

If adddate="" Then Call AlertBack("û����д����",1)


If username="" Then Call AlertBack("û����д��վ��",1)
If RndRate<0 or RndRate>1000 Then Call AlertBack("�������������0-1000֮��",1)

If CheckCode="" Then Call AlertBack("û����д��֤��",1)

If Pv_Counter="" Then Pv_Counter=0
If Uv_Counter="" Then Uv_Counter=0
If Display_Counter="" Then Display_Counter=0
If ClickPv_Counter="" Then ClickPv_Counter=0
If ClickUv_Counter="" Then ClickUv_Counter=0
If Click_Counter="" Then Click_Counter=0
If Reg_Counter="" Then Reg_Counter=0
If RndRate="" Then RndRate=0

If CheckCode<>Md5(ad_id&adddate&username&SysCode,2) Then Call AlertBack("��֤��������",1)

If adddate="1970-01-01" Then adddate=Date()'--��������Ҫ������֤���,�������ڱ����������֤�����

If RndRate>0 Then
Randomize()
I=int(2*rnd) '--0�ӣ�1��
 
If Pv_Counter>0 then
 Randomize()
 If I=0 Then
  Pv_Counter=Pv_Counter+int(Pv_Counter*RndRate*rnd/1000)
 Else
  Pv_Counter=Pv_Counter-int(Pv_Counter*RndRate*rnd/1000)
 End If
End If

If Uv_Counter>0 then
 Randomize()
 If I=0 Then
  Uv_Counter=Uv_Counter+int(Uv_Counter*RndRate*rnd/1000)
 Else
  Uv_Counter=Uv_Counter-int(Uv_Counter*RndRate*rnd/1000)
 End If
End If

If Display_Counter>0 then
 Randomize()
 If I=0 Then
  Display_Counter=Display_Counter+int(Display_Counter*RndRate*rnd/1000)
 Else
  Display_Counter=Display_Counter-int(Display_Counter*RndRate*rnd/1000)
 End If
End If

If ClickPv_Counter>0 then
 Randomize()
 If I=0 Then
  ClickPv_Counter=ClickPv_Counter+int(ClickPv_Counter*RndRate*rnd/1000)
 Else
  ClickPv_Counter=ClickPv_Counter-int(ClickPv_Counter*RndRate*rnd/1000)
 End If
End If

If ClickUv_Counter>0 then
 Randomize()
 If I=0 Then
  ClickUv_Counter=ClickUv_Counter+int(ClickUv_Counter*RndRate*rnd/1000)
 Else
  ClickUv_Counter=ClickUv_Counter-int(ClickUv_Counter*RndRate*rnd/1000)
 End If
End If

If Click_Counter>0 then
 Randomize()
 If I=0 Then
  Click_Counter=Click_Counter+int(Click_Counter*RndRate*rnd/1000)
 Else
  Click_Counter=Click_Counter-int(Click_Counter*RndRate*rnd/1000)
 End If
End If

If Reg_Counter>0 then
 Randomize()
 If I=0 Then
  Reg_Counter=Reg_Counter+int(Reg_Counter*RndRate*rnd/1000)
 Else
  Reg_Counter=Reg_Counter-int(Reg_Counter*RndRate*rnd/1000)
 End If
End If

If Reg_Counter>0 then
 Randomize()
 If I=0 Then
  Reg_Counter=Reg_Counter+int(Reg_Counter*RndRate*rnd/1000)
 Else
  Reg_Counter=Reg_Counter-int(Reg_Counter*RndRate*rnd/1000)
 End If
End If

End If


'--��0ʱ���ж�
if saveid<>"0" and instr(Application("saveid"),saveid)>0 Then
Response.write "�Ѿ�ִ�й������Ӳ�����ִ��"
Response.End
End If

Sql="Select AdState,Plan_ID,Unit_Cent,clickstate From CFWztg_AD Where ID="&ad_id
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
If Not Rs.Eof Then
 If Rs("AdState")<>2 Then
  Response.write "���״̬��������״̬"
  Response.End
 End If
 Plan_ID=Rs("Plan_ID")
 Unit_Cent=CDBL(Rs("Unit_Cent"))
 clickstate=Rs("clickstate")
Else
 Response.write "���ID������"
 Response.End
End If
Rs.Close

Sql="Select PlanState From CFWztg_Plan Where ID="&Plan_ID
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
If Not Rs.Eof Then
 If Rs("PlanState")<>2 Then
  Response.write "�ƻ�״̬��������״̬"
  Response.End
 End If
Else
 Response.write "�ƻ�ID������"
 Response.End
End If
Rs.Close


If clickstate=1 Then
User_Income_Cent=Unit_Cent*Click_Counter
User_Income_CPC=User_Income_Cent
User_Income_CPM=0
User_Income_CPA=0
ElseIf clickstate=2 Then
User_Income_Cent=Unit_Cent*Display_Counter
User_Income_CPC=0
User_Income_CPM=User_Income_Cent
User_Income_CPA=0
ElseIf clickstate=3 Then
User_Income_Cent=Unit_Cent*Reg_Counter
User_Income_CPC=0
User_Income_CPM=0
User_Income_CPA=User_Income_Cent
End If

'--��������ʱ�жϼƻ����ʣ����
If User_Income_Cent>0 Then
 Sql="Select ID From CFWztg_Plan Where ID="&Plan_ID&" And SpareClick_Cent<"&User_Income_Cent
 Set Rs = Server.CreateObject("Adodb.Recordset")
 Rs.open Sql,Conn,1,1
 If Not Rs.Eof Then
  Response.write "��������ƻ�ʣ�����"
  Response.End
 End If
 Rs.Close
Else
 Sql="Select ID From CFWztg_Plan Where ID="&Plan_ID&" And OverClick_Cent<"&abs(User_Income_Cent)
 Set Rs = Server.CreateObject("Adodb.Recordset")
 Rs.open Sql,Conn,1,1
 If Not Rs.Eof Then
  Response.write "������������ƻ�Ͷ�������ѽ������"
  Response.End
 End If
 Rs.Close
End If

Sql="Select ID From CFWztg_AD_Counter_Day Where ad_id="&ad_id&" And AddDate='"&AddDate&"' And username='"&username&"'"
Set Rs=Conn.Execute(Sql)
If Rs.Eof Then
 Sql="insert into CFWztg_AD_Counter_Day(ad_id,adddate,username,Pv_Counter,Uv_Counter,Display_Counter,ClickPv_Counter,ClickUv_Counter,Click_Counter,Reg_Counter,User_Income_Cent,User_Income_CPC,User_Income_CPM,User_Income_CPA,Pv_2_Counter,Uv_2_Counter,Display_2_Counter,ClickPv_2_Counter,ClickUv_2_Counter,Click_2_Counter,Reg_2_Counter,AdUser_Spend_Cent,AdUser_Spend_CPC,AdUser_Spend_CPM,AdUser_Spend_CPA) values("&ad_id&",'"&adddate&"','"&username&"',"&Pv_Counter&","&Uv_Counter&","&Display_Counter&","&ClickPv_Counter&","&ClickUv_Counter&","&Click_Counter&","&Reg_Counter&","&User_Income_Cent&","&User_Income_CPC&","&User_Income_CPM&","&User_Income_CPA&","&Pv_Counter&","&Uv_Counter&","&Display_Counter&","&ClickPv_Counter&","&ClickUv_Counter&","&Click_Counter&","&Reg_Counter&","&User_Income_Cent&","&User_Income_CPC&","&User_Income_CPM&","&User_Income_CPA&")"
 Conn.Execute Sql
Else
 Sql="update CFWztg_AD_Counter_Day set Pv_Counter=Pv_Counter+"&Pv_Counter&",Uv_Counter=Uv_Counter+"&Uv_Counter&",Display_Counter=Display_Counter+"&Display_Counter&",ClickPv_Counter=ClickPv_Counter+"&ClickPv_Counter&",ClickUv_Counter=ClickUv_Counter+"&ClickUv_Counter&",Click_Counter=Click_Counter+"&Click_Counter&",Reg_Counter=Reg_Counter+"&Reg_Counter&",User_Income_Cent=User_Income_Cent+"&User_Income_Cent&",User_Income_CPC=User_Income_CPC+"&User_Income_CPC&",User_Income_CPM=User_Income_CPM+"&User_Income_CPM&",User_Income_CPA=User_Income_CPA+"&User_Income_CPA&",Pv_2_Counter=Pv_2_Counter+"&Pv_Counter&",Uv_2_Counter=Uv_2_Counter+"&Uv_Counter&",Display_2_Counter=Display_2_Counter+"&Display_Counter&",ClickPv_2_Counter=ClickPv_2_Counter+"&ClickPv_Counter&",ClickUv_2_Counter=ClickUv_2_Counter+"&ClickUv_Counter&",Click_2_Counter=Click_2_Counter+"&Click_Counter&",Reg_2_Counter=Reg_2_Counter+"&Reg_Counter&",AdUser_Spend_Cent=AdUser_Spend_Cent+"&User_Income_Cent&",AdUser_Spend_CPC=AdUser_Spend_CPC+"&User_Income_CPC&",AdUser_Spend_CPM=AdUser_Spend_CPM+"&User_Income_CPM&",AdUser_Spend_CPA=AdUser_Spend_CPA+"&User_Income_CPA&" where ad_id="&ad_id&" and adddate='"&adddate&"' and username='"&username&"'"
 Conn.execute Sql
End If

 '--�۳����ƻ���Ͷ��
 If User_Income_Cent>0 Then
  Sql="update CFWztg_Plan set OverClick_Cent=OverClick_Cent+"&User_Income_Cent&",SpareClick_Cent=SpareClick_Cent-"&User_Income_Cent&" where ID="&Plan_ID
 Else
  Sql="update CFWztg_Plan set OverClick_Cent=OverClick_Cent-"&Abs(User_Income_Cent)&",SpareClick_Cent=SpareClick_Cent+"&Abs(User_Income_Cent)&" where ID="&Plan_ID
 End If
 
 Conn.execute Sql
 
 '--Ϊ��վ��������
 Sql="update CFWztg_User set Total_Cent=Total_Cent+"&User_Income_Cent&",Spare_Cent=Spare_Cent+"&User_Income_Cent&" where username='"&username&"'"
 Conn.execute Sql
 
 Reply="������ad_id:"&ad_id
 Reply=Reply&"<br>��������adddate:"&adddate
 Reply=Reply&"<br>��������Pv_Counter:"&Pv_Counter
 Reply=Reply&"<br>��������Uv_Counter:"&Uv_Counter
 Reply=Reply&"<br>��������Display_Counter:"&Display_Counter
 Reply=Reply&"<br>��������ClickPv_Counter:"&ClickPv_Counter
 Reply=Reply&"<br>��������ClickUv_Counter:"&ClickUv_Counter
 Reply=Reply&"<br>��������Click_Counter:"&Click_Counter
 Reply=Reply&"<br>��������Reg_Counter:"&Reg_Counter
 Reply=Reply&"<br>��վ������:"&User_Income_Cent&"Ԫ"
 

 '--Ϊ��վ��������
 Sql="insert into CFWztg_Gbook(username,content,Reply,ReplyTime) values('"&username&"','','"&Reply&"',getdate())"
 Conn.execute Sql


Application("saveid")=Application("saveid")&SaveID&"|"
 
Response.write "����ɹ�"
Response.End
End If
%>