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
Sql="Select Top 3 Reply,AddTime From CFWztg_Gbook Where Assort=0 And UserName='"&UserName&"' Order By AddTime Desc"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
If Not Rs.Eof Then%>
<div class="explain">
<span style="font-size:14px; font-weight:bold;">����Ա�������������ѣ�����������ϵ���Ŀͷ�רԱ��</span><br />
<%
I=0
While Not Rs.Eof
I=I+1
%>
<%=I%>.<%=Rs("Reply")%> [<%=Rs("AddTime")%>]<br />
<%
Rs.MoveNext
Wend
Rs.Close
%>
</div>
<%End If%>


<table class="tb_1">
<tr> 
<TD>
���Ŀͷ�רԱ��
<%
Sql="Select UpUserName From CFWztg_User Where UserName='"&UserName&"'"
Set Rs=Conn.Execute(Sql)
If Rs("UpUserName")<>"" Then

Sql="Select UserNick,QQ From CFWztg_User where UserType=3 And UserState=1 And UserName='"&Rs("UpUserName")&"'"
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
Rs.Close
%>
</TD>
</TR>
</table>

<%
If LowReg_Ad_ID<>0 Then
Sql="Select Count(1) From CFWztg_Ad Where ID="&LowReg_Ad_ID
Set Rs=Conn.Execute(Sql)
If Rs(0)>0 Then

Sql="Select ID From CFWztg_User Where UserName='"&UserName&"'"
Set Rs2=Conn.Execute(Sql)
UserID=Rs2("ID")
Rs2.Close
%>

<script src="../../js/clipboard.min.js"></script>

<table class="tb_1">
<tr class="tr_1"> 
<td>�����ƹ��ַ</td>
</tr>
<tr> 
<td>
<INPUT id=lowusercode value=<%=AdPath_2%>cf.aspx?<%=UserID%> size=40 type="text" readonly>

<input type="button" value="����" id="copya1" data-clipboard-target="#lowusercode" data-clipboard-action="copy" class="btn btn-sm btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>	

</td>
  </tr>
</table>

<table class="tb_2">
<tr>
<td>
<div class="explain">
<%
If RsSet("UserTcLayer")>0 Then
 Response.write "��ϵͳ֧��"&RsSet("UserTcLayer")&"���û��Ƽ���ɹ��ܣ�"
 If RsSet("UserTcLayer")>=1 Then Response.write "һ��(ֱ���Ƽ����û�)��" & RsSet("UserTcLayer1Rate") & "%��"
 If RsSet("UserTcLayer")>=2 Then Response.write "�����û���ɣ�" & RsSet("UserTcLayer2Rate") & "%��"
 If RsSet("UserTcLayer")>=3 Then Response.write "�����û���ɣ�" & RsSet("UserTcLayer3Rate") & "%��"
 If RsSet("UserTcLayer")>=4 Then Response.write "�ļ��û���ɣ�" & RsSet("UserTcLayer4Rate") & "%��"
 If RsSet("UserTcLayer")>=5 Then Response.write "�弶�û���ɣ�" & RsSet("UserTcLayer5Rate") & "%��"
 Response.write "Ϊ�����������ߣ���ӭ�ƹ㣡�벻Ҫ�Լ��Ƽ��Լ���������Ϊ���ϳ͡�"
End If
%>
</div>
</td>
</tr>

</table>
<%Else%>
<table class="tb_1">
<tr class="tr_1"> 
<td>�����ƹ��ַ</td>
</tr>
<tr> 
<td>
���߹��ID�����ڣ������Ա����ָ��
</td>
</tr>
</table>

<%
End If

End If
Rs.Close
%>

<table class="tb_1">
<tr class="tr_1"> 
<td colSpan=2>�˻���Ϣ</td>
</tr>
<%
Sql="Select * From CFWztg_User Where UserName='"&UserName&"'"
Set Rs=Conn.Execute(Sql)
%>
<TR>
<TD class="td_r" width="180">δ����</TD>
<TD><%=FormatNumber(Rs("Spare_Cent"),2,-1,0,0)%>Ԫ</TD>
</TR>

