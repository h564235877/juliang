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

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">�޸���վ����Ϣ
<%
UserName=Chkstr(Request("UserName"),1)
Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_User where UserName='"&UserName&"' and UserType=1"
Rs.open Sql,Conn,1,1
If Rs.Eof Then
 Response.write "��¼������"
 Response.End
End If
%>
</td>
</tr>
<form name="form4" method="post" action="../../AdminUser.aspx?Action=usermodifysave&UserName=<%=UserName%>&UserState_Old=<%=Rs("UserState")%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<tr> 
<td style="width:20%" class="td_r">��վ����</td>
<td><%=Rs("UserName")%></td>
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
<td><%=Rs("LastLoginIp")%></td>
</tr>
<tr> 
<td class="td_r">Email��</td>
<td><%=Rs("EMail")%></td>
</tr>
<tr> 
<td class="td_r">QQ��</td>
<td><%=Rs("QQ")%></td>
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
<td class="td_r">��վ��ַ��</td>
<td><%If Rs("WebSite")<>"" Then Response.write "<a href="&Rs("WebSite")&" target=_blank>"&Rs("WebSite")&"</a>"%></td>
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
<tr> 
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
%></td>
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
<td colspan="2">�����ͷ�</td>
</tr>

<tr> 
<td class="td_r">�޸Ŀͷ�����:</td>

<td>
<%
Sql="Select * From CFWztg_User where UserType=3 And UserState=1"
Set Rs2=Conn.Execute(Sql)
If Not Rs2.Eof Then
Response.write "<select name='upusername' id='upusername'>"
Response.write "<option selected value=''>��ѡ���κοͷ�</option>"
While Not Rs2.Eof
 Response.write "<option value='"&Rs2("UserName")&"'"
 If Rs2("UserName")=Rs("UpUserName") Then Response.write " selected"
 Response.write ">�ͷ���:"&Rs2("UserName")&",�س�:"&Rs2("UserNick")&",��ʵ����:"&Rs2("Pay_RealName")&"</option>"
Rs2.MoveNext
Wend
Response.write "</select>"
Rs2.Close
Else
 Response.write "��ʱû����Ч�ͷ�ѡ��"
End If
%></td>
    </tr>

    
<tr class="tr_1"> 
<td colspan="2">�޸�������Ϣ</td>
</tr>
<tr> 
<td class="td_r">�û��ȼ���</td>
<td><select name="UserLevel" id="UserLevel">
<option value="1"<%If Rs("UserLevel")=1 Then response.write " selected"%>>�ȼ�1</option>
<option value="2"<%If Rs("UserLevel")=2 Then response.write " selected"%>>�ȼ�2</option>
<option value="3"<%If Rs("UserLevel")=3 Then response.write " selected"%>>�ȼ�3</option>
<option value="4"<%If Rs("UserLevel")=4 Then response.write " selected"%>>�ȼ�4</option>
<option value="5"<%If Rs("UserLevel")=5 Then response.write " selected"%>>�ȼ�5</option>
<option value="6"<%If Rs("UserLevel")=6 Then response.write " selected"%>>�ȼ�6</option>
</select>(Ĭ����1�������ڹ���еȼ�Խ�ߵļ۸�Խ��)</td>
<tr> 
<td class="td_r">�û����飺</td>
<td><select name="UserTeam" id="UserTeam">
<option value="0"<%If Rs("UserTeam")=0 Then response.write " selected"%>>����0</option>
<option value="1"<%If Rs("UserTeam")=1 Then response.write " selected"%>>����1</option>
<option value="2"<%If Rs("UserTeam")=2 Then response.write " selected"%>>����2</option>
<option value="3"<%If Rs("UserTeam")=3 Then response.write " selected"%>>����3</option>
<option value="4"<%If Rs("UserTeam")=4 Then response.write " selected"%>>����4</option>
</select>(Ĭ����1���ڹ��Ͷ��λ�ú�Ͷ�����صĹ�������й�)</td>
</tr>
<tr>
<td class="td_r">�û�״̬��</td>
<td>
<select name="UserState" id="UserState">
<option value="0"<%If Rs("UserState")=0 Then response.write " selected"%>>��Ч</option>
<option value="1"<%If Rs("UserState")=1 Then response.write " selected"%>>��Ч</option>
<option value="2"<%If Rs("UserState")=2 Then response.write " selected"%>>�ʼ������</option>
<option value="3"<%If Rs("UserState")=3 Then response.write " selected"%>>����Ա�����</option>
</select></td>
</tr>
<td class="td_r">����Ȩ�ޣ�</td>
<td><select name="AgentPower" id="AgentPower">
<option value="1"<%If Rs("AgentPower")=1 Then response.write " selected"%>>�ȴ����</option>
<option value="2"<%If Rs("AgentPower")=2 Then response.write " selected"%>>��˳ɹ�</option>
<option value="3"<%If Rs("AgentPower")=3 Then response.write " selected"%>>���ʧ��</option>		  
</select></td>
</tr>

