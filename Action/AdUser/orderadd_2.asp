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
Ad_ID=ChkStr(Trim(Request("Ad_ID")),2)
OrderCode=ChkStr(Trim(Request("OrderCode")),1)
OrderUser=ChkStr(Trim(Request("OrderUser")),1)
OrderUserType=ChkStr(Trim(Request("OrderUserType")),2)
OrderCent=ChkStr(Trim(Request("OrderCent")),2)
OrderTcRate=ChkStr(Trim(Request("OrderTcRate")),2)
TcObject=CInt(ChkStr(Trim(Request("TcObject")),2))
TcType=CInt(ChkStr(Trim(Request("TcType")),2))

GoodsName=server.HTMLEncode(ChkStr(Request("GoodsName"),1))
GoodsTime=ChkStr(Request("GoodsTime"),3)
GoodsTotal=ChkStr(Request("GoodsTotal"),2)


Sql="Select * From CFWztg_User Where UserName='"&AdUserName&"'"
Set Rs=Conn.execute(Sql)

CheckCode = Md5(Ad_ID&OrderCode&OrderUser&OrderUserType&OrderCent&OrderTcRate&TcObject&TcType&Rs("RecSafeCode"),2)
%>


<form name="form2" method="post" action="../../CF.aspx?Action=orderadd" target="_blank">
<table class="tb_1">
<tr class="tr_1"> 
      <td colspan="2">��������</td>
    </tr>
    <tr> 
      <td width="180" class="td_r">���뵽�ĸ���棺</td>
      <td><input name="Ad_ID" type="hidden" value="<%=Ad_ID%>"> <%=Ad_ID%></td>
    </tr>
    <tr> 
      <td class="td_r">�����ţ�</td>
      <td><input name="OrderCode" type="hidden" value="<%=OrderCode%>"> <%=OrderCode%></td>
    </tr>
    <tr> 
      <td class="td_r">�����û�����</td>
      <td><input type="hidden" name="OrderUser" value="<%=OrderUser%>"> <%=OrderUser%> 
      </td>
    </tr>
    <tr> 
      <td class="td_r">�����û������ͣ�</td>
      <td><input type="hidden" name="OrderUserType" value="<%=OrderUserType%>"><%
	If OrderUserType = 1 Then
	 Response.write "Ӣ��ID"
	ElseIf OrderUserType = 2 Then
	 Response.write "����ID"
	End If
	%>
      </td>
    </tr>
	<tr> 
      <td class="td_r">������</td>
      <td><input type="hidden" name="OrderCent" value="<%=OrderCent%>"> <%=OrderCent%>Ԫ 
      </td>
    </tr>
    <tr> 
      <td class="td_r">ʵ����ɱ�����</td>
      <td><input type="hidden" name="OrderTcRate" value="<%=OrderTcRate%>"> <%=OrderTcRate%> 
        <%
		If OrderTcRate="" Then
        Response.write RsSet("UserOrderTcRate")		
		OrderTcRate=RsSet("UserOrderTcRate")
	  End If%>
        %</td>
    </tr>
    <tr> 
      <td class="td_r">������ɶ���</td>
      <td><input type="hidden" name="TcObject" value="<%=TcObject%>">
	  <%
	If TcObject = 1 Then
	 Response.write "�����˵��Ƽ���"
	Else
	 Response.write "�������Լ�"
	End If
	%></td>
    </tr>
    <tr> 
      <td class="td_r">��ɷ�ʽ��</td>
      <td><input type="hidden" name="TcType" value="<%=TcType%>">
	  <%
	If TcType = 1 Then
	 Response.write "��ʱ���"
	ElseIf TcType = 2 Then
	 Response.write "�ȴ�ȷ��"
	End If
	%></td>
    </tr>

	
	<tr>
	  <td class="td_r">��Ʒ���ƣ�</td>
	  <td><input type="hidden" name="GoodsName" value="<%=GoodsName%>"><%=GoodsName%></td>
    </tr>
	<tr>
	  <td class="td_r">��Ʒ����ʱ�䣺</td>
	  <td><input type="hidden" name="GoodsTime" value="<%=GoodsTime%>"><%=GoodsTime%></td>
    </tr>
	<tr>
	  <td class="td_r">��Ʒ��������</td>
	  <td><input type="hidden" name="GoodsTotal" value="<%=GoodsTotal%>"><%=GoodsTotal%></td>
    </tr>
	
	<tr> 
      <td class="td_r">��ɶ��󽫻�����</td>
      <td><%=OrderCent*CInt(OrderTcRate)/100%>Ԫ </td>
    </tr>
	
	
    <tr> 
      <td></td>
	  <td>
          <input name="AdUserName" type="hidden" value="<%=AdUserName%>">
          <input name="CheckCode" type="hidden" value="<%=CheckCode%>">
          <input type="submit" name="submit" value="ȷ������" class="btn btn-primary"></td>
    </tr>
</table>
</form>