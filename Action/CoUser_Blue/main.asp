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
Sql="Select * From CFWztg_User Where UserName='"&CoUserName&"'"
Set Rs=Conn.Execute(Sql)
UserID=Rs("ID")
UserTcRate=Rs("UserTcRate")
%>

<script src="../../js/clipboard.min.js"></script>

<table class="tb_1">
<tr class="tr_1"> 
<td>�ƹ���������</td>
</tr>
<tr> 
<td>
<INPUT id=lowusercode value=<%=AdPath_2%>?c=<%=UserID%> size=60>

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
Response.write "������¹��������������:"&UserTcRate&"%"
%>����<%=RsSet("LowSpendCent")%>Ԫ���㡣
</div>
</td>
</tr>

</table>

<table class="tb_1">
<tr class="tr_1"> 
<td colSpan=2>�˻���Ϣ</td>
</tr>

<TR>
<TD class="td_r" width="180">δ����</TD>
<TD><%=FormatNumber(Rs("Spare_Cent"),2,-1,0,0)%>Ԫ</TD>
</TR>

<tr>
<td class="td_r">δ��˽��������</td>
<td>
<%
Sql = "Select Count(1) From CFWztg_Spend Where UserName='"&CoUserName&"' And SpendType=0 And SpendState=1"
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
Sql="Select Count(1) From CFWztg_Gbook where UserName='"&CoUserName&"' And IsRead_Admin=1 And IsRead_User=0"
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
Sql="Select Count(1) From CFWztg_Gbook where UserName='"&CoUserName&"' And IsRead_Admin=0"
Set Rs2=Conn.Execute(Sql)
Response.write "<a href='?Action=gbooklist'>"&Rs2(0)&"��</a>"
Rs2.Close
%>
</td>
</tr>

<tr class="tr_1"> 
<td colSpan=2>����</td>
</tr>

<TR>
<TD class="td_r">
�ʺ��տ��ˣ�
</TD>
<TD><%=Rs("Pay_RealName")%></TD>
</TR>

<%
Sql="Select UserName From CFWztg_User Where BindUserName='"&CoUserName&"' And UserType=3"
Set Rs2=Conn.Execute(Sql)
If Not Rs2.Eof Then
%>
<TR>
<TD class="td_r">
�����ͷ��˺ţ�
</TD>
<TD><%=Rs("UserName")%> (�������ÿͷ���������ƹ����Ӷ����Լ�¼����ͬ�˺�����,�ڿͷ���̨��ȡ����������)</TD>
</TR>
<%
Rs2.Close
End If%>

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
<%Rs.Close%>


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


