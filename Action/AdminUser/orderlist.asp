<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<form name="form_orderlist" id="form_orderlist" method="post" action="../../AdminUser.aspx?Action=orderseldel">
<table class="tb_1">

<tr class="tr_1">
    <td><input name="chkall" type="checkbox" id="chkall" onclick="selectcheckbox(this.form)" value="check"></td>
    <td>�����</td>
    <td>������</td>
    <td>������</td>
    <td>���</td>
	<td>��ɱ���</td>
    <td>��ɽ��</td>
	<td>��ɶ���</td>
    <td>����״̬</td>
    <td>��վ��</td>
    <td>�ѽ���ID</td>
	<td>�����������û�</td>
	<td>����</td>
  </tr>
<%
AdUserName=ChkStr(Request("AdUserName"),1)
OrderCode=ChkStr(Trim(Request("OrderCode")),1)
OrderUser=ChkStr(Trim(Request("OrderUser")),1)
UserName=ChkStr(Trim(Request("UserName")),1)
LowUnionUserName=ChkStr(Trim(Request("LowUnionUserName")),1)
OrderState=ChkStr(Request("OrderState"),2)
AddTime=ChkStr(Trim(Request("AddTime")),3)

If Request("SlefPageSize")="" Then SlefPageSize=20 Else SlefPageSize=CLng(ChkStr(Request("SlefPageSize"),2))


PageUrl = "?Action="&Action&"&AdUserName="&AdUserName&"&OrderCode="&OrderCode&"&OrderUser="&OrderUser&"&UserName="&UserName&"&LowUnionUserName="&LowUnionUserName&"&OrderState="&OrderState&"&AddTime="&AddTime&"&SlefPageSize="&SlefPageSize

MaxListRs = 2000


Sql="Select Top "&MaxListRs&" * From CFWztg_AdUser_Order Where 1=1"

 If AdUserName<>"" Then Sql=Sql&" And AdUserName='"&AdUserName&"'"
 If OrderCode<>"" Then Sql=Sql&" And OrderCode='"&OrderCode&"'"
 If OrderUser<>"" Then Sql=Sql&" And OrderUser='"&OrderUser&"'"
 If UserName<>"" Then Sql=Sql&" And UserName='"&UserName&"'"
 If LowUnionUserName<>"" Then Sql=Sql&" And LowUnionUserName='"&LowUnionUserName&"'"
 If OrderState<>"" Then Sql=Sql&" And OrderState="&OrderState
 If AddTime<>"" Then Sql=Sql&" And DateDiff(d,'"&AddTime&"',AddTime)=0"


Sql=Sql&"  Order By ID Desc"



Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.PageSize = SlefPageSize
 TotalRs = Rs.RecordCount
 TotalPage = Rs.PageCount
 MyPageSize = Rs.PageSize
 FixedSize=Rs.PageSize
 Rs.AbsolutePage = Page
End If

If TotalRs = MaxListRs Then Response.write "��¼̫�ֻ࣬������"&MaxListRs&"��"

While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2"> 
      <td> 
<%
 Response.write "<input name='ID_Sel' type='checkbox' id='ID_Sel' value='"&rs("ID")&"'>"
%>
        </td>
    <td><%=Rs("AdUserName")%></td>
    <td><%=server.HTMLEncode(Rs("OrderCode"))%></td>
    <td><%=server.HTMLEncode(Rs("OrderUser"))%></td>
    <td><%=GetTurnCent(Rs("OrderCent"))%>Ԫ</td>
	<td><%=Rs("OrderTcRate")%>%</td>
	<td><%=GetTurnCent(CDbl(Rs("OrderCent"))*Rs("OrderTcRate")/100)%>Ԫ</td>
    <td><%
	If Rs("tcobject")=1 Then
	 Response.write "�Ƽ���"
	Else
	 Response.write "������"
	End If
	%></td>
    <td> 
<%
If Rs("OrderState")=1 Then
 Response.write "��ʱ���"
ElseIf Rs("OrderState")=2 Then
 Response.write "�ȴ�ȷ��"
ElseIf Rs("OrderState")=3 Then
 Response.write "ȷ�ϳɹ�"
ElseIf Rs("OrderState")=4 Then
 Response.write "ȷ��ʧ��"
ElseIf Rs("OrderState")=5 Then'--�����û��ĵ�,��ʱ��ɳɹ�
 Response.write "�����û��ĵ�,��ʱ��ɳɹ�"
ElseIf Rs("OrderState")=6 Then'--�����û��ĵ㣬�ȴ�ȷ��
 Response.write "�����û��ĵ㣬�ȴ�ȷ��"
ElseIf Rs("OrderState")=7 Then'--�����û��ĵ㣬ȷ�ϳɹ�
 Response.write "�����û��ĵ㣬ȷ�ϳɹ�"
End If
%>    </td>
    <td>  
        <%
	If Rs("UserName")<>"" Then
	 Response.write server.HTMLEncode(Rs("UserName"))
	Else
	 Response.write "ȱ"
	End If
	%>    </td>
    <td> 
        <%
	If Rs("SpendID")<>0 Then
	 Response.write Rs("SpendID")
	Else
	 Response.write "ȱ"
	End If
	%>    </td>
    <td><%=Rs("LowUnionUserName")%></td>

