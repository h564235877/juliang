<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>
<script>
$(function(){

function NoticUser_0(){
$("#t_NoticUser").hide();
}

function NoticUser_1(){
$("#t_NoticUser").show();
}

NoticUser_0();

$("#NoticUser_0").click(function(){NoticUser_0();});
$("#NoticUser_1").click(function(){NoticUser_1();});

});

</script>
<%
CoUserName=Chkstr(Request("CoUserName"),1)
Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_User where UserName='"&CoUserName&"' and UserType=4"


Rs.open Sql,Conn,1,1
If Rs.Eof Then
 Response.write "��¼������"
 Response.End
End If
%>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<table class="tb_1">
  <tr class="tr_1"> 
    <td colspan="2">�޸�������Ϣ

    </td>
  </tr>
  <form name="form4" method="post" action="../../AdminUser.aspx?Action=cousermodifysave&CoUserName=<%=CoUserName%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
    <tr> 
      <td style="width:20%" class="td_r">��������</td>
      <td><%=Rs("UserName")%></td>
    </tr>
    <tr> 
      <td class="td_r">�����سƣ�</td>
      <td><input name="UserNick" type="text" id="UserNick" value="<%=Rs("UserNick")%>"></td>
    </tr>
    <tr> 
      <td class="td_r">��½������</td>
      <td><%=Rs("Logintotal")%></td>
    </tr>
    <tr> 
      <td class="td_r">����½ʱ�䣺</td>
      <td><%=Rs("LastLoginTime")%></td>
    </tr>
    <tr> 
      <td class="td_r">����½IP��</td>
      <td><%=Rs("LastLoginIp")%> </td>
    </tr>
    <tr> 
      <td class="td_r">Email��</td>
      <td><%=Rs("EMail")%></td>
    </tr>
    <tr> 
      <td class="td_r">QQ��</td>
      <td><input name="QQ" type="text" id="QQ" value="<%=Rs("QQ")%>"></td>
    </tr>
    <tr> 
      <td class="td_r">��ϵ�绰��</td>
      <td><%=Rs("Phone")%></td>
    </tr>
    <tr> 
      <td class="td_r">�ֻ���</td>
      <td><%=Rs("Mobile")%></td>
    </tr>  

    <tr> 
      <td class="td_r">ע��ʱ�䣺</td>
      <td><%=Rs("AddTime")%></td>
    </tr>
    
    <tr class="tr_1"> 
      <td colspan="2">�û��Ļ�ʽ����</td>
    </tr>
    <tr> 
      <td class="td_r">��ʵ������</td>
      <td><input name="Pay_RealName" type="text" id="Pay_RealName" value="<%=Rs("Pay_RealName")%>"></td>
    </tr>
    
	<%if Rs("Pay_Type")="" Then%>
    <tr> 
      <td  class="td_r"></td>
      <td>û����д��ʽ</td>
    </tr>
    <%Elseif Rs("Pay_Type")="alipay" Then%>
	<tr> 
      <td class="td_r">֧�����˺ţ�</td>
      <td><%=rs("Pay_Account")%></td>
    </tr>
    <%Elseif Rs("Pay_Type")="tenpay" Then%>
	<tr> 
      <td class="td_r">QQ�Ƹ�ͨ�˺ţ�</td>
      <td><%=rs("Pay_Account")%></td>
    </tr>
    <%Else%>
        <tr> 
      <td class="td_r">�������У�</td>
      <td>
