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
Plan_ID=ChkStr(Request("Plan_ID"),2)

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select AdUserName,PlanName,TotalClick_Cent,OverClick_Cent,SpareClick_Cent From CFWztg_Plan where ID="&Plan_ID
Rs.open Sql,Conn,1,1
PlanName=Rs("PlanName")
AdUserName=Rs("AdUserName")
TotalClick_Cent=CDBL(Rs("TotalClick_Cent"))
OverClick_Cent=CDBL(Rs("OverClick_Cent"))
SpareClick_Cent=CDBL(Rs("SpareClick_Cent"))
Rs.Close

Sql = "Select Spare_Cent From CFWztg_User Where UserName='" & AdUserName & "'"
Set Rs = Conn.Execute(Sql)
Spare_Cent = CDbl(Rs("Spare_Cent"))
Rs.Close
%>  

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

  <form name="form1" method="post" action="../../AdminUser.aspx?Action=planchasesave&Plan_ID=<%=Plan_ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1">
  <tr class="tr_1"> 
    <td colspan="2">׷�ӻ����Ͷ�Ž��</td>
  </tr>
  <tr> 
      <td width="180" class="td_r">�ƻ���ţ�</td>
      <td><%=Plan_ID%></td>
    </tr>
  <tr> 
      <td class="td_r">�ƻ����ƣ�</td>
      <td><%=PlanName%></td>
    </tr>
  <tr> 
      <td class="td_r">�����������</td>
      <td><%=AdUserName%></td>
    </tr>
    <TR>
      <TD class="td_r">�ƻ�Ͷ���ܶ</TD>
      <TD><%=GetTurnCent(TotalClick_Cent)%>Ԫ</TD>
    </TR>
    <TR>
      <TD class="td_r">�ƻ������ѽ�</TD>
      <TD><%=GetTurnCent(OverClick_Cent)%>Ԫ</TD>
    </TR>
    <TR>
      <TD class="td_r">�ƻ�ʣ���</TD>
      <TD><%=GetTurnCent(SpareClick_Cent)%>Ԫ</TD>
    </TR>
    <TR> 
      <TD class="td_r">�ƻ�׷�ӻ����Ͷ�Ž�</TD>
      <TD><input name="ChaseClick_Cent" type="text" size="10">Ԫ<%
Response.write "(�˹����"&AdUserName&"�˻����:"&Int(Spare_Cent*100/100)&"Ԫ����д����Ϊ׷�ӣ���д����Ϊ����)"
%></TD>
    </TR>
    <tr> 
	<TD></TD>
      <td>
          <input type="submit" name="submit" value="ȷ��" class="btn btn-primary">

      </td>
    </tr>
</table></form>