<td>
<%
Response.write "<a href=""javascript:;"" onclick=""$(function () { confirm('ÿ�������������õ�,�����ȷ����������ǲ����õ����ݿ���ɾ����ȷ��Ҫɾ�����������?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=orderdel&ID="& Rs("ID") &"')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});"" class=""btn_del""><i class=""mdi mdi-window-close""></i> ɾ��</a>"
%>
</td>
  </tr>

<tr>
<td colspan="14" style="border-color: #826666">
��Ʒ����:<%=Rs("GoodsName")%>
|��Ʒ����:<%If Rs("GoodsTotal") > 0 Then Response.write Rs("GoodsTotal")%>
|����:<%=Rs("GoodsTime")%>
|����:<%=Rs("AddTime")%>
|ȷ��:<%=Rs("AffirmTime")%>

<br />

�������:<%=Rs("ExName")%> 
|��ݵ���:<%=Rs("ExCode")%>
|���״̬:<%=Rs("ExState")%>
|��ݽ���:<%=Rs("ExContent")%>

<br />
����:<%=Rs("OrderDesc")%> 
</td>
</tr>

  <%
MyPageSize = MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>



</table>
</form>
<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ��ѡ��ļ�¼��?', '', function (isConfirm) {if (isConfirm) {$('#form_orderlist').submit();}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-window-close"></i>ɾ��ѡ��</a>


<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>

<script>
$(function(){

$("#search").click(function(){

 if(isNaN($('#SlefPageSize').val())){
  alert('ÿҳ��ʾ����������', '', function () {$("#SlefPageSize").focus();});
  return false
 }

 var searchurl ="?Action=<%=Action%>";
 searchurl += '&AdUserName=' + $('#AdUserName').val();
 searchurl += '&OrderCode=' + $('#OrderCode').val();
 searchurl += '&OrderUser=' + $('#OrderUser').val();
 searchurl += '&UserName=' + $('#UserName').val();
 searchurl += '&OrderState=' + $('#OrderState').val();
 searchurl += '&AddTime=' + $('#AddTime').val();
 searchurl += '&SlefPageSize=' + $('#SlefPageSize').val();

 location.href=searchurl;
});

});
</script>

<table class="tb_3"><tr class="tr_1"> 
      <td colspan="2">��ѯ</td>
    <tr>
      <td class="td_r">�������</td>
      <td><select name="AdUserName" id='AdUserName'>
<option value="">ȫ�������</option>
            <%
Sql="Select AdUserName From CFWztg_AdUser_Order Group By AdUserName Order By AdUserName"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("AdUserName")&"'"
 If Request("AdUserName")=Cstr(Rs("AdUserName")) Then Response.Write " selected"
 Response.Write ">"&Rs("AdUserName")&"</option>"
Rs.MoveNext
Wend
%>
        </select></td>
    </tr>
    <tr>
      <td class="td_r">�����ţ�</td>
      <td><input name="OrderCode" type="text" id="OrderCode" value="<%=OrderCode%>" size="20"></td></tr>
    <tr>
      <td class="td_r">�����ˣ�</td>
      <td><input name="OrderUser" type="text" id="OrderUser" value="<%=OrderUser%>" size="20"></td></tr>
    <tr>
    <tr>
      <td class="td_r">�������Ƽ��ˣ�</td>
      <td><input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="20"></td></tr>
    <tr>
    <tr>
      <td class="td_r">�¼��������û���</td>
      <td><input name="LowUnionUserName" type="text" id="LowUnionUserName" value="<%=LowUnionUserName%>" size="20"></td></tr>
    <tr>
      <td class="td_r">ѡ��״̬��</td>
      <td><select name="OrderState" id="OrderState">
        <option value=""<%If CStr(OrderState)="" Then Response.write " selected"%>>ȫ������</option>
		<option value="1"<%If CStr(OrderState)="1" Then Response.write " selected"%>>��ʱȷ�ϵĶ���</option>
        <option value="2"<%If CStr(OrderState)="2" Then Response.write " selected"%>>�ȴ�ȷ�ϵĶ���</option>
        <option value="3"<%If CStr(OrderState)="3" Then Response.write " selected"%>>ȷ�ϳɹ��Ķ���</option>
        <option value="4"<%If CStr(OrderState)="4" Then Response.write " selected"%>>ȷ��ʧ�ܵĶ���</option>
		<option value="5"<%If CStr(OrderState)="5" Then Response.write " selected"%>>�ѱ��۵�Ķ���</option>
      </select></td></tr>
    <tr>
      <td class="td_r">����ʱ�䣺</td>
      <td><input name="AddTime" type="text" id="AddTime" value="<%=AddTime%>" size="20">(��ʽ�磺1970-1-1)</td></tr>
    <tr>
      <td class="td_r">ÿҳ��ʾ��</td>
      <td><input name="SlefPageSize" type="text" id="SlefPageSize" value="<%=SlefPageSize%>" size="10" />
      ��</td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="submit" value="��ѯ" class="btn btn-sm btn-primary" id="search"></td></tr>
</table>
