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
AdUserName=ChkStr(Request("AdUserName"),1)

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_User where UserName='"&AdUserName&"' and UserType=2"
Rs.open Sql,Conn,1,1
If Rs.Eof Then
 Response.write "��¼������"
 Response.End
End If
%>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<form name="form4" method="post" action="../../AdminUser.aspx?Action=adusermodifysave&AdUserName=<%=AdUserName%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">

<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">�޸Ĺ������Ϣ</td>
</tr>

<tr> 
<td width="260" class="td_r">�û�����</td>
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
<td class="td_r">�ʺ�״̬��</td>
<td><select name="UserState" id="UserState">
<option value="0"<%If Rs("UserState")=0 Then response.write" selected"%>>��Ч</option>
<option value="1"<%If Rs("UserState")=1 Then response.write" selected"%>>��Ч</option>
<option value="2"<%If Rs("UserState")=2 Then response.write" selected"%>>�ʼ������</option>
<option value="3"<%If Rs("UserState")=3 Then response.write" selected"%>>����Ա�����</option>
</select></td>
</tr>
<tr> 
<td class="td_r">ע��ʱ�䣺</td>
<td><%=Rs("AddTime")%></td>
</tr>

<tr class="tr_1"> 
<td colspan="2">��������</td>
</tr> 
<tr> 
<td class="td_r">�޸���������:</td>
<td>
<%
Sql="Select * From CFWztg_User where UserType=4 And UserState=1"
Set Rs2=Conn.Execute(Sql)
If Not Rs2.Eof Then
Response.write "<select name='upusername' id='upusername'>"
Response.write "<option selected value=''>��ѡ���κ�����</option>"
While Not Rs2.Eof
 Response.write "<option value='"&Rs2("UserName")&"'"
 If Rs2("UserName")=Rs("UpUserName") Then Response.write " selected"
 Response.write ">������:"&Rs2("UserName")&",�س�:"&Rs2("UserNick")&",��ʵ����:"&Rs2("Pay_RealName")&"</option>"
Rs2.MoveNext
Wend
Response.write "</select>"
Rs2.Close
Else
 Response.write "��ʱû����Ч����ѡ��"
End If
%>
</td>
</tr>

<tr class="tr_1"> 
<td colspan="2">�޸�������ܱ�</td>
</tr>
<tr>
<td class="td_r">�޸�Ϊ�����룺</td>
<td><input name="Pwd_New" type="text" id="Pwd_New">(������ԭ���벻�ᱻ�޸�)</td>
</tr>
<tr> 
<td class="td_r">�޸�Ϊ�������һش𰸣�</td>
<td><input name="PwdAnswer_New" type="text" id="PwdAnswer_New">(������ԭ�����һش𰸲��ᱻ�޸�)</td>
</tr>
    
<tr class="tr_1"> 
<td colspan="2">�޸ķֳ�</td>
</tr>   
<tr>
<td class="td_r">CPS���붩��ʱ��վ���ֵõ����������</td>
<td><input name="UserCpsGainRate" type="text" id="UserCpsGainRate" value="<%=Rs("UserCpsGainRate")%>">%(Ĭ��ֵ100��������ߵĶ�����ɣ���ֵ��д0-100֮��)</td>
</tr>

<tr>
<td class="td_r">CPS���붩��ʱ��վ���ֵõ����������</td>
<td><input name="UserCpsGainRate_2" type="text" id="UserCpsGainRate_2" value="<%=Rs("UserCpsGainRate_2")%>">%(Ĭ��ֵ100������Լ��Ķ�����ɣ���ֵ��д0-100֮��)</td>
</tr>

<tr class="tr_1"> 
<td colspan="2">�޸Ŀ۵���</td>
</tr>   
<tr>
<td class="td_r">CPS�۵��ʣ�</td>
<td><input name="UserCpsDeDuctRate" type="text" id="UserCpsDeDuctRate" value="<%=Rs("UserCpsDeDuctRate")%>">%(Ĭ��ֵ0���۳��û��ģ���ֵ��д0-100֮�䣬0Ϊ���ۣ�100��ȫ��)</td>
</tr>

<tr>
<td class="td_r">CPS���ڶ���������Ч��</td>
<td><input name="UserCpsEffectDay" type="text" id="UserCpsEffectDay" value="<%=Rs("UserCpsEffectDay")%>">(Ĭ��ֵ������������-1��ʾ������������������Ч������������д����)</td>
</tr>
	
<tr class="tr_1"> 
<td colspan="2">�޸�����</td>
</tr>   
<tr> 
<td class="td_r">���������ȷ��ʱ�Ƿ���в�����֤��</td>
<td>
<input type="radio" name="AdAfiirmCheckOpen" value="1"<%If Rs("AdAfiirmCheckOpen")=1 Then Response.write " checked"%>>�� 
<input type="radio" name="AdAfiirmCheckOpen" value="0"<%If Rs("AdAfiirmCheckOpen")=0 Then Response.write " checked"%>>��*Ĭ��Ϊ��
</td>
</tr>
	
<tr class="tr_1"> 
<td colspan="2">�޸Ĺ���Ա��ע</td>
</tr>
<tr> 
<td class="td_r">����Ա��ע��</td>
<td><textarea name="AdminDesc" cols="60" rows="5" id="AdminDesc"><%=Rs("AdminDesc")%></textarea></td>
</tr>

<tr> 
<td></td>
<td><input type="submit" name="Submit5" value="�޸�" class="btn btn-primary"></td>
</tr>
</table>
</form>