<tr class="tr_1"> 
<td colspan="2">�޸Ŀ۵���</td>
</tr>   
<tr> 
<td class="td_r">CPC�۵���ʣ�</td>
<td><input name="CpcDeDuct_Rate" type="text" id="CpcDeDuct_Rate" value="<%=Rs("CpcDeDuct_Rate")%>">
%(0-100֮�䣬0Ϊ���۵㣬100Ϊ�۳�ȫ������) <br>
ע������۵ĵ�����Ա���ã�������û��۵���Ϊ20%����������Ժ����վ��ÿ����Ļ���20%�������Ա���á�</td>
</tr>
<tr> 
<td class="td_r">CPV�۵���ʣ�</td>
<td><input name="CpmDeDuct_Rate" type="text" id="CpmDeDuct_Rate" value="<%=Rs("CpmDeDuct_Rate")%>">
%(0-100֮�䣬0Ϊ���۵㣬100Ϊ�۳�ȫ������)</td>
</tr>
<tr> 
<td class="td_r">CPA�۵���ʣ�</td>
<td><input name="CpaDeDuct_Rate" type="text" id="CpaDeDuct_Rate" value="<%=Rs("CpaDeDuct_Rate")%>">
%(0-100֮�䣬0Ϊ���۵㣬100Ϊ�۳�ȫ������)</td>
</tr>
<tr> 
<td class="td_r">CPS�۵���ʣ�</td>
<td><input name="CpsDeDuct_Rate" type="text" id="CpsDeDuct_Rate" value="<%=Rs("CpsDeDuct_Rate")%>">
%(0-100֮�䣬CPS�۵��ǰ������������۳�)��</td>
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
<td><textarea name="AdminDesc" cols="30" rows="5" id="AdminDesc"><%=Rs("AdminDesc")%></textarea></td>
</tr>


<tr class="tr_1"> 
<td colspan="2">��Ǯ���Ǯ</td>
</tr>    
<tr id="a_1"> 
<td class="td_r">�û������룺</td>
<td><%=GetTurnCent(Rs("Total_Cent"))%>Ԫ</td>
</tr>
<tr id="a_2"> 
<td class="td_r">ʣ��û�н��㣺</td>
<td><%=GetTurnCent(Rs("Spare_Cent"))%>Ԫ</td>
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
<td><textarea name="Gbook" cols="30" rows="5"></textarea></td>
</tr>
<tr class="tr_1"> 
<td colspan="2">ת���û����</td>
</tr>    
<tr id="a_1"> 
<td class="td_r">�û����ͣ�</td>
<td>
<input type="radio" name="UserType" value="1"<%If Rs("UserType")=1 Then Response.write " checked"%>>��վ��
<%If UserName<>"mytest" Then%>
<input type="radio" name="UserType" value="2"<%If Rs("UserType")=2 Then Response.write " checked"%>>�����
<input type="radio" name="UserType" value="3"<%If Rs("UserType")=3 Then Response.write " checked"%>>�ͷ�
<input type="radio" name="UserType" value="4"<%If Rs("UserType")=4 Then Response.write " checked"%>>����
<%End If%>
��ע:�����޸ģ��޸��û�����ԭ��ݺ�̨�͹��ܲ�����ʹ�ã�ʹ������ݺ�̨�͹��ܣ��Ҳ��ָܻ�ԭ��ݣ�
</td>
</tr>
<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="submit" value="�޸�" class="btn btn-primary">

</td>
</tr>
</form>


</table>