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
DbAddress="localhost" 	'--������Sqlserver��������IP��ַ�����ݿ�ͳ�����ͬһ̨��������ֻҪ��дlocalhost�Ϳ���
DbUser="juliang"           	'--����������Sqlserver���������û���
DbPassword="123456"     '--����������Sqlserver������������
DbName="juliang"     		'--������Sqlserver�����������ݿ����� 


On Error Resume Next
ConnStr="Provider = Sqloledb;Data Source ="&DbAddress&";User ID ="&DbUser&";Password ="&DbPassword&";Initial Catalog ="&DbName&";"
Set Conn = Server.CreateObject ("Adodb.Connection")
Conn.Open ConnStr
If Err Then
 err.Clear
 Set Conn = Nothing
 Response.Write "���ݿ����ӳ������������ִ���"
 Response.End
End If

'--�Ƿ�����������Ա��̨���ݿ����������ִ��Sql��0Ϊ��1Ϊ�ǣ�Ĭ��Ϊ��
AdminOnlineExecSql=0

Action=ChkStr(Request("Action"),1)

Set RsSet=Server.CreateObject("Adodb.RecordSet")
Sql="Select Top 1 * From CFWztg_Admin Order By ID"
RsSet.Open Sql,Conn,1,1

If RsSet.Eof Then
 Response.Write "���ݿ��Ѿ������ϣ���ϵͳ�����ݲ����ڣ�"
 Response.end
End If

'--ϵͳ��ȫ��
SysCode=RsSet("SysCode")

'--ϵͳ����
SysTitle=RsSet("SysTitle")

'--ϵͳSeo����
SysSeoTitle=RsSet("SysSeoTitle")

'--ǰ̨�Ƿ�ʹ��α��̬
SiteHtml=RsSet("SiteHtml")

'--Ĭ�����߹��ID
LowReg_Ad_ID=RsSet("LowReg_Ad_ID")


'--����ʹ�õ�ģ������
TemplateName=RsSet("TemplateName")

'--�����û���̨ʹ�õ�Ŀ¼����
UserManagePath=RsSet("UserManagePath")

'--���Թ������̨ʹ�õ�Ŀ¼����
AdUserManagePath=RsSet("AdUserManagePath")

'--���Կͷ���̨ʹ�õ�Ŀ¼����
SeUserManagePath=RsSet("SeUserManagePath")

'--���������̨ʹ�õ�Ŀ¼����
CoUserManagePath=RsSet("CoUserManagePath")

'--���Թ���Ա��̨ʹ�õ�Ŀ¼����
AdminUserManagePath=RsSet("AdminUserManagePath")

'--�ֻ�ʹ�õ�ģ������
TemplateName_M=RsSet("TemplateName_M")

'--�ֻ��û���̨ʹ�õ�Ŀ¼����
UserManagePath_M=RsSet("UserManagePath_M")

'--�ֻ��������̨ʹ�õ�Ŀ¼����
AdUserManagePath_M=RsSet("AdUserManagePath_M")

'--�ֻ��ͷ���̨ʹ�õ�Ŀ¼����
SeUserManagePath_M=RsSet("SeUserManagePath_M")

'--�ֻ������̨ʹ�õ�Ŀ¼����
CoUserManagePath_M=RsSet("CoUserManagePath_M")

'--�ֻ�����Ա��̨ʹ�õ�Ŀ¼����
AdminUserManagePath_M=RsSet("AdminUserManagePath_M")




'--Script�����ȡ��������
AdScriptShowDomain=RsSet("AdScriptShowDomain")
'--Script����������
AdScriptClickDomain=RsSet("AdScriptClickDomain")
'--ֱ������������
AdZlDomain=RsSet("AdZlDomain")
'--����ǰ̨��������
AdSysWebDomain=RsSet("AdSysWebDomain")
'--��ǰ����
CurrDomain="http://"&HttpPath(1)&"/"

'--ֻ����д��ǰ̨������ʱ��ת��ǰ̨����
If AdSysWebDomain<>"" Then

'--��ǰ����������һ����ͬʱ��ǰ̨����������������ͬʱ�űȽ�
If (AdScriptShowDomain=CurrDomain And InStr(AdScriptShowDomain,AdSysWebDomain)=0) or (AdScriptClickDomain=CurrDomain And InStr(AdScriptClickDomain,AdSysWebDomain)=0)  or (AdZlDomain=CurrDomain And InStr(AdZlDomain,AdSysWebDomain)=0) Then
 '--����useridʱ404����ʱһ���Ǵӹ��logo�����ģ�ת������ǰ̨��������
 If InStr(LCase(Request.servervariables("QUERY_STRING")),"userid")=0 Then
  Response.write "��������ֹ����ǰ̨"
 Else
  Response.Redirect "http://"&AdSysWebDomain&"/?userid="&Request.QueryString("userid")
 End If
 Response.End
End If

End If
%>