<tr>
<td class="td_r">δ��˽��������</td>
<td>
<%
Sql = "Select Count(1) From CFWztg_Spend Where UserName='"&UserName&"' And SpendType=0 And SpendState=1"
Set Rs2=Conn.Execute(Sql)
Response.write "<a href='?Action=spendlist&SpendType=0'>"&Rs2(0)&"��</a>"
Rs2.Close
%>
</td>
</tr>

<tr>
<td class="td_r">����Ա�����ѻظ���������</td>
<td>
<%
Sql="Select Count(1) From CFWztg_Gbook where UserName='"&UserName&"' And IsRead_Admin=1 And IsRead_User=0"
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
Sql="Select Count(1) From CFWztg_Gbook where UserName='"&UserName&"' And IsRead_Admin=0"
Set Rs2=Conn.Execute(Sql)
Response.write "<a href='?Action=gbooklist'>"&Rs2(0)&"��</a>"
Rs2.Close
%>
</td>
</tr>

<tr class="tr_1"> 
<td colSpan=2>CPC,CPV,CPA�������</td>
</tr>


<%
Sql="Select top 2 AddDate,Sum(User_Income_Cent) As User_Income_Cent,Sum(User_Income_CPC) As User_Income_CPC,Sum(User_Income_CPM) As User_Income_CPM,Sum(User_Income_CPA) As User_Income_CPA  From CFWztg_AD_Counter_Day Where UserName='"&UserName&"'  Group By AddDate Order By AddDate Desc"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
%>
<TR>
<TD  class="td_r"><%
If rs2("AddDate")=Date() Then
 Response.write "���죺"
ElseIf rs2("AddDate")=Date()-1 Then
 Response.write  "���죺"
Else
 Response.write Right("0"&Month(rs2("AddDate")),2)&"��"&Right("0"&Day(rs2("AddDate")),2)&"��"
End If
%>
</TD>
<TD>
<%
Response.write "�ܼ�����:"&FormatNumber(Cdbl(Rs2("User_Income_Cent")),2,-1,0,0)& "Ԫ"
Response.write "&nbsp;&nbsp;CPC����:"&FormatNumber(Cdbl(Rs2("User_Income_CPC")),2,-1,0,0)& "Ԫ"
Response.write "&nbsp;&nbsp;CPV����:"&FormatNumber(Cdbl(Rs2("User_Income_CPM")),2,-1,0,0)& "Ԫ"
Response.write "&nbsp;&nbsp;CPA����:"&FormatNumber(Cdbl(Rs2("User_Income_CPA")),2,-1,0,0)& "Ԫ"
%>
</TD>
</TR>
<%
Rs2.MoveNext
Wend
%>



<%
Sql="Select sum(User_Income_Cent) As User_Income_Cent,Sum(User_Income_CPC) As User_Income_CPC,Sum(User_Income_CPM) As User_Income_CPM,Sum(User_Income_CPA) As User_Income_CPA  From CFWztg_AD_Counter_Day Where UserName='"&UserName&"' and Datediff(m,AddDate,getdate())=0"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
%>
<TR>
<TD  class="td_r">
����:
</TD>
<TD>
<%
Response.write "�ܼ�����:"&FormatNumber(Cdbl(Rs2("User_Income_Cent")),2,-1,0,0)& "Ԫ"
Response.write "&nbsp;&nbsp;CPC����:"&FormatNumber(Cdbl(Rs2("User_Income_CPC")),2,-1,0,0)& "Ԫ"
Response.write "&nbsp;&nbsp;CPV����:"&FormatNumber(Cdbl(Rs2("User_Income_CPM")),2,-1,0,0)& "Ԫ"
Response.write "&nbsp;&nbsp;CPA����:"&FormatNumber(Cdbl(Rs2("User_Income_CPA")),2,-1,0,0)& "Ԫ"
%>
</TD>
</TR>
<%
Rs2.MoveNext
Wend
%>


