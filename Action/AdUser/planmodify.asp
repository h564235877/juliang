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
Plan_ID=ChkStr(Request("Plan_ID"),2)

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select PlanName From CFWztg_Plan where ID="&Plan_ID&" And AdUserName='"&AdUserName&"'"
Rs.open Sql,Conn,1,1
PlanName=Rs("PlanName")
Rs.Close
%>

<SCRIPT>
$(function(){

$("#planmodifysave").click(function(){

if($('#PlanName').val()==""){
 alert('��������ƻ�����', '', function () {$("#PlanName").focus();});
 return false;
}


});

});
</script>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn" style="margin-top:10px;"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<form method="post" action="../../AdUser.aspx?Action=planmodifysave&Plan_ID=<%=Plan_ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>" name=form_planmodify id=form_planmodify>
<table class="tb_1" id='tbu'>
<tr class="tr_1">
<td colspan="2">�ƻ��޸�</td>
</tr>

<tr>
<td class="td_r">�ƻ����ƣ�</td>
<td>
<input name="PlanName" type="text" id="PlanName" style="width:300px" value="<%=PlanName%>" size="40"></td>
</tr>


<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="submit" id="planmodifysave" value="�޸ļƻ�" class="btn btn-primary">
</td>
</tr>

</table>
</form>
