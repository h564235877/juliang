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
OrderInfo=ChkStr(Request("OrderInfo"),1)
OrderTcRate=ChkStr(Request("OrderTcRate"),2)
TcObject=ChkStr(Request("TcObject"),2)
TcType=ChkStr(Request("TcType"),2)
%>
  
<form name="form2" method="post" action="../../AdUser.aspx?Action=ordermoreaddsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1">
<tr class="tr_1"> 
      <td colspan="2">�ֹ���������CPS����</td>
    </tr>
	
    <tr> 
      <td width="200" class="td_r">ѡ���뵽�ĸ�CPS��棺</td>
      <td>
<select name="Ad_ID" id="Ad_ID">
<option selected value="">��ѡ��һ��CPS���</option>
<%
Sql="Select a.id,a.adname From CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where a.AdUserName='"&AdUserName&"' And a.ClickState=4 And a.AdState=2 And b.PlanState=2 Order By a.ID Desc"
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
While Not Rs2.Eof
%>
<option value="<%=Rs2("ID")%>"><%=Rs2("adname")%>[<%=Rs2("ID")%>]</option>
<%
Rs2.MoveNext
Wend
Rs2.Close
%>
</select>

</td>
    </tr>
    <tr> 
      <td class="td_r">������Ϣ��</td>
      <td><textarea name="OrderInfo" cols="40" rows="10"><%=OrderInfo%></textarea>
      <br />
      ע��ÿ��һ����Ϣ��ÿ�и�ʽ��������|�����û���|�����û�������|�������|��Ʒ����(������)|��Ʒ����ʱ��(������)|��Ʒ��������(������)</td>
    </tr>
	<tr> 
      <td class="td_r">ʵ����ɱ�����</td>
      <td><input name="OrderTcRate" type="text" size="5" value="<%=OrderTcRate%>">
        %(��������գ����յĻ���ɱ���ΪϵͳĬ�ϵ�<%=RsSet("UserOrderTcRate")%>%)</td>
    </tr>
    <tr> 
      <td class="td_r">������ɶ���</td>
      <td><input type="radio" name="TcObject" value="1"<%If TcObject="1" Then Response.write " checked"%>>�����˵��Ƽ���
        <input type="radio" name="TcObject" value="2"<%If TcObject="2" Then Response.write " checked"%>>�������Լ�</td>
    </tr>

	<tr> 
      <td class="td_r">��ɷ�ʽ��</td>
      <td><input type="radio" name="TcType" value="1"<%If TcType="1" Then Response.write " checked"%>>��ʱ���
        <input type="radio" name="TcType" value="2"<%If TcType="2" Then Response.write " checked"%>>�ȴ�ȷ��</td>
    </tr>
	<tr> 
      <td></td>
	  <td>
          <input type="submit" name="submit" value="����" onclick="return confirm('ȷ��Ҫȷ����Щ������?')" class="btn btn-primary">      </td>
    </tr>
</table>
</form>