<tr class="tr_1"> 
<td colSpan=2>CPS�������</td>
</tr>
<%
Sql="Select top 2 convert(varchar(10),SpendTime,120) as AddDate,Sum(Spend_Cent) As User_Income_Cent From CFWztg_Spend Where UserName='"&UserName&"' And  SpendType=2  Group By convert(varchar(10),SpendTime,120) Order By AddDate Desc"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
%>
<TR>
<TD class="td_r">
<%
If rs2("AddDate")=Date() Then
 Response.write "����CPS���룺"
ElseIf rs2("AddDate")=Date()-1 Then
 Response.write  "�������룺"
Else
 Response.write Right("0"&Month(rs2("AddDate")),2)&"��"&Right("0"&Day(rs2("AddDate")),2)&"��CPS���룺"
End If
%>
</TD>
<TD><%=FormatNumber(Cdbl(Rs2("User_Income_Cent")),2,-1,0,0)%>Ԫ</TD>
</TR>
<%
Rs2.MoveNext
Wend
%>

<%
Sql="Select Sum(Spend_Cent) As User_Income_Cent From CFWztg_Spend Where UserName='"&UserName&"' And  SpendType=2 and datediff(m,SpendTime,getdate())=0"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
%>
<TR>
<TD class="td_r">
����:
</TD>
<TD><%=FormatNumber(Cdbl(Rs2("User_Income_Cent")),2,-1,0,0)%>Ԫ</TD>
</TR>
<%
Rs2.MoveNext
Wend
%>


<tr class="tr_1"> 
<td colSpan=2>��������������</td>
</tr>  
<%
Sql="Select top 2 convert(varchar(10),SpendTime,120) as AddDate,Sum(Spend_Cent) As User_Income_Cent From CFWztg_Spend Where UserName='"&UserName&"' And  SpendType=1  Group By convert(varchar(10),SpendTime,120) Order By AddDate Desc"
Set Rs2=Conn.Execute(Sql)

While Not Rs2.Eof
%>
<TR>
<TD class="td_r">
<%
If rs2("AddDate")=Date() Then
 Response.write "����������ɣ�"
ElseIf rs2("AddDate")=Date()-1 Then
 Response.write  "����������ɣ�"
Else
 Response.write Right("0"&Month(rs2("AddDate")),2)&"��"&Right("0"&Day(rs2("AddDate")),2)&"��������ɣ�"
End If
%>
</TD>
<TD><%=FormatNumber(Cdbl(Rs2("User_Income_Cent")),2,-1,0,0)%>Ԫ</TD>
</TR>

<%
Rs2.MoveNext
Wend
%>


<%
Sql="Select Sum(Spend_Cent) As User_Income_Cent From CFWztg_Spend Where UserName='"&UserName&"' And  SpendType=1 and datediff(m,SpendTime,getdate())=0"
Set Rs2=Conn.Execute(Sql)

While Not Rs2.Eof
%>
<TR>
<TD class="td_r">
����:
</TD>
<TD><%=FormatNumber(Cdbl(Rs2("User_Income_Cent")),2,-1,0,0)%>Ԫ</TD>
</TR>
<%
Rs2.MoveNext
Wend
%>


<tr class="tr_1"> 
<td colSpan=2>����</td>
</tr>

<TR>
<TD class="td_r">
�ʺ��տ��ˣ�
</TD>
<TD><%=Rs("Pay_RealName")%></TD>
</TR>


<TR>
<TD class="td_r">
��һ�ε�¼ʱ�䣺
</TD>
<TD>
<%=Rs("PreviousLoginTime") %>
</TD>
</TR>

<TR>
<TD class="td_r">
��һ�ε�¼IP��
</TD>
<TD>
<%=Rs("PreviousLoginIp")%>/<%=GetIpArea(Rs("PreviousLoginIp"))%>
</TD>
</TR>

</table>



<table class="tb_1">
<tr class="tr_1"> 
<td>���˹���/<a href="?Action=sysinfolist">�鿴ȫ������</a></td>
</tr>
<%
Sql="Select Top 8 * From CFWztg_SysInfo Where Assort=1 Order By ListID Desc,ID Desc"
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


