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
If Action="seuserlogout" Then
 Session("CFWztgSeUser")=""
 Response.Cookies("CFWztgSeUserCooKie")=""
 Response.Cookies("CFWztgSeUserCooKie").Expires=Dateadd("n",-60,Now())
 Response.Redirect "../../"
End If
%>