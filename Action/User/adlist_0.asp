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
<td colspan="2">������ͣ�<font color="#FF0000"><%=GetAdClassName(Ad_Class)%></font></td>
</tr>
<%
ID=CLng(ChkStr(Request("ID"),2))

Sql="Select * From CFWztg_AgentAd Order By ID Desc"
Set Rs=Conn.Execute(Sql)

While Not Rs.Eof
%>

  <tr> 
    <td>
	<a name="tagad<%=Rs("ID")%>"></a>�������ţ�<%=Rs("ID")%>
<%
Response.write "<br><br>���������"&Rs("AdDesc")
%>
	</td>
    <td style="width:180px;"><a href='?Action=adcodeget&Ad_Class=<%=Ad_Class%>&ID=<%=Rs("ID")%>' class="btn btn-primary"><span>Ԥ������ô˹�����</span></a></td>
  </tr>
<%
Rs.MoveNext
Wend
%>
</table>