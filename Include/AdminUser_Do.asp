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
If Action="usergo" Then '--ת����վ����̨,ԭ��cookies����������
 UserName=ChkStr(Request("UserName"),1)
 Session("CFWztgUser")=UserName
 Response.Cookies("CFWztgUserCookie")=""
 Response.Cookies("CFWztgUserCookie").Expires=Dateadd("n",-1440,Now())
 Response.Redirect("../../"&UserManagePath&"/")
End If

If Action="seusergo" Then '--ת���ͷ���̨
 SeUserName=ChkStr(Request("SeUserName"),1)
 Session("CFWztgSeUser")=SeUserName
 Response.Cookies("CFWztgSeUserCookie")=""
 Response.Cookies("CFWztgSeUserCookie").Expires=Dateadd("n",-1440,Now())
 Response.Redirect("../../"&SeUserManagePath&"/")
End If

If Action="cousergo" Then '--ת�������̨
 CoUserName=ChkStr(Request("CoUserName"),1)
 Session("CFWztgCoUser")=CoUserName
 Response.Cookies("CFWztgCoUser")=""
 Response.Cookies("CFWztgCoUser").Expires=Dateadd("n",-1440,Now())
 Response.Redirect("../../"&CoUserManagePath&"/")
End If

If Action="adusergo" Then '--ת���������̨
 AdUserName=ChkStr(Request("AdUserName"),1)
 Session("CFWztgAdUser")=AdUserName
 Response.Cookies("CFWztgAdUserCookie")=""
 Response.Cookies("CFWztgAdUserCookie").Expires=Dateadd("n",-1440,Now())
 Response.Redirect("../../"&AdUserManagePath&"/")
End If


If Action="sqlexesave" Then
 If AdminOnlineExecSql=0 Then Call AlertBack("Conn.asp��������ϵͳ��ֹ����ִ��Sql���",1)

 Pwd=GoBack(ChkStr(Trim(Request("Pwd")),1),"������ȷ������")

 Set Rs= Server.CreateObject("Adodb.RecordSet")
 Sql="Select Pwd,Salt From CFWztg_AdminUser Where AdminUserName='"& GetStr(Session("CFWztgAdmin"),"AdminUserName") &"'"
 Rs.Open Sql,Conn,3,2
 If Md5(Pwd & Rs("Salt"),2)<>Rs("Pwd") Then Call AlertBack("ȷ�����������д���",1)
 
 If GetStr(Session("CFWztgAdmin"),"PowerLevel")="2" And InStr(","&GetStr(Session("CFWztgAdmin"),"PowerHold")&",",",sqlexesave,")=0 Then
   Call AlertBack("û��ִ�е�Ȩ��",1)
 End If
 
 Sql = Request.Form("Sql")
 Conn.Execute(Sql)
 
 Call AlertBack("ִ�гɹ�",1)
End If


If Action="adminuserlogout" Then
 Session("CFWztgAdmin")=""
 Response.Cookies("CFWztgAdminCookie")=""
 Response.Redirect "../"
 Response.End
End If
%>