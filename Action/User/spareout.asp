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
Set Rs = Server.CreateObject("Adodb.RecordSet")
Sql="Select * From CFWztg_User Where UserName='"&UserName&"'"
Rs.Open Sql,Conn,1,1

If Rs("BindUserName")="" Then AlertRef("�����ڰ�ȫ���İ�һ�����������ܰ��ʽ�ת�������")
%>

<script>
$(function(){
 $("#submit").click(function(){
  Spend_Cent=$('#Spend_Cent').val();
  if(Spend_Cent==""){
   alert('����д��Ҫת���Ľ��', '', function () {$("#Spend_Cent").focus();});
   return false;
  }

  if(Spend_Cent<=0){
   alert('��д��Ҫת���Ľ��������0', '', function () {$("#Spend_Cent").focus();});
   return false;
  }

  if($("#PwdAnswer").val()==""){
   alert('����д����ش��', '', function () {$("#PwdAnswer").focus();});
   return false;
  }

 })
});
</script>

<form name="form4" method="post" action="../../User.aspx?Action=spareoutsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1">
<tr class="tr_1"> 
      <td colspan="2">�ʽ�ת������� </td>
    </tr>
    <tr> 
      <td width="130" class="td_r">ʣ���</td>
      <td><%
Response.write GetTurnCent(Rs("Spare_Cent"))&"Ԫ"
%></td>
    </tr>
    <tr> 
      <td class="td_r">���ʽ�ת���������</td>
      <td><%=Rs("BindUserName")%></td>
    </tr>
    <tr> 
      <td class="td_r">��Ҫת���Ľ�</td>
      <td>
<input name="Spend_Cent" id="Spend_Cent" type="text">Ԫ<font color="#ff0000">*</font>
</td>
    </tr>
<tr class="tr_1"> 
      <td colspan="2" >��������֤ȷ�������޸�</td>
    </tr>
    <tr> 
      <td class="td_r">������ʾ���⣺</td>
      <td><%=Rs("PwdAsk")%></td>
    </tr>
    <tr> 
      <td class="td_r">����ش�𰸣�</td>
      <td>
<input type="text" name="PwdAnswer" id="PwdAnswer"><font color="#ff0000">*</font>
</td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td><input type="submit" name="submit" id="submit" value="ת��" class="btn btn-primary"></td>
    </tr>
</table>
</form>