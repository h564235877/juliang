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
If Action="upuniondatain" Then
unionurl=Request("unionurl")
username=Request("username")
pwd=Request("pwd")
tcrate=Request("tcrate")
startdate=Request("startdate")
enddate=Request("enddate")


If unionurl="" Then
 Response.write "�ϼ�������ַΪ��"
 Response.End
End If

If username="" Then
 Response.write "�û�������Ϊ��"
 Response.End
End If

If pwd="" Then
 Response.write "��¼���벻��Ϊ��"
 Response.End
End If

If tcrate="" Then
 Response.write "�����İٷֱȲ���Ϊ��"
 Response.End
End If

If startdate="" Then
 Response.write "��ʼ���ڲ���Ϊ��"
 Response.End
End If

If enddate="" Then
 Response.write "�������ڲ���Ϊ��"
 Response.End
End If

Response.Redirect "aduser.aspx?Action=upuniondatain&unionurl="&unionurl&"&username="&username&"&pwd="&pwd&"&adusername="&Request("adusername")&"&tcrate="&tcrate&"&startdate="&startdate&"&enddate="&enddate
End If


If Action="upunioncpsin" Then
unionurl=Request("unionurl")
username=Request("username")
pwd=Request("pwd")
tcrate=Request("tcrate")
startdate=Request("startdate")
enddate=Request("enddate")

If unionurl="" Then
 Response.write "�ϼ�������ַΪ��"
 Response.End
End If

If username="" Then
 Response.write "�û�������Ϊ��"
 Response.End
End If

If pwd="" Then
 Response.write "��¼���벻��Ϊ��"
 Response.End
End If

If tcrate="" Then
 Response.write "CPS�����İٷֱȲ���Ϊ��"
 Response.End
End If

If startdate="" Then
 Response.write "��ʼ���ڲ���Ϊ��"
 Response.End
End If

If enddate="" Then
 Response.write "�������ڲ���Ϊ��"
 Response.End
End If

Response.Redirect "aduser.aspx?Action=upunioncpsin&unionurl="&unionurl&"&username="&username&"&pwd="&pwd&"&tcrate="&tcrate&"&startdate="&startdate&"&enddate="&enddate
End If


If Action="upuniondayin" Then
unionurl=Request("unionurl")
username=Request("username")
pwd=Request("pwd")
startdate=Request("startdate")
enddate=Request("enddate")

If unionurl="" Then
 Response.write "�ϼ�������ַΪ��"
 Response.End
End If

If username="" Then
 Response.write "�û�������Ϊ��"
 Response.End
End If

If pwd="" Then
 Response.write "��¼���벻��Ϊ��"
 Response.End
End If

If startdate="" Then
 Response.write "��ʼ���ڲ���Ϊ��"
 Response.End
End If

If enddate="" Then
 Response.write "�������ڲ���Ϊ��"
 Response.End
End If

Response.Redirect "aduser.aspx?Action=upuniondayin&unionurl="&unionurl&"&username="&username&"&pwd="&pwd&"&startdate="&startdate&"&enddate="&enddate
End If

If Action="aduserlogout" Then
 Session("CFWztgAdUser")=""
 Response.Cookies("CFWztgAdUserCooKie")=""
 Response.Cookies("CFWztgAdUserCooKie").Expires=Dateadd("n",-60,Now())
 Response.Redirect "../../"
End If
%>