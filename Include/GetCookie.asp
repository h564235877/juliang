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
'--��վ��
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

If Session("CFWztgUser")<>"" And CFWztgUserCookie="" Then'Session���ڵ�cookie������ʱ������дCookie
  Sql="Select UserCode From CFWztg_User Where UserName='"&Session("CFWztgUser")&"'"
  Set Rs=Conn.Execute(Sql)
  If Not Rs.Eof Then
   Response.Cookies("CFWztgUserCookie")=Rs("UserCode")
  Else
   Session("CFWztgUser")=""
  End If
  Rs.Close
End If


'--�����
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

If Session("CFWztgAdUser")<>"" And CFWztgAdUserCookie="" Then'Session���ڵ�cookie������ʱ������дCookie
  Sql="Select UserCode From CFWztg_User Where UserName='"&Session("CFWztgAdUser")&"'"
  Set Rs=Conn.Execute(Sql)
  If Not Rs.Eof Then
   Response.Cookies("CFWztgAdUserCookie")=Rs("UserCode")
  Else
   Session("CFWztgAdUser")=""
  End If
  Rs.Close
End If


'--�ͷ�
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

If Session("CFWztgSeUser")<>"" And CFWztgSeUserCookie="" Then'Session���ڵ�cookie������ʱ������дCookie
  Sql="Select UserCode From CFWztg_User Where UserName='"&Session("CFWztgSeUser")&"'"
  Set Rs=Conn.Execute(Sql)
  If Not Rs.Eof Then
   Response.Cookies("CFWztgSeUserCookie")=Rs("UserCode")
  Else
   Session("CFWztgSeUser")=""
  End If
  Rs.Close
End If


'--����
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

If Session("CFWztgCoUser")<>"" And CFWztgCoUserCookie="" Then'Session���ڵ�cookie������ʱ������дCookie
  Sql="Select UserCode From CFWztg_User Where UserName='"&Session("CFWztgCoUser")&"'"
  Set Rs=Conn.Execute(Sql)
  If Not Rs.Eof Then
   Response.Cookies("CFWztgCoUserCookie")=Rs("UserCode")
  Else
   Session("CFWztgCoUser")=""
  End If
  Rs.Close
End If


'--����Ա
CFWztgAdminCookie=Chkstr(Request.Cookies("CFWztgAdminCookie"),1)

If Session("CFWztgAdmin")="" And CFWztgAdminCookie<>"" Then  
 Sql="Select AdminUserName,AdminCode,PowerLevel,PowerHold From CFWztg_AdminUser where AdminCode='"&CFWztgAdminCookie&"'"
 Set Rs=Conn.Execute(Sql)
 If Not Rs.Eof Then Session("CFWztgAdmin") = "AdminUserName=" & Rs("AdminUserName") & "|-|AdminCode=" & Rs("AdminCode") & "|-|PowerLevel=" & Rs("PowerLevel") & "|-|PowerHold=" & Rs("PowerHold")
 Rs.Close
End If

If Session("CFWztgAdmin")<>"" And CFWztgAdminCookie="" Then'Session���ڵ�cookie������ʱ������дCookie
   Response.Cookies("CFWztgAdminCookie")=GetStr(Session("CFWztgAdmin"),"AdminCode")
End If
%>