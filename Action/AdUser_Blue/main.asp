<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">�˻���Ϣ</td>
</tr>
<%
Sql="Select * From CFWztg_User Where UserName='"&AdUserName&"'"
Set Rs=Conn.Execute(Sql)
%>
<TR>
<TD width="180" class="td_r">ʣ���</TD>
<TD><%=FormatNumber(Rs("Spare_Cent"),2,-1,0,0)%>Ԫ</TD>
</TR>

<tr>
<td class="td_r">δ��˹�淢������</td>
<td>
<%
Sql="Select Count(1) From CFWztg_AdUser_Expend where AdUserName='"&AdUserName&"' And AdminCheck=0"

Set Rs2=Conn.Execute(Sql)
Response.write "<a href='?Action=waitadlist'>"&Rs2(0)&"��</a>"
Rs2.Close
%>
</td>
</tr>

<tr>
<td class="td_r">δ��˹���޸�����</td>
<td>
<%
Sql="Select Count(1) From CFWztg_AD_Check a inner join CFWztg_AD b on a.ad_id=b.id Where b.AdUserName='"&AdUserName&"' And a.CheckState=1"

Set Rs2=Conn.Execute(Sql)
Response.write "<a href='?Action=waitadlist'>"&Rs2(0)&"��</a>"
Rs2.Close
%>
</td>
</tr>

<tr>
<td class="td_r">����Ա�����ѻظ���������</td>
<td>
<%
Sql="Select Count(1) From CFWztg_Gbook where UserName='"&AdUserName&"' And IsRead_Admin=1 And IsRead_User=0"
Set Rs2=Conn.Execute(Sql)
Response.write "<a href='?Action=gbooklist'>"&Rs2(0)&"��</a>"
Rs2.Close
%>
</td>
</tr>

<tr>
<td class="td_r">����Աδ�ظ���������</td>
<td>
<%
Sql="Select Count(1) From CFWztg_Gbook where UserName='"&AdUserName&"' And IsRead_Admin=0"
Set Rs2=Conn.Execute(Sql)
Response.write "<a href='?Action=gbooklist'>"&Rs2(0)&"��</a>"
Rs2.Close
%>
</td>
</tr>

<TR>
<TD class="td_r">
��������רԱ��
</TD>
<TD>
<%
If Rs("UpUserName")<>"" Then

Sql="Select UserNick,QQ From CFWztg_User where UserType=4 And UserState=1 And UserName='"&Rs("UpUserName")&"'"
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
If Not Rs2.Eof Then
 Response.write Rs2("UserNick")
 Response.write "��QQ:"&Rs2("QQ")&"&nbsp;<a target='_blank' href='http://wpa.qq.com/msgrd?v=3&uin="&Rs2("QQ")&"&site=qq&menu=yes'><img border='0'  src='../../images/qqonline2.gif' alt='���������ҷ���Ϣ' title='���������ҷ���Ϣ'></a>"
Else
 Response.write "��ǰ�ͷ�רԱʧЧ��<a href='?Action=datamodify'>����ѡ��һ��</a>?" 
End If
Rs2.Close

Else
 Response.write "��ǰû��ѡ��ͷ�רԱ��<a href='?Action=datamodify'>ѡ��һ��</a>?" 
End If
%>
</TD>
</TR>

<tr> 
<td class="td_r">
��һ�ε�¼ʱ�䣺
</td>
<td><%=Rs("PreviousLoginTime") %></td>
</tr>
  
<tr> 
<td class="td_r">
��һ�ε�¼IP��
</td>
<td><%=Rs("PreviousLoginIp")%>/<%=GetIpArea(Rs("PreviousLoginIp"))%></td>
</tr>

</table>



<table class="tb_1">
<tr class="tr_1"> 
<td>���˹���/<a href="?Action=sysinfolist">�鿴ȫ������</a></td>
</tr>
<%
Sql="Select Top 8 * From CFWztg_SysInfo Where Assort=2 Order By ListID Desc,ID Desc"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
I=0
While Not Rs.Eof
I=I+1
%>
<tr><td><A title=<%=Rs("Title")%> href="?Action=sysinfoshow&ID=<%=Rs("ID")%>"><%=Rs("Title")%></A><SPAN><%=Right("0"&Month(rs("AddDate")),2)&"-"&Right("0"&Day(rs("AddDate")),2)%></tr></td>
<%
Rs.MoveNext
Wend
%>
</table>

