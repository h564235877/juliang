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
%>
  
<form name="form2" method="post" action="../../AdUser.aspx?Action=ordermoremodifysave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1"><tr class="tr_1"> 
<td colspan="2">�ֹ�����ȷ��CPS����</td>
</tr>
<tr> 
<td width="80" class="td_r">������Ϣ��</td>
<td><textarea name="OrderInfo" cols="40" rows="10"><%=OrderInfo%></textarea>
<br />
ע��ÿ��һ����Ϣ��ÿ�и�ʽ��������</td>
</tr>
<tr> 
<td></td>
<td>
<input type="submit" name="submit" value="ȷ��" onclick="return confirm('ȷ��Ҫȷ����Щ����Ϊ�ɹ�״̬��?')" class="btn btn-primary">      </td>
</tr>
</table>
</form>