<%
if Rs("Pay_Type")="boc" Then
Response.write "�й�����"
Elseif Rs("Pay_Type")="abc" Then
Response.write "ũҵ����"
Elseif Rs("Pay_Type")="icbc" Then
Response.write "��������"
Elseif Rs("Pay_Type")="ccb" Then
Response.write "��������"
Elseif Rs("Pay_Type")="cmb" Then
Response.write "��������"
Elseif Rs("Pay_Type")="otherbank" Then
Response.write "��������"
End If
%>      
      </td>
    </tr>
    <tr> 
      <td class="td_r">���п��ţ�</td>
      <td><%=rs("Pay_Account")%></td>
    </tr>
	
	<tr> 
      <td class="td_r">�������У�</td>
      <td><%=rs("Pay_BankAddress")%></td>
    </tr>
    <%End If%>
    <tr class="tr_1"> 
      <td colspan="2">�޸��û�״̬</td>
    </tr>
    <tr> 
      <td class="td_r">�û�״̬��</td>
      <td>
<select name="UserState" id="UserState">
<option value="0"<%If Rs("UserState")=0 Then response.write " selected"%>>��Ч</option>
<option value="1"<%If Rs("UserState")=1 Then response.write " selected"%>>��Ч</option>
<option value="2"<%If Rs("UserState")=2 Then response.write " selected"%>>�ʼ������</option>
<option value="3"<%If Rs("UserState")=3 Then response.write " selected"%>>����Ա�����</option>
</select>
		</td>
    </tr>
    
    <tr class="tr_1"> 
      <td colspan="2">�޸Ļؿ���</td>
    </tr> 
	<tr> 
      <td class="td_r">����ʣ�</td>
      <td><input name="UserTcRate" type="text" id="UserTcRate" value="<%=Rs("UserTcRate")%>">
        %(0-100֮�䣬0Ϊ���ûؿۣ�100Ϊ�ú͹������ͬ����)</td>
    </tr>

    <tr class="tr_1"> 
      <td colspan="2">�޸�������ܱ�</td>
    </tr>
    <tr> 
      <td class="td_r">�޸�Ϊ�����룺</td>
      <td><input name="Pwd_New" type="text" id="Pwd_New">
        (������ԭ���벻�ᱻ�޸�)</td>
    </tr>
    <tr> 
      <td class="td_r">�޸�Ϊ�������һش𰸣�</td>
      <td><input name="PwdAnswer_New" type="text" id="PwdAnswer_New">
        (������ԭ�����һش𰸲��ᱻ�޸�)</td>
    </tr>
    
    <tr class="tr_1"> 
      <td colspan="2">�޸Ĺ���Ա��ע</td>
    </tr>
    <tr> 
      <td class="td_r">����Ա��ע��</td>
      <td><textarea name="AdminDesc" cols="60" rows="5" id="AdminDesc"><%=Rs("AdminDesc")%></textarea></td>
    </tr>

    <tr id="a_1"> 
      <td class="td_r">�û������룺</td>
      <td><%=GetTurnCent(Rs("Total_Cent"))%>Ԫ</td>
    </tr>
    <tr id="a_2"> 
      <td class="td_r">ʣ��û�н��㣺</td>
      <td><%=GetTurnCent(Rs("Spare_Cent"))%>Ԫ</td>
    </tr>
    
    <tr class="tr_1"> 
      <td colspan="2">��Ǯ���Ǯ</td>
    </tr>
    <tr id="a_3"> 
      <td class="td_r">�ӻ�۶���Ǯ��</td>
      <td>
<input name="Deduct_Cent" type="text">
        Ԫ(������Ϊ�û���Ǯ��������Ϊ�û���Ǯ�������򲻽��пۻ��Ǯ����,����۵�Ǯ�����Ա����)</td>
    </tr>
    <tr id="a_4"> 
      <td class="td_r">����֪ͨ�û���</td>
      <td><input type="radio" name="NoticUser" id="NoticUser_1" value="1">
        �� 
        <input type="radio" name="NoticUser" id="NoticUser_0" value="0" checked>
        ��</td>
    </tr>
    <tr id="t_NoticUser"> 
      <td class="td_r">�������ݣ�</td>
      <td><textarea name="Gbook" cols="60" rows="5"></textarea></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td>
	  <input type="submit" name="submit" value="�޸�" class="btn btn-sm btn-primary">

	  </td>
    </tr>
  </form>
  

</table>