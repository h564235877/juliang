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
Sql="Select AdUserName,PayMoney From CFWztg_AdUser_OnlinePay Where PayOk=0 And OrderCode='"&OrderCode&"'"
Set Rs= Conn.Execute(Sql)
If Rs.Eof Then
 Rs.Close
 Response.write "���������ڻ��Ѿ���ֵ��"
 Response.End
Else
 AdUserName=Rs("AdUserName")
 PayMoney=Rs("PayMoney")
 Rs.Close
End If

Sql="Update CFWztg_AdUser_OnlinePay Set PayOk=1 Where OrderCode='"&OrderCode&"'"
Sql=Sql&";Update CFWztg_User Set Total_Cent=Total_Cent+" & PayMoney & ",Spare_Cent=Spare_Cent+" & PayMoney &" Where UserName='" & AdUserName & "'" 
Conn.Execute Sql
%>