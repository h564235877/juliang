<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>


<form name="form_orderlist" method="post" action="../../AdUser.aspx?Action=orderdo">

<table class="tb_1">
<tr class="tr_1"> 
    <td><input name="chkall" type="checkbox" id="chkall" onclick="selectcheckbox(this.form)" value="check"></td>
    <td>���ID</td>
    <td>������</td>
    <td>������</td>
    <td>���</td>
    <td>��ɱ���</td>
	<td>��ɽ��</td>
	<td>��ɶ���</td>
    <td>����״̬</td>
    <td>��վ��</td>
	<td>�����������û�</td>
	<td>�١���</td>
  </tr>
<%
OrderCode=ChkStr(Trim(Request("OrderCode")),1)
OrderUser=ChkStr(Trim(Request("OrderUser")),1)
UserName=ChkStr(Trim(Request("UserName")),1)
LowUnionUserName=ChkStr(Trim(Request("LowUnionUserName")),1)
OrderState=ChkStr(Request("OrderState"),2)
AddTime=ChkStr(Trim(Request("AddTime")),3)

If Request("SlefPageSize")="" Then SlefPageSize=20 Else SlefPageSize=CLng(ChkStr(Request("SlefPageSize"),2))

PageUrl = "?Action="&Action&"&OrderCode="&OrderCode&"&OrderUser="&OrderUser&"&UserName="&UserName&"&LowUnionUserName="&LowUnionUserName&"&OrderState="&OrderState&"&AddTime="&AddTime&"&SlefPageSize="&SlefPageSize

MaxListRs = 2000

Sql="Select Top "&MaxListRs&" * From CFWztg_AdUser_Order Where AdUserName='"&AdUserName&"'"


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
If Rs("OrderState")=2 Or Rs("OrderState")=6 Then
 Response.write "<input name='OrderCode_Sel' type='checkbox' id='OrderCode_Sel' value='"&Rs("ordercode")&"'>"
End If
%>
</td>
    <td><%=Rs("Ad_ID")%></td>
    <td><%=server.HTMLEncode(Rs("OrderCode"))%></td>    
    <td><%=server.HTMLEncode(Rs("OrderUser"))%></td>
    <td><%=GetTurnCent(Rs("OrderCent"))%>Ԫ</td>
	<td><%=Rs("OrderTcRate")%></td>
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
 Response.write "��ʱ���"
ElseIf Rs("OrderState")=6 Then'--�����û��ĵ㣬�ȴ�ȷ��
 Response.write "�ȴ�ȷ��"
ElseIf Rs("OrderState")=7 Then'--�����û��ĵ㣬ȷ�ϳɹ�
 Response.write "ȷ�ϳɹ�"
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


<td><%=Rs("LowUnionUserName")%></td>
<td>
<%
If Rs("OrderState")=2 Or Rs("OrderState")=6 Then
 Response.write "<a href='javascript:;' onclick=""$(function () { confirm('ȷ��Ҫ�Ѵ˶�������Ϊ�ɹ���', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdUser.aspx?Action=ordermodifysave&OrderCode="& Rs("OrderCode") &"')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});"" class=""btn_add""><i class=""mdi mdi-plus""></i> �ɹ�</a>"
 Response.write " <a href='javascript:;' onclick=""$(function () { confirm('ȷ��Ҫ�Ѵ˶�������Ϊʧ����', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdUser.aspx?Action=ordermodify_2save&OrderCode="& Rs("OrderCode") &"')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});"" class=""btn_del""><i class=""mdi mdi-window-close""></i> ʧ��</a>"
End If
%></td>
  </tr>
  
<tr>
<td colspan="13" style="border-color: #826666">
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

<tr>
    <td colspan="13">
<script>

function mysubmit(dotype)
{
var dotypestr


if(dotype=="ordermoremodifysave"){
 dotypestr="��ȷ��Ҫ����ѡ��Ķ�������Ϊ�ɹ�״̬��?";
}
else if(dotype=="ordermoremodify_2save"){
 dotypestr="��ȷ��Ҫ����ѡ��Ķ�������Ϊʧ��״̬��?";
}

document.form_orderlist.dotype.value = dotype;

if(confirm(dotypestr)){
 document.form_orderlist.submit();
}
 
}
</script>

<input type=hidden name="dotype" value="">

<a href="#" onclick="javascript:mysubmit('ordermoremodifysave');" class="btn btn-primary"><span>�޸���ѡ�񶩵�Ϊ�ɹ�״̬</span></a>
<a href="#" onclick="javascript:mysubmit('ordermoremodify_2save');" class="btn btn-primary"><span>�޸���ѡ�񶩵�Ϊʧ��״̬</span></a>
</td>
  </tr>
</table>
</form>

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
 searchurl += '&OrderCode=' + $('#OrderCode').val();
 searchurl += '&OrderUser=' + $('#OrderUser').val();
 searchurl += '&UserName=' + $('#UserName').val();
 searchurl += '&LowUnionUserName=' + $('#LowUnionUserName').val();
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
      <td class="td_r">�����ţ�</td>
      <td><input name="OrderCode" type="text" id="OrderCode" value="<%=OrderCode%>" size="20"></td></tr>
    <tr>
      <td class="td_r">�����ˣ�</td>
      <td><input name="OrderUser" type="text" id="OrderUser" value="<%=OrderUser%>" size="20"></td></tr>
    <tr>
      <td class="td_r">��վ����</td>
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
