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
ID=ChkStr(Request("ID"),2)

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_AdUser_Expend where ID="&ID
Rs.open Sql,Conn,1,1


If Rs("Plan_ID")>0 Then
 Sql="Select PlanName,PlanState From CFWztg_Plan where ID=" & Rs("Plan_ID")
 Set Rs2 = Server.CreateObject("ADODB.Recordset")
 Rs2.open Sql,Conn,1,1
 If Rs2.Eof Then
  Response.write "�˹���Ѿ�ɾ�������ܽ������"
  Response.End
 Else
  PlanName=Rs2("PlanName")
  PlanState=Rs2("PlanState")
 End If 
 Rs2.Close
End If


Set Rs2= Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_User where UserName='"&Rs("AdUserName")&"'"
Rs2.open Sql,Conn,1,1
AdUserName=Rs2("UserName")
Email=Rs2("Email")
%>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<table class="tb_1">
  <tr class="tr_1"> 
    <td colspan="2">�������</td>
  </tr>
  <form name="form4" method="post" action="../../AdminUser.aspx?Action=aduserexpendmodifysave&ID=<%=ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
    <tr> 
      <td width="120" class="td_r">����û���</td>
      <td><%=Rs("AdUserName")%></td>
    </tr>
    <tr> 
      <td class="td_r">�����룺</td>
      <td><%=GetTurnCent(Rs2("Total_Cent"))%>Ԫ</td>
    </tr>
    <tr> 
      <td class="td_r">�ѻ��ѣ�</td>
      <td><%=GetTurnCent(Rs2("Spend_Cent"))%>Ԫ</td>
    </tr>
    <tr> 
      <td class="td_r">ʣ���</td>
      <td><%=GetTurnCent(Rs2("Spare_Cent"))%>Ԫ</td>
    </tr>
    <tr> 
      <td class="td_r">�˹�滨�ѣ�</td>
      <td><%=GetTurnCent(Rs("Expend_Cent"))%>Ԫ</td>
    </tr>
    <tr>
      <td class="td_r">��;��</td>
      <td>
	  <%=Rs("ExpendDesc")%>
	  </td>
    </tr>
	

    <tr> 
      <td class="td_r">״̬��</td>
      <td><%If Rs("AdminCheck")=0 Then%> <select name="ExpendState" id="ExpendState">
          <option value="2"<%If Rs("ExpendState")=2 Then Response.Write " selected"%>>ͨ�����</option>
          <option value="3"<%If Rs("ExpendState")=3 Then Response.Write " selected"%>>�ܾ����</option>
        </select> <input name="AdminCheck" type="hidden" value="0"> <%Else%> <input name="AdminCheck" type="hidden" value="1"> 
        <%
		 If Rs("ExpendState")=2 Then
		  Response.Write"�Ѿ�ͨ������"
		 ElseIf Rs("ExpendState")=3 Then
		  Response.Write"�Ѿ��ܾ�����"
		 End If
		 %> <%End If%></td>
    </tr>
    <tr> 
      <td class="td_r">����Ա˵����</td>
      <td><textarea name="AdminDesc" cols="40" rows="5"><%=Rs("AdminDesc")%></textarea></td>
    </tr>
    <tr> 
      <td class="td_r">����ʱ�䣺</td>
      <td><input name="AdminSpendTime" type="text" id="AdminSpendTime" value="<%If Rs("AdminSpendTime")="" or isnull(Rs("AdminSpendTime")) Then
Response.write Now()
 Else
Response.write Rs("AdminSpendTime")
End If%>"></td>
    </tr>

    <tr class="tr_1"> 
      <td colspan="2">�ƻ���Ϣ</td>
    </tr>
    <tr> 
      <td class="td_r">�ƻ�ID��</td>
      <td><%=Rs("Plan_ID")%>&nbsp;&nbsp;[�ƻ�����:<%=PlanName%>]</td>
    </tr>
    <tr> 
      <td class="td_r">�ƻ����״̬��</td>
      <td><%=PlanState%></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="submit" value="�޸�" class="btn btn-primary"></td>
    </tr>
	

  </form>
  
</table>