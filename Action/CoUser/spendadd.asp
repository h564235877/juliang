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
Sql="Select * From CFWztg_User Where UserName='"&CoUserName&"'"
Rs.Open Sql,Conn,1,1
If Rs("Pay_Type")="" Then Call AlertUrl("���Ļ����ϢΪ�գ������úû����Ϣ���ٽ��н���!","?Action=userpaymodify")
%>

<script>
$(function(){
 $("#submit").click(function(){
  Spend_Cent=$('#Spend_Cent').val();
  if(Spend_Cent==""){
   alert('����д��Ҫ����Ľ��', '', function () {$("#Spend_Cent").focus();});
   return false;
  }

  if(Spend_Cent < <%=RsSet("LowSpendCent")%>){
   alert('����Ľ����ͱ��벻С����ͽ����׼<%=RsSet("LowSpendCent")%>Ԫ', '', function () {$("#Spend_Cent").focus();});
   return false;
  }
  
  if(Spend_Cent > <%=Int(Cdbl(rs("Spare_Cent"))*100)/100%>){
   alert('����Ľ����벻����ʣ��Ľ��<%=Int(Cdbl(rs("Spare_Cent"))*100)/100%>Ԫ', '', function () {$("#Spend_Cent").focus();});
   return false;
  }
  
<%If RsSet("SpendCentBS")=0 Then'�ж���д������С����%>
  if(!/^\d{1,10}(\.\d{1,2})?$/.test(Spend_Cent)){
   alert('��������������ֻ����д��С����2λ', '', function () {$("#Spend_Cent").focus();});
   return false;
  }
<%Else'�ж��Ƿ�Ϊ����%>
  if(Spend_Cent%<%=RsSet("SpendCentBS")%>!=0){
   alert('����Ľ�����Ϊ<%=RsSet("SpendCentBS")%>��������', '', function () {$("#Spend_Cent").focus();});
   return false;
  }
<%End If%>
 })
});
</script>

<a href="?Action=spendlist" class="actionBtn" style="margin-top:10px;"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<form name="form4" method="post" action="../../CoUser.aspx?Action=spendsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1"><tr class="tr_1"> 
<td colspan="2">������� </td>
</tr>
<tr> 
<td width="120" class="td_r">ʣ���</td>
<td><%
Response.write Int(Cdbl(rs("Spare_Cent"))*100)/100&"Ԫ"
%></td>
</tr>
<tr> 
<td class="td_r">��Ҫ����Ľ�</td>
<td>
<input name="Spend_Cent" type="text" id="Spend_Cent">Ԫ
<%
Response.write "(ÿ����������" & GetTurnCent(RsSet("LowSpendCent")) & "Ԫ"
If RsSet("SpendCentBS")>0 Then Response.write ",�ҽ��������Ϊ"&RsSet("SpendCentBS")&"Ԫ�ı���"
Response.write ")"
%>
</td>
</tr>
<tr> 
<td class="td_r">����˵����</td>
<td><input name="SpendDesc" type="text" id="SpendDesc">(û��������)</td>
</tr>
<tr> 
<td>&nbsp;</td>
<td><input type="submit" name="submit" id="submit" value="����" class="btn btn-primary"></td>
</tr>
<tr class="tr_1"> 
<td colspan="2">���Ļ�ʽ����</td>
</tr>
<tr id="t_2"> 
<td class="td_r">��ʵ������</td>
<td><%=Rs("Pay_RealName")%></td>
</tr>
	
<tr> 
<td class="td_r">�տʽ</td>
<td align="left">
<%
If Rs("pay_type")="alipay" Then
 Response.write "֧����"
ElseIf Rs("pay_type")="tenpay" Then
 Response.write "�Ƹ�ͨ"
ElseIf Rs("pay_type")="boc" Then
 Response.write "�й�����"
ElseIf Rs("pay_type")="abc" Then
 Response.write "ũҵ����"
ElseIf Rs("pay_type")="icbc" Then
 Response.write "��������"
ElseIf Rs("pay_type")="ccb" Then
 Response.write "��������"
ElseIf Rs("pay_type")="cmb" Then
 Response.write "��������"
ElseIf Rs("pay_type")="otherbank" Then
 Response.write "��������"
End If
%>
</td>
</tr>

<tr> 
<td class="td_r">�ʺţ�</td>
<td><%=Rs("pay_account")%></td>
</tr>

<%If Not(Rs("pay_type")="alipay" Or Rs("pay_type")="alipay") Then%>
<tr> 
<td class="td_r">�������У�</td>
<td><%=Rs("pay_bankaddress")%></td>
</tr>
<%End If%>

<tr>
<td colspan="2">��ȷ�����Ļ�ʽ��ȷ���������ȷ��<a href="?Action=userpaymodify">�����޸�</a><br>
����Ա������˽���ʱ��������õĻ�ʽΪ׼</td>
</tr>
</table